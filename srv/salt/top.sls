base:
  '*':
    - emacs
    - hg.config
    - hg.reviewboard
    - git.config
    - zsh
    - clojure
    - package.basics
  'os:MacOS':
    - match: grain
    - osx.defaults
