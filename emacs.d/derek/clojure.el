(defun on-clojure-mode ()
  (require 'paredit)
  (paredit-mode t))

(eval-after-load "clojure-mode"
  '(when (package-installed-p 'ac-nrepl)
     (add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
     (add-hook 'cider-mode-hook 'ac-nrepl-setup)))

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

;; (add-hook 'nrepl-interaction-mode-hook 'my-nrepl-mode-setup)
;; (defun my-nrepl-mode-setup ()
;;   (require 'nrepl-ritz))

(add-hook 'clojure-mode-hook 'on-clojure-mode)
