(setq debug-on-error t)

;; Turn off blinking cursor

;;(blink-cursor-mode -1)

;; Disable start-screen
;;(setq inhibit-startup-message t)

;;(if (> emacs-major-version 23)

  ;;   (if (eq system-type 'darwin)
 	;; Load slime for Laptop
 ;;	(load (expand-file-name "~/quicklisp/slime-helper.el"))
       ;; Load slime for desktop
   ;;    (load (expand-file-name "/home/william/quicklisp/slime-helper.el")))

   ;;(require 'slime-autoloads)

   ;;(if (eq system-type 'darwin)
       ;; For laptop
     ;;  (setq inferior-lisp-program "/usr/local/Cellar/sbcl/1.2.0/bin/sbcl")
     ;;(setq inferior-lisp-program "clisp"))

   ;; Set lisp system 

   ;;(load (expand-file-name "~/quicklisp/slime-helper.el")))

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Load the current theme in use

;;(load-theme 'zenburn t)

;; Require package for package manager

;;(require 'package)

;; Add package manager archives
 
;;(setq package-archives 
  ;;    '(("marmalade" . "http://marmalade-repo.org/packages/")
;;	("elpa" . "http://tromey.com/elpa/")
  ;;      ("melpa" . "http://melpa.milkbox.net/packages/")
    ;;    ("gnu" . "http://elpa.gnu.org/packages/")))

;; Start package manage from packages manager

;;(package-initialize)

;; Load files installed from the package manager

;;(when
  ;;  (load
    ;; (expand-file-name "~/.emacs.d/elpa/elscreen/elscreen.el")))

;; Start ElScreen
;;(if (eq system-type 'gnu/linux)
  ;;  (elscreen-start))

;;(require 'auto-complete)

;;(require 'auto-complete-config)

;;(require 'auto-complete-clang-async)
  
;;(add-to-list 'ac-dictionary-directories "/Users/william/.emacs.d/elpa/auto-complete/dict")

;;(defun ac-cc-mode-setup()
  ;;(setq ac-clang-complete-executable "clang-complete")
  ;;(setq ac-sources '(ac-source-clang-async))
  ;;(ac-clang-launch-completion-process))

;;(defun my-ac-config ()
;  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
 ;; (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  ;;(global-auto-complete-mode t))

;;(my-ac-config)

;;(ac-config-default)

;;(require 'yasnippet)

;;(yas-global-mode 1)

;; Show line numbers
;;(global-linum-mode 1)

;; For playing mp3s on laptop

;;(if (eq system-type 'darwin)
  ;;  (setq exec-path (append exec-path '("/usr/local/bin")))
    ;;(add-to-list 'load-path "~/.emacs.d/elpa/emms/")
    ;;(require 'emms-setup)
    ;;(require 'emms-player-mplayer)
    ;;(emms-standard)
    ;;(emms-default-players)
    ;;(define-emms-simple-player mplayer '(file url)
     ;;(regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
;;		    ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
;;		    ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
  ;;    "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen"))

;; Define a function which initalises auto-complete-c-headers and gets called for c/c++ hooks
;;(defun my:ac-c-header-init() 
  ;;(require 'auto-complete-c-headers)
  ;;(add-to-list 'ac-sources 'ac-sources-c-headers)
  ;;(if (eq system-type 'darwin)
    ;;  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/5.1/include")))

;; Now lets call the above functions
;(add-hook 'c++-mode-hook 'my:ac-c-header-init)
;(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; Fix iedit bug Linux/Mac
;;(if (eq system-type 'gnu/linux)
  ;;  (define-key global-map (kbd "C-c ;") 'iedit-mode)
  ;;(define-key global-map (kbd "C-c ;") 'iedit-mode))

;; Start flymake-google-cpplint-load define a funnction for flymake initialisation
;(defun my:flymake-google-init()
 ; (require 'flymake-google-cpplint)
  ;(custom-set-variables
  ; '(executable-find "cpplint.py"))
  ;(flymake-google-cpplint-load))

;;(add-hook 'c-mode-hook 'my:flymake-google-init)
;(add-hook 'c++-mode-hook 'my:flymake-google-init)

;; Start Google-C-style with emacs
;;(require 'google-c-style)

;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Load go-mode files

;;(add-to-list 'load-path "~/.emacs.d/elpa/go-mode")

;; Require go-mode
;;(require 'go-mode)

;;(add-hook 'go-mode-hook
;;	  (lambda()
;;	    (setq-default)
;;	    (setq tab-width 4)
;;	    (setq standard-indent 2)
;;	    (setq indent-tabs-mode nil)))

;; Enable go-autocomplete
;;(require 'go-autocomplete)

;; For better indentation (I think) 

;;(global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)

;;(defun un-indent-by-removing-4-spaces ()
  ;;"remove 4 spaces from beginning of of line"
 ;; (interactive)
  ;;(save-excursion
    ;;(save-match-data
      ;;(beginning-of-line)
      ;; get rid of tabs at beginning of line
      ;;(when (concat "^" (make-string tab-width ?\ ))
      ;;  (untabify (match-beginning 0) (match-end 0)))
      ;;(when (looking-at "^    ")
        ;;(replace-match "")))))

;; Require org-mode
;; (require 'org)

;; ;; Set org-mode keybindings

;; (define-key global-map "\C-cl" 'org-store-link)

;; (define-key global-map "\C-ca" 'org-agenda)

;; ;; Set org-log-done to true

;; (setq org-log-done t)

;; ;; Enable shift select for org-mode

;; (setq shift-select-mode t)

;; (setq org-support-shift-select t)

;; Load powerline

;;(add-to-list 'load-path "~/.emacs.d/elpa/powerline")

;; Require powerline

;;(require 'powerline)

;;(powerline-default-theme)

;; Disable the creation of backup files
;;(setq make-backup-files nil)

;; Stop noise from being heard
;;(setq ring-bell-function 'ignore)

;; Enable neotree for tree view
;;(add-to-list 'load-path "~/.emacs.d/elpa/neotree")

;;(require 'neotree)

;; Set F8 to enable neotree

;;(global-set-key (kbd "C-x t r") 'neotree-toggle)

;; Stop flashing
;;(setq ac-use-fuzzy nil)

;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
;;  '(ansi-color-names-vector (vector "#cccccc" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#2d2d2d"))
;;  '(custom-enabled-themes (quote (flatland)))
;;  '(custom-safe-themes (quote ("2f3ee6f2408707dcd69a4e46650e1d5f2395a2244f22b89cf8dd407604061f66" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" default)))
;;  '(fci-rule-color "#393939")
;;  '(inhibit-startup-screen t)
;;  '(line-number-mode nil)
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
;; (put 'upcase-region 'disabled nil)

