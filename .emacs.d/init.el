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

;; Only load spacegray if running the GUI
 (if (display-graphic-p)
   (load-theme 'brin t))

(require 'evil)

(evil-mode 1)

;; Enable helm
(require 'helm-config)

(helm-mode 1)

;; For C-mode use 4 spaces for indent
(setq-default c-basic-offset 4)

(define-key evil-normal-state-map (kbd "C-p") 'helm-multi-files)

(global-linum-mode)

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
;;(ac-config-default)

;; Use proper indentation for Org-mode
(add-hook 'org-mode-hook
	  (lambda ()
	    (org-indent-mode t))
	  t)

;; Use the British dictionary instead
;;(setq ispell-dictionary "aspell")

;; Enable flyspell for org-mode
;; (add-hook 'org-mode-hook
;; 	  (lambda ()
;; 	    (setq ispell-program-name "aspell")
;; 	    (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_GB")) 
;; 	    (flyspell-mode 1)))

(require 'windmove)

(define-key evil-normal-state-map (kbd "\S-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "\S-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "\S-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "\S-l") 'windmove-right)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)

;; If not using windows load the lisp stuff
;; (unless (not 'windows-nt)
;;   (load "~/.emacs.d/lisp.el")
;;   (load "~/.emacs.d/clojure.el"))
