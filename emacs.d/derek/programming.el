;; base functions common to programming modes

;; find project files on load
(defun find-project-file (regexp)
  (when buffer-file-name
    (let (current-dir-contents
          parent-dir
          (current-dir (file-name-directory (buffer-file-name))))
      (while (and current-dir
                  (not (= 1 (length (setq current-dir-contents
                                          (directory-files
                                           current-dir
                                           t regexp t))))))
        (setq current-dir (directory-parent current-dir)))
      (car current-dir-contents))))
