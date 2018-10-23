;; base functions common to programming modes

(when (package-installed-p 'projectile)
  (require 'projectile)
  ;; prefer project files to repo root
  (setq projectile-project-root-files-functions
        '(projectile-root-local
          projectile-root-top-down
          projectile-root-bottom-up
          projectile-root-top-down-recurring))
  (setq projectile-create-missing-test-files t)
  (projectile-global-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

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
