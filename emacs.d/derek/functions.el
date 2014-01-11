(defun delete-blank-lines-and-trailing-whitespace ()
  (interactive)
  (delete-blank-lines)
  (delete-trailing-whitespace))

(defun directory-parent (directory)
  (let ((parent (file-name-directory (directory-file-name directory))))
    (if (not (equal directory parent))
        parent)))
