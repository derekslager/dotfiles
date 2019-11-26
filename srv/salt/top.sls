base:
  '*':
    - emacs
    - hg.config
    - git.config
    - zsh
    - clojure
    - package.basics
  'os:MacOS':
    - match: grain
    - osx.defaults
    - osx.maintenance
