(setq nxml-slash-auto-complete-flag t)

(dolist (pattern '("\\.xml$" "\\.xul$" "\\.aspx$" "\\.master$" "\\.csproj$" "\\.proj$" "\\.targets$" "\\.ascx$" "\\.config$" "\\.config\\.template$" "\\.xaction$" "\\.fo$" "\\.xslt?$" "\\.post$" "\\.html" "\\.htm"))
  (add-to-list 'auto-mode-alist (cons pattern 'nxml-mode)))

(mapc
 (lambda (pair)
   (if (or (eq (cdr pair) 'xml-mode)
           (eq (cdr pair) 'html-mode))
       (setcdr pair 'nxml-mode)))
 magic-mode-alist)

(defun on-nxml-loaded ()
  ;; (flyspell-prog-mode)
  ; (require 'zencoding-mode)
  ; (zencoding-mode)
  ;(yas/minor-mode-off))
  )

(add-hook 'nxml-mode-hook 'on-nxml-loaded)
