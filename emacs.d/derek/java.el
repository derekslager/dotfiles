(defun on-java-loaded ()

  (let ((project-file (find-project-file "build\\.xml")))
    (when project-file
      (set (make-local-variable 'compile-command)
           (concat "ant -emacs -f " project-file))))

  (subword-mode))

(add-hook 'java-mode-hook 'on-java-loaded)
