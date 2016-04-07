(global-set-key "\M-?" 'help-command)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key [f5] 'revert-buffer)

(global-set-key "\C-xc" 'compile)

(global-set-key "\C-x\S-s" 'eshell)

(global-set-key "\C-x\C-o" 'delete-blank-lines-and-trailing-whitespace)

(global-set-key [(control ?/)] 'PC-lisp-complete-symbol)

(global-set-key "\C-z" (lambda () (interactive) (w32-send-sys-command 61696)))

(global-set-key [(control meta delete)] 'backward-kill-sexp)
(global-set-key [(control meta backspace)] 'backward-kill-sexp)

(global-set-key [up] (lambda () (interactive) (scroll-down 1)))
(global-set-key [down] (lambda () (interactive) (scroll-up 1)))

(global-set-key [left] (lambda () (interactive) (scroll-right tab-width t)))
(global-set-key [right] (lambda () (interactive) (scroll-left tab-width t)))

(global-set-key [(shift up)] 'previous-line)
(global-set-key [(shift down)] 'next-line)

(global-set-key [(shift left)] 'backward-char)
(global-set-key [(shift right)] 'forward-char)

;; windmove
(global-set-key [(control left)] 'windmove-left)
(global-set-key [(control right)] 'windmove-right)
(global-set-key [(control up)] 'windmove-up)
(global-set-key [(control down)] 'windmove-down)

(global-set-key [(control meta ?\;)] 'comment-region)

;; Let Natural Keyboard 4000's Zoom buttons cycle buffers.
(global-set-key [(control wheel-up)] 'bs-cycle-previous)
(global-set-key [(control wheel-down)] 'bs-cycle-next)

;; kill buffer without a chord
(global-set-key [(control shift ?k)] '(lambda () (interactive) (kill-buffer (current-buffer))))

;; CVS Emacs is binding this to recenter-top-bottom.
(global-set-key [(control ?l)] 'recenter)

;; imenu is useful if it can be invoked quickly
(global-set-key [(control shift ?o)] 'imenu)

(global-set-key [(control ?c) ? ] 'ace-jump-mode)

(global-set-key [(control ?x) ?g] 'magit-status)

(when (package-installed-p 'key-chord)
  (require 'key-chord)
  (key-chord-mode 1)
  (key-chord-define-global "xo" 'other-window)
  (key-chord-define-global "xb" 'ido-switch-buffer)
  (key-chord-define-global "x0" 'delete-window)
  (key-chord-define-global "x9" 'delete-other-windows)
  (key-chord-define-global "x-" 'split-window-below)
  (key-chord-define-global "x\\" 'split-window-right)
  (setq key-chord-two-keys-delay 0.025))

;; Enable C-o to launch occur while in an isearch, amazingly handy.
(define-key isearch-mode-map (kbd "C-o")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
               (regexp-quote isearch-string))))))
