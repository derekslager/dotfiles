base:
  '*':
    - emacs
    - hg.config
    - hg.reviewboard
    - git.config
    - zsh
    - package.basics
  'os:MacOS':
    - match: grain
    - osx.defaults
