;; Packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

;; Don't create backup files
(setq make-backup-files nil)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Only load spacegray if in the terminal
(unless (display-graphic-p)
  (load-theme 'spacegray t))

;; Require relative linenumbers
(require 'linum-relative)

;; Enable line number mode
(global-linum-mode)

(require 'evil)

(evil-mode 1)

;; Enable helm
(require 'helm-config)

;; Use helm M-x
(global-set-key (kbd "M-x") 'helm-M-x)

(define-key evil-normal-state-map (kbd "C-p") 'helm-multi-files)

;; Disable toolbar
(tool-bar-mode -1)

;; Disable menubar
(menu-bar-mode -1)

;; Use default autocomplete config
(ac-config-default)

;; Load slime
(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; Use clisp
(setq inferior-lisp-program "clisp")

;; Enable paredit when using lisp's
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

(require 'windmove)

(define-key evil-normal-state-map (kbd "\S-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "\S-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "\S-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "\S-l") 'windmove-right)

;; Bindings for evil-mode
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	                  (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
