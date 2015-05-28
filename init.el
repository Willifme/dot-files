;;; Initial Setup

;; Require package
(require 'package)

;; Repo's for ELPA
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;; Enable packages - Load them
(package-initialize)

;; Hide menu bar
(menu-bar-mode -1)

;; Hide tool-bar
(tool-bar-mode -1)

;; Disable scrollbars if not on a terminal
(if (display-graphic-p)
    (scroll-bar-mode -1))

;; Prevent the creation of backup files
(setq make-backup-files nil)

;; Set a default location for themes to be installed
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Load the theme
(load-theme 'gruvbox t)

;; Set font
(set-default-font "Droid Sans Mono")

;; Require neotree - Tree navigation
(require 'neotree)

;; Require ido-mode
(require 'ido)

;; Enable ido-mode
(ido-mode t)

;; Enable relative line numbers
(global-relative-line-numbers-mode)

;; Require Evil-mode
(require 'evil)

;; Enable Evil-mode itself
(evil-mode 1)

;; Switch between splits with control 
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))

;;; Magical voodo

;; Require key-chord
(require 'key-chord)

;; Enable key-chord
(key-chord-mode 1)

;; List of all possible keys for escaping
(setq keys '("hj" "hk" "hl" "jh" "jk" "jl" "kh" "kj" "kl" "lh" "lj" "lk"))

;; Iterate over the list and assign the shortcuts
(dolist (key keys)
  (setq key-chrod-two-keys-delay 0.2)
  (key-chord-define-global key 'evil-normal-state))

