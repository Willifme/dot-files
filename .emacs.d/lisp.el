;; Load slime
(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; Use clisp
(setq inferior-lisp-program "clisp")

(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
