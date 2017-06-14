(when (package-installed-p 'yasnippet)
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")

  (yas-global-mode 1)
  ; (yas-reload-all)

  (setq yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt yas/completing-prompt yas/x-prompt yas/no-prompt)))
