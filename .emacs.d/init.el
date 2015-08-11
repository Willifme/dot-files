;; Packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

;; Don't create backup files
(setq make-backup-files nil)

;; Don't create auto-save files
(setq auto-save-default nil)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Only load spacegray if in the terminal
(if (display-graphic-p)
  (load-theme 'spacegray t))

(require 'evil)

(evil-mode 1)

;; Enable helm
(require 'helm-config)

(helm-mode 1)

;; For C-mode use 4 spaces for indent
(setq-default c-basic-offset 4)

(define-key evil-normal-state-map (kbd "C-p") 'helm-multi-files)

;; If not on Windows, use the relative-lumbers-mode which breaks on windows
(unless (not 'windows-nt) 
    ;; Enable relativeline numbers lobally
    (global-relative-line-numbers-mode))

;; Disable toolbar
(tool-bar-mode -1)

;; Disable menubar
(menu-bar-mode -1)

;; Disable scrollbars if running the GUI
(if (display-graphic-p)
    (scroll-bar-mode -1))

;; Default to using y or n for yes and no prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; Use default autocomplete config
(ac-config-default)

;; Use proper indentation for Org-mode
(add-hook 'org-mode-hook
	  (lambda ()
	    (org-indent-mode t))
	  t)

;; Enable paredit when using lisp's
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook #'enable-paredit-mode)

;; Rainbow delimiters
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'ielm-mode-hook #'rainbow-delimiters-mode)

(require 'windmove)

(define-key evil-normal-state-map (kbd "\S-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "\S-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "\S-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "\S-l") 'windmove-right)

;; If not using windows load the lisp stuff
(unless (not 'windows-nt)
  (load "~/.emacs.d/lisp.el")
  (load "~/.emacs.d/clojure.el"))

;; Bindings for evil-mode
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	                  (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; If not using windows load the OCaml stuff
(unless (not 'windows-nt)
    (load "~/.emacs.d/ocaml.el"))
