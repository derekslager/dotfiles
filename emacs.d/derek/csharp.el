;; c# mode

;; hack, c# mode causes problems if this isn't loaded
(when (package-installed-p 'flymake)
  (require 'flymake))

(global-set-key [(control ?c) ?#] 'csharp-mode)

(eval-after-load "compile"
  '(progn
     (setq compilation-error-regexp-alist nil)

     (setq compilation-error-regexp-alist
	   (append '(("\\(\\([_a-zA-Z]:\\)?[^:(\t\n]+\\)(\\([0-9]+\\)[,]\\([0-9]+\\)): \\(error\\|warning\\) CS[0-9]+:" 1 3 4))
		   compilation-error-regexp-alist))

     ;; SourceAnalysis
     (setq compilation-error-regexp-alist
	   (append '(("\\([a-zA-Z0-9][0-9]*[^>\t \n]\\([_a-zA-Z]:\\)?[^:(\t\n]+\\)(\\([0-9]+\\)[,]\\([0-9]+\\)): \\(error\\|warning\\) : SA[0-9]+:" 1 3 4))
		   compilation-error-regexp-alist))

     ;; FxCop
     (setq compilation-error-regexp-alist
	   (append '(("[ ]*\\(\\([_a-zA-Z]:\\)?[^:(\t\n]+\\)(\\([0-9]+\\)[,]\\([0-9]+\\)) : \\(error\\|warning\\)  : CA[0-9]+ : " 1 3 4))
		   compilation-error-regexp-alist))))

(defun csharp-replace-double-quotes-with-string-empty (arg)
  (interactive "*P")
  (self-insert-command (prefix-numeric-value arg))
  (save-excursion
    (when (re-search-backward "\\([^\\]\\)\"\"" (- (point) 10) t)
      (replace-match "\\1String.Empty" t))))

(defun csharp-lineup-method-declaration-after-attribute (elem)
  (let ((anchor (cdr elem)))
    (if (string-equal "[" (buffer-substring anchor (+ anchor 1)))
        0
      '+)))

(defun match-length ()
  (- (match-end 0) (match-beginning 0)))

;; bind to topmost-intro-cont
(defun csharp-lineup-anonymous-class-initialization-continuation (elem)
  (let ((anchor (cdr elem))
        (c))
    ;; search backwards for 'new { ', stopping at anchor
    (save-excursion
      (back-to-indentation)
      (setq c (current-column))
      (if (re-search-backward "new ?{ ?" anchor t)
          ;; found it, indent current line
          (let ((difference (- (+ (current-column) (match-length)) c)))
            (make-vector 1 (+ c difference)))
        0))))

; Java-like C# style with solid auto newline support.
(defconst csharp-c-style
  '((c-basic-offset . 4)
    (c-comment-only-line-offset 0 . 0)
    (c-hanging-braces-alist .
     ((substatement-open . (after))
      (statement-cont)
      (inline-open . (after))
      (inline-close)
      (block-close . (after))
      (namespace-open . (after))
      (namespace-close . (after))
      (brace-list-open)
      (brace-list-close)
      (brace-list-intro)
      (class-open . (after))
      (defun-open . (after))
      (defun-close)))
    (c-cleanup-list .
     (brace-else-brace
      brace-elseif-brace
      brace-catch-brace
      defun-close-semi
      list-close-comma))
    (c-offsets-alist .
     ((inline-open . 0)
      (topmost-intro-cont . csharp-lineup-anonymous-class-initialization-continuation)
      (case-label . 0)
      (statement-case-intro . +)
      (statement-case-open . 0)
      (statement-cont . csharp-lineup-method-declaration-after-attribute)
      (arglist-intro . +)
      (arglist-cont-nonempty . c-lineup-arglist-intro-after-paren)
      (arglist-close . c-lineup-arglist)
      (inher-cont . c-lineup-java-inher)))))

(c-add-style "csharp" csharp-c-style)

(defun on-csharp-loaded ()

  (c-set-style "csharp")

  (use-local-map csharp-mode-map)
  (define-key csharp-mode-map "\"" 'csharp-replace-double-quotes-with-string-empty)

  ;; electric keys suck
  (define-key csharp-mode-map "{" 'self-insert-command)

  (subword-mode)
  (c-toggle-auto-newline -1)

  ; Give extra fill space to compensate for namespace nesting.
  (setq fill-column (+ c-basic-offset fill-column))
  (setq tab-width c-basic-offset) ; maintain sanity when encountering tab-ridden code

  ; Use xml documentation tags as paragraph separators so filling
  ; works nicely in elements for which multi-line comments are preferred.
  ; How great is Emacs?
  (let ((xmldoc-para-rx "\\|[ ]*/// </?\\(summary\\|remarks\\|para\\)>$"))
    (setq paragraph-start (concat paragraph-start xmldoc-para-rx))
    (setq paragraph-separate (concat paragraph-separate xmldoc-para-rx)))

  ; Uncomment to spell check comments.
  ; (require 'flyspell)
  ; (flyspell-prog-mode)

  ;; (when (and buffer-file-name
  ;;            (string-match "scratch/.*\\.cs\\'" buffer-file-name))
  ;;   (set-scratch-file-compilation-command))

  (let ((project-file (find-project-file "\.csproj$")))
    (when project-file
      (message "Found project file at %s" project-file)
      (set (make-local-variable 'compile-command)
	   (concat "C:/Windows/Microsoft.NET/Framework/v4.0.30319/MSBuild.exe /m /v:q /p:GenerateFullPaths=true \"" project-file "\" /p:StyleCop=false /p:BuildProjectReferences=true")))))

(add-hook 'csharp-mode-hook 'on-csharp-loaded)
