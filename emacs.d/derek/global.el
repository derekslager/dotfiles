;; if you can only set one variable, set this one
(setq-default indent-tabs-mode nil)

;; go. away.
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t)

;; "advanced" features
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)

;; essential when working across branches
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; remember where we were
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/places")
(require 'saveplace)

;; clean old buffers
(require 'midnight)
(setq clean-buffer-list-delay-general 7)
(timer-activate midnight-timer)

;; go big or go home
(setq large-file-warning-threshold 67108864)

;; move mouse cursor when it impacts text
(mouse-avoidance-mode 'exile)

;; save state on exit
(desktop-save-mode 1)
(setq desktop-globals-to-save '(desktop-missing-file-warning search-ring regexp-search-ring register-alist file-name-history))
;; save desktop periodically
(run-with-timer (* 60 60) (* 30 60) 'desktop-save (car desktop-path))

;; can't hack lisp without it
(show-paren-mode t)
(setq show-paren-delay 0.5)

(column-number-mode)

(setq recentf-save-file "~/.emacs.d/recentf")
(recentf-mode)

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq default-abbrev-mode t)
(setq save-abbrevs 'silently)

;; make dabbrev more functional
(setq dabbrev-case-fold-search nil)

;; misc useful settings
(setq-default case-fold-search t)
(setq enable-recursive-minibuffers t)

;; live dangerously
(setq dired-recursive-deletes 'top)

(setq compilation-scroll-output t)

(when (package-installed-p 'company)
  (add-hook 'after-init-hook 'global-company-mode))

;; start off find-file in a convenient place
(cd (expand-file-name "~"))

;; system specific customizations

;; mac os x
(if (string-equal system-type "darwin")
    (progn
      (setq ns-alternate-modifier 'meta
            ns-command-modifier 'meta)
      ;; make homebrew apps available when starting from Dock
      (add-to-list 'exec-path "/usr/local/bin")
      (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH"))))
  ;; remove menu bar in non-mac os x
  (menu-bar-mode -1)
  ;; w32
  (when (string-equal system-type "windows-nt")
    (load (concat elisp-root "/w32"))))

(server-start)
