(setq theme-preferences '(flatland twilight))

(require 'cl)

;; load the first available theme
(when window-system
  (let* ((themes (custom-available-themes))
	 (theme (some (lambda (x) (memq x themes)) theme-preferences)))
    (when theme (load-theme (car theme)))))

(when (package-installed-p 'company)
  (require 'color)
  (let ((bg (face-attribute 'default :background)))
    (custom-set-faces
     `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
     `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
     `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
     `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
     `(company-tooltip-common ((t (:inherit font-lock-constant-face))))
     `(company-tooltip-common-selection ((t (:inherit font-lock-function-name-face))))
     `(company-preview-common ((t (:inherit font-lock-function-name-face))))
     `(company-preview-search ((t (:background ,(color-lighten-name bg 2))))))))
