(setq uid "derek")
(setq elisp-root (concat "~/.emacs.d/" uid))

(setq custom-file (concat elisp-root "/custom.el"))
(load custom-file 'noerror)

(dolist (library
         '("package" "theme" "global" "bindings" "ido" "smex" ;base
           "functions" "programming" "insert"		      ;misc
           "erc" "org"					      ;tools
           "yasnippet" "csharp" "java" "javascript" "css" "clojure" "hg")) ;programming
  (load (concat uid "/" library)))

;; assume files in the private directory are order-independent, and
;; load them all
(dolist (library (directory-files (concat elisp-root "/private" ) nil "\\.el$"))
  (load (concat uid "/private/" (file-name-sans-extension library))))
