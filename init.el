(defun setup-initial ()
 
  (load "~/.emacs.d/utils.el")
 
  ;; Have better buffer switching
  (ido-mode 1)
 
  ;; Set custom theme path so I can load the theme
  
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

  ;; Hide menu bar
  (menu-bar-mode 0)

  ;; Hide tool bar
  (tool-bar-mode 0)

  ;; Set to have a transparent background
 ;; (set-frame-parameter (selected-frame) 'alpha '(88 70))
 
  ;; Set tab width to be 4 spaces
  (setq-default indent-tabs-mode nil)

  (setq-default tab-width 4)
 
  ;; Load emacs theme (hipster)

  (load-theme 'bubbleberry t)

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

  ;; Switch frames using the control/meta key

  (isOSX '(lambda ()

	    (windmove-default-keybindings 'meta))
	 
	 '(lambda ()
	    
	    (windmove-default-keybindings 'control)))

  ;; (if (eq 'system-type 'darwin)

  ;;     ;; Fix for OSX
      
  ;;     (windmove-default-keybindings 'meta)

  ;;   ;; Other OSs uses control
    
  ;;   (windmove-default-keybindings 'control))
    
  ;; Show line numbers

  (global-linum-mode 1)
  
  (setup-packages)

  (setup-autocomplete)

  (setup-ui)

  (setup-lisp)

  (setup-ocaml)

  (setup-clojure)

  (setup-org))

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

  (require 'evil)

  (evil-mode 1)

  ;; Referesh packages
  (unless package-archive-contents
    (pacakge-refresh-contents)))


(defun setup-yasnippet ()

  ;; Requrie yasnippet
  
  (require 'yasnippet)

  ;; Enable the global mode
  (yas-global-mode 1))

(defun setup-autocomplete ()

  ;; Load flycheck
;;  (add-hook 'after-init-hook #'global-flycheck-mode)

  ;; Load auto-complete

  (add-to-list 'load-path "~/.emacs.d/elpa/auto-complete")

  ;; Require auto-complete package
  
  (require 'auto-complete)

  ;; Use default autocomplete config
  
  (require 'auto-complete-config)

  ;; Load default autocomplete config

  (ac-config-default)

  (global-auto-complete-mode t)

  (setq ac-auto-show-menu 0)

  (setq ac-show-menu-immediately-on-auto-complete t)
  
  ;; Set default ac dictionary location
  
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict")

  (lambda ()

    (add-hook 'auto-complete-mode-hook 'ac-common-setup)

    (global-auto-complete-mode t))

  (setup-yasnippet)
  
  (setup-autocomplete-c)

  (setup-autocomplete-go))

(defun setup-autocomplete-c ()

  ;; Load auto-complete-c-headers

  (add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-c-headers")

  (require 'auto-complete-c-headers)

  
  (add-to-list 'ac-sources 'ac-sources-c-headers)

  (isOSX '(lambda ()

	 ;; Revise this later
	     
	 (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/6.0/include"))))

(defun setup-autocomplete-go ()

  ;; Load go-mode

  (add-to-list 'load-path "~/.emacs.d/elpa/go-mode")

  ;; Require go-mode
  (require 'go-mode-autoloads)

  ;; Require go-autocomplete
  
  (add-hook 'go-mode-hook

	    (lambda ()

	      (setq default)

	      (setq tab-width 4)

	      (setq standard-indent 2)

	      (setq indent-tabs-mode nil))))

(defun setup-clojure ()

  ;; Autoload paredit with clojure-mode
  (add-hook 'clojure-mode-hook #'paredit-mode)

  ;; Set an alias to start cider better
  (defalias 'cider-start 'cider-jack-in))

(defun setup-ui ()

  ;; Require powerline
  (require 'powerline)

  (powerline-default-theme)

  ;; Set default font
  (set-face-attribute 'default nil :family "Inconsolata" 
                      :height (case system-type
                                ('gnu/linux 130)
                                ('darwin 145)) :weight 'normal)

  ;; Show time on powerline
  (display-time)

  ;; Bind Ctrl-P to do fuzzy file search
  (global-set-key (kbd "C-x p") 'fiplr-find-file)

  ;; For better indentation (I think) 

  (global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)
  
  (add-hook 'prog-mode-hook 'font-lock-comment-annotations))

(defun setup-lisp ()

  (if (not (eq system-type 'windows-nt))
	   
	   (load (expand-file-name "~/quicklisp/slime-helper.el"))

	   (setq inferior-lisp-program "sbcl")))
      
  ;; (if (> emacs-major-version 23)

  ;;     ;; (if (eq system-type 'darwin)
  ;;     ;; 	  ;; Load slime for Laptop
  ;;     ;; 	  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;;     ;; 	;; Load slime for desktop
  ;;     ;; 	(load (expand-file-name "/home/william/quicklisp/slime-helper.el")))

      
      
  ;;   (require 'slime-autoloads)

  ;;   (if (eq system-type 'darwin)
  ;; 	;; For laptop
  ;; 	(setq inferior-lisp-program "sbcl")
  ;;     (setq inferior-lisp-program "clisp"))

  ;;   ;; Set lisp system 

  ;;   (load (expand-file-name "~/quicklisp/slime-helper.el"))))

(defun setup-ocaml ()

  ;; Load tuareg - OCaml for Emacs

  (add-to-list 'load-path "~/.emacs.d/elpa/tuareg")

  ;; Have tuareg auto-load when appropiate

  (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)

  ;; Load tuareg-mode when the correct file extension is found

  (setq auto-mode-alist

	(append '(("\\.ml[ily]?$" . tuareg-mode)

		  ("\\.topml$" . tuareg-mode))

		auto-mode-alist))

  ;; Clear things 

  (setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))

  (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

  ;; Load merlin mode

  (require 'merlin)

  ;; When tuareg-mode loads load merlin-mode

  (add-hook 'tuareg-mode 'merlin-mode)

  ;; Merlin now uses auto-complete for completion

  (setq merlin-use-auto-complete-mode 'easy))

(defun setup-org ()
  
  ;; Require org-mode
  (require 'org)

  ;; Set org-mode keybindings

  (define-key global-map "\C-cl" 'org-store-link)

  (define-key global-map "\C-ca" 'org-agenda)

  ;; Set org-log-done to true

  (setq org-log-done t)

  ;; Enable shift select for org-mode

  (setq shift-select-mode t)

  (setq org-support-shift-select t))

(defun un-indent-by-removing-4-spaces ()
  
  "remove 4 spaces from beginning of of line"
  
  (interactive)
  
  (save-excursion
    
    (save-match-data
      
      (beginning-of-line)
      
      ;; get rid of tabs at beginning of line
      
      (when (concat "^" (make-string tab-width ?\ ))
	
        (untabify (match-beginning 0) (match-end 0)))
      
      (when (looking-at "^    ")
	
        (replace-match "")))))

(setup-initial)
