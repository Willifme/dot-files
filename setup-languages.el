(defun setup-go ()

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
  (defalias 'cider-start 'cider-jack-in)

  ;; Set the path for cider to find lein
  (add-to-list 'exec-path "/usr/local/bin"))

(defun setup-lisp ()

  (if (not (eq system-type 'windows-nt))
	   
	   (load (expand-file-name "~/quicklisp/slime-helper.el"))

	   (setq inferior-lisp-program "sbcl")))

(defun setup-ocaml ()

  ;; Load tuareg - OCaml for Emacs
  (add-to-list 'load-path "~/.emacs.d/elpa/tuareg")

  ;; Have tuareg auto-load when appropiate
  (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)

  ;; Load tuareg-mode when the correct file extension is found
  ;; (setq auto-mode-alist

  ;;   (append '(("\\.ml[ily]?$" . tuareg-mode)

  ;;   	  ("\\.topml$" . tuareg-mode))

  ;;   	auto-mode-alist))

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
