(auto-insert-mode)

(setq auto-insert-directory "~/.emacs.d/insert")

(add-to-list 'auto-insert-alist
             '(("\\.xslt?\\'" . "XSLT template file") . "xslt.template"))
(add-to-list 'auto-insert-alist
             '(("\\.html?\\'" . "XHTML template file") . "xhtml.template"))
