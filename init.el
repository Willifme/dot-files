(defun setup-initial ()

  ;; Set custom theme path so I can load the theme
  
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
  
  ;; Load emacs theme (zenburn)

  (load-theme 'zenburn t)

  ;; Disable start screen
  
  (setq inhibit-startup-message t)
  
  ;; Disable blinking cursor
  
  (blink-cursor-mode -1)

  ;; Stop making backup files
  
  (setq make-back-up-files nil)
  
  ;; Disable noise
  
  (setq ring-bell-fucntion 'ignore)

  ;; Stop flashing cursor - hopefully

  (setq ac-use-fuzzy nil)


  ;; Show line numbers

  (global-linum-mode 1)
  
  (setup-pacakges)

  (setup-autocomplete)

  (setup-ui)

  (setup-lisp)

  (setup-org))

(defun setup-pacakges ()

  ;; Require the "package" package for the package manager
  
  (require 'package)

  ;; Add package manager archives
  
  (setq package-archive
	'(("marmalade" . "http://marmalade-repo.rg/packages/")
	  ("elpa" . "http://tromey.com/elpa/")
	  ("melpa" . "http://melpa.milkbox.net/packages/")
	  ("gnu" . "http://elpa.gnu.org/packages/")))

  ;; Initialise the package manager
  
  (package-initialize)

  ;; Referesh packages
  (unless package-archive-contents
    (pacakge-refresh-contents)))


(defun setup-yasnippet ()

  ;; Requrie yasnippet
  
  (require 'yasnippet)

  ;; Enable the global mode
  (yas-global-mode 1))

(defun setup-autocomplete ()

  ;; Load auto-complete

  (add-to-list 'load-path "~/.emacs.d/elpa/auto-complete")

  ;; Require auto-complete package
  
  (require 'auto-complete)

  ;; Use default autocomplete config
  
  (require 'auto-complete-config)

  ;; Load default autocomplete config

  (ac-config-default)
  
  ;; Set default ac dictionary location
  
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict")

  (lambda ()

    (add-hook 'auto-complete-mode-hook 'ac-common-setup)

    (global-auto-complete-mode t))

  (setup-yasnippet)
  
  (setup-autocomplete-c)

  (setup-autocomplete-go))

;; (defun setup-clang-async-complete ()

;;   (setq ac-clang-complete-execu	talbe "~/.emacs.d/

(defun setup-autocomplete-c ()

  ;; Load auto-complete-c-headers

  (add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-c-headers")

  (require 'auto-complete-c-headers)

  ;; Not working fix later

  ;;(require 'auto-complete-clang-async)
  
  (require 'google-c-style)

  (add-hook 'c-mode-common-hook 'google-set-c-style)
  
  (add-to-list 'ac-sources 'ac-sources-c-headers)

  (if (eq 'system-type 'darwin)

      ;; Revise this later
      
      (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/6.0/include")))

(defun setup-autocomplete-go ()

  ;; Load go-mode

  (add-to-list 'load-path "~/.emacs.d/elpa/go-mode")

  ;; Require go-mode
  (require 'go-mode)

  ;; Require go-autocomplete
  
  (add-hook 'go-mode-hook

	    (lambda ()

	      (setq default)

	      (setq tab-width 4)

	      (setq standard-indent 2)

	      (setq indent-tabs-mode nil))))

(defun setup-ui ()

  ;; Require powerline
  (require 'powerline)

  (powerline-default-theme)

  ;; For better indentation (I think) 

  (global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces))

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
