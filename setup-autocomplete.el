
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

  ;; Enable global autocomplete mode
  (global-auto-complete-mode t)

  ;; Do not show the menu at all times
  (setq ac-auto-show-menu 0)

  (setq ac-show-menu-immediately-on-auto-complete t)
  
  ;; Set default ac dictionary location
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict")

  (lambda ()

    (add-hook 'auto-complete-mode-hook 'ac-common-setup)

    (global-auto-complete-mode t))

  (setup-yasnippet)
  
  (setup-autocomplete-c))

(defun setup-autocomplete-c ()

  ;; Load auto-complete-c-headers
  (add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-c-headers")

  (require 'auto-complete-c-headers)
  
  (add-to-list 'ac-sources 'ac-sources-c-headers)

  (isOSX '(lambda ()

	 ;; Revise this later
	     
	 (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/6.0/include"))))
