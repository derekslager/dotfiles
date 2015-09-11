(ido-mode t)

(setq ido-mode '(both)
      ido-auto-merge-delay-time 9999
      ido-cannot-complete-command 'ido-next-match
      ido-create-new-buffer 'always
      ido-enable-flex-matching t
      ido-enable-regexp nil
      ido-file-extensions-order '(".cs" t "")
      ido-ignore-buffers '("\\` ")
      ido-show-dot-for-dired nil)

(when (package-installed-p 'ido-vertical-mode)
  (ido-vertical-mode))
