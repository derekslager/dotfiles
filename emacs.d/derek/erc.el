;; global settings for erc
;; set erc-nickserv-passwords, erc-autojoin-channels-alist, etc via custom.el

(setq erc-nick "nullptr"
      erc-user-full-name "Derek Slager"
      erc-interpret-mirc-color t
      erc-modules '(autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands notify readonly ring services sound stamp track)
      erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "333" "353")
      erc-track-list-changed-hook '(lambda () (ding t))
      erc-prompt-for-nickserv-password nil)
