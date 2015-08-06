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

;; Disable toolbar
(tool-bar-mode -1)

;; Disable menubar
(menu-bar-mode -1)

;; Disable scrollbars
(scroll-bar-mode -1)

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


;;; OCaml stuff

;; Setup environment variables using opam
(dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
  (setenv (car var) (cadr var)))

;; Update the emacs path
(setq exec-path (append (parse-colon-path (getenv "PATH"))
                        (list exec-directory)))

;; Update the emacs load path
(add-to-list 'load-path (expand-file-name "../../share/emacs/site-lisp"
                                          (getenv "OCAML_TOPLEVEL_PATH")))

;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)

;; Emacs can't always find the merlin path 
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(add-hook 'tuareg-mode 'tuareg-imenu-set-imenu)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
		("\\.topml$" . tuareg-mode))
	      auto-mode-alist))
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)
