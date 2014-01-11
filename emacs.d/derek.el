(setq uid "derek")
(setq elisp-root (concat "~/.emacs.d/" uid))

(setq custom-file (concat elisp-root "/custom.el"))
(load custom-file 'noerror)

(dolist (library
         '("package" "theme" "global" "bindings" "ido" "smex" ;base
           "functions" "programming" "insert"		      ;misc
           "erc" "org"					      ;tools
           "csharp" "java" "javascript" "css" "clojure" "hg" "yasnippet")) ;programming
  (load (concat uid "/" library)))
