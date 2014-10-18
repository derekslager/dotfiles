;; all things javascript

(autoload 'js2-mode "js2-mode" "JavaScript editing mode" t)
(setq auto-mode-alist (append '(("\\.js$" . js2-mode)) auto-mode-alist))

(setq js2-basic-offset 4
      js2-bounce-indent-flag t
      js2-cleanup-whitespace nil
      js2-enter-indents-newline nil
      js2-highlight-level 3
      js2-mirror-mode nil
      js2-rebind-eol-bol-keys nil
      js2-use-font-lock-faces t)

(defun on-javascript-loaded ()
  (when (package-installed-p 'js-comint)
    (require 'js-comint)
    ;; (setq inferior-js-program-command
    ;;       (concat "java -cp " (expand-file-name "~/Downloads/rhino1_7R2/js.jar") " org.mozilla.javascript.tools.shell.Main"))
    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
    (local-set-key "\C-cb" 'js-send-buffer)
    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
    (local-set-key "\C-c\C-r" 'js-send-region)
    (local-set-key "\C-cl" 'js-load-file-and-go))
  (when (fboundp 'prettify-symbols-mode)
    (setq prettify-symbols-alist '(("function" . ?ƒ))))
  (subword-mode))

(eval-after-load "js2-mode"
  '(let ((closure-snippets "~/dev/closure-snippets/emacs"))
     (when (file-exists-p closure-snippets)
       (add-to-list 'load-path closure-snippets)
       (require 'closure-snippets-support)
       (yas/load-directory closure-snippets))))

(add-hook 'js2-mode-hook 'on-javascript-loaded)
