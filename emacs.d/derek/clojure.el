(defun on-clojure-mode ()
  (require 'paredit)
  (paredit-mode t))

(eval-after-load "clojure-mode"
  '(when (package-installed-p 'ac-cider-compliment)
     (add-hook 'cider-mode-hook 'ac-cider-compliment-setup)))

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))

(add-hook 'clojure-mode-hook 'on-clojure-mode)

(defvar lein-try-history nil)
(defun lein-try (lib-name)
  (interactive (list (read-string "What are we going to try today?: " nil 'lein-try-history)))
  (switch-to-buffer (concat "*lein-try-" lib-name "*"))
  (inferior-lisp (concat "bash lein try " lib-name)))
