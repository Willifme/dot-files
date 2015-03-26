(defun setup-initial ()

  ;; Load the utils for things like isOSX
  (load "~/.emacs.d/utils.el")

  ;; Load the languages setup functions
  (load "~/.emacs.d/setup-languages.el")

  ;; Load the autocomplete functions
  (load "~/.emacs.d/setup-autocomplete.el")
  
  (setup-packages)

  (setup-environment)
  
  (setup-autocomplete)

  (setup-ui)

  (setup-lisp)

  (setup-ocaml)

  (setup-clojure)

  (setup-go)

  (setup-org))
 
(defun setup-environment ()

  ;; Have better buffer switching
  (ido-mode 1)
  
  ;; Set custom theme path so I can load the theme
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

  ;; Set to have a transparent background
 ;; (set-frame-parameter (selected-frame) 'alpha '(88 70))
 
  ;; Set tab width to be 4 spaces
  (setq-default indent-tabs-mode nil)

  (setq-default tab-width 4)
 
  ;; Load emacs theme 
  (load-theme 'twilight t)

  ;; Disable start screen
  (setq inhibit-startup-message t)
  
  ;; Disable blinking cursor
  (blink-cursor-mode -1)

  ;; Stop making backup files
  (setq make-back-up-files nil)
  
  ;; Disable noise 
  (setq ring-bell-function 'ignore)

  ;; Stop flashing cursor - hopefully
  (setq ac-use-fuzzy nil)

  ;; Require evil-mode (vim keybindings)
  (require 'evil)

  ;; Enable evil mode
  (evil-mode 1)

  ;; Switch frames using the control/meta key
  (isOS 'darwin 
          '(lambda ()
             (windmove-default-keybindings 'meta))
          '(lambda ()
             (windmove-default-keybindings 'control))))

(defun setup-ui ()

  ;; Hide menu bar
  (menu-bar-mode 0)

  ;; Hide tool bar
  (tool-bar-mode 0)

  ;; Require powerline
  ;;(require 'powerline)

;;  (powerline-default-theme)

  ;; Set default font
  (set-face-attribute 'default nil :family "Inconsolata" 
                      :height (case system-type
                                ('gnu/linux 130)
                                ('darwin 145)) :weight 'normal)

  ;; Show line numbers
  (global-linum-mode 1)

  ;; Show time on line
  (display-time)

  ;; Bind Ctrl-P to do fuzzy file search
  (global-set-key (kbd "C-x p") 'fiplr-find-file)

  ;; For better indentation (I think) 
  (global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)
  
  (add-hook 'prog-mode-hook 'font-lock-comment-annotations))

(defun setup-packages ()

  ;; Require the "package" package for the package manager
  (require 'package)

  ;; Add package manager archives
  (setq package-archives
  	'(("marmalade" . "http://marmalade-repo.org/packages/")
  	  ("elpa" . "http://tromey.com/elpa/")
  	  ("melpa" . "http://melpa.milkbox.net/packages/")
  	  ("gnu" . "http://elpa.gnu.org/packages/")))

  ;; Initialise the package manager
  (package-initialize)

  ;; Referesh packages
  (unless package-archive-contents
    (pacakge-refresh-contents)))

;; Call the main function to start the config
(setup-initial)
