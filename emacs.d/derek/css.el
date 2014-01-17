(autoload 'css-mode "css-mode")
(setq auto-mode-alist
    (cons '("\\.css$" . css-mode) auto-mode-alist))

(defun on-css-loaded ()
  (when (package-installed-p 'rainbow-mode)
    (require 'rainbow-mode)
    (rainbow-turn-on)))

(add-hook 'css-mode-hook 'on-css-loaded)

(setq-default cssm-indent-level 4)
(setq-default cssm-indent-function 'cssm-c-style-indenter)
