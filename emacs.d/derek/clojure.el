(eval-after-load 'clojure-mode
  '(progn
     (define-clojure-indent
       ;; core.async
       (go 1)
       (go-loop 1)
       ;; om-tools
       (defcomponent 'defun)
       (defcomponentk 'defun)
       (did-mount 1)
       (will-unmount 1)
       (init-state 1)
       (render 1)
       (render-state 1)
       (will-mount 1)
       (will-receive-props 1)
       (will-update 1))))

(defun on-clojure-mode ()
  (require 'paredit)
  (paredit-mode t)
  (when (package-installed-p 'yasnippet)
    (yas/minor-mode 1))
  (when (package-installed-p 'clj-refactor)
    (clj-refactor-mode 1)
    (cljr-add-keybindings-with-prefix "C-c r")))

(add-hook 'clojure-mode-hook 'on-clojure-mode)

(defvar lein-try-history nil)
(defun lein-try (lib-name)
  (interactive (list (read-string "What are we going to try today?: " nil 'lein-try-history)))
  (switch-to-buffer (concat "*lein-try-" lib-name "*"))
  (inferior-lisp (concat "lein try " lib-name)))
