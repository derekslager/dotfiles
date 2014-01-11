(setq theme-preferences '(flatland twilight))

(require 'cl)

;; load the first available theme
(when window-system
  (let* ((themes (custom-available-themes))
	 (theme (some (lambda (x) (memq x themes)) theme-preferences)))
    (when theme (load-theme (car theme)))))
