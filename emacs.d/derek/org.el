(defun on-org-loaded ()
  ;; revert our up/down remappings in org-mode only
  (define-key org-mode-map [up] 'previous-line)
  (define-key org-mode-map [down] 'next-line))

(add-hook 'org-mode-hook 'on-org-loaded)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

(setq org-agenda-custom-commands
      '(("w" "Agenda and tasks, non-personal"
         ((agenda "")
          (tags-todo "-PERSONAL")))
        ("p" "Agenda and tasks, personal"
         ((tags-todo "PERSONAL")
          (agenda "")))))
