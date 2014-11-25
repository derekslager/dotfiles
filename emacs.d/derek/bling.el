(when (package-installed-p 'nyan-mode)
  (nyan-mode 1)
  (setq nyan-bar-length 16
        nyan-wavy-trail t)
  (nyan-start-animation))
