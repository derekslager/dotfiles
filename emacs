;(package-initialize)

(setq uid "derek")
(setq elisp-root (concat "~/.emacs.d/" uid))

(setq custom-file (concat elisp-root "/custom.el"))
(load custom-file 'noerror)

(dolist (library
         '("package" "theme" "bling" "global" "bindings" "ido" "smex"
           "functions" "programming" "insert"
           "erc" "org"
           "nxml" "yaml"
           "yasnippet" "csharp" "java" "javascript" "css" "clojure" "hg"))
  (load (concat elisp-root "/" library)))

;; assume files in the private directory are order-independent, and
;; load them all
(let ((private-root (concat elisp-root "/private" )))
  (when (file-exists-p private-root)
    (dolist (library (directory-files private-root nil "\\.el$"))
      (load (concat elisp-root "/private/" (file-name-sans-extension library))))))
