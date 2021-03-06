(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Disable toolbar
(tool-bar-mode -1)

;; Disable menubar
(menu-bar-mode -1)

;; Enable line numbers
(global-linum-mode 1)

(require 'evil)
(evil-mode 1)

(require 'helm-config)
;;(helm-mode 1)

(require 'windmove)
(define-key evil-normal-state-map (kbd "\S-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "\S-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "\S-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "\S-l") 'windmove-right)

(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd "\C-p") 'helm-find-files)
(define-key evil-normal-state-map (kbd "\S-p") 'helm-mini)
(define-key evil-normal-state-map (kbd "\C-x b") 'helm-mini)

(load-theme 'atom-one-dark t)
