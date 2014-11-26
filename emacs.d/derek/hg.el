;; mercurial

(when (package-installed-p 'ahg)
  (require 'ahg))

(defun hg-pull (&optional arg)
  (interactive "P")
  (shell-command
   (concat "hg pull" (if arg "" " -u") "&")))

(global-set-key [(control x) ?v ?w] '(lambda () (interactive) (shell-command "hg view&")))
(global-set-key [(control x) ?v ?>] '(lambda () (interactive) (shell-command "hg push&")))
(global-set-key [(control x) ?v ?.] '(lambda () (interactive) (shell-command "hg out&")))
(global-set-key [(control x) ?v ?<] 'hg-pull)
(global-set-key [(control x) ?v ?\,] '(lambda () (interactive) (shell-command "hg in&")))
