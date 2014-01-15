(setq high-dpi nil)

(let (font-name)
  (setq font-name
	(if high-dpi
	    "-outline-Consolas-normal-r-normal-normal-17-102-120-120-c-*-iso8859-1"
	  "-outline-Consolas-normal-r-normal-normal-13-97-96-96-c-*-iso8859-1"))
  (modify-all-frames-parameters (list (cons 'font font-name))))

;; when using a machine with symantec endpoint protection, this can
;; prevent horrible slowdowns
(setq w32-get-true-file-attributes nil)
