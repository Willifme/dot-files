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

    (add-hook 'c-mode-common-hook 'setup-autocomplete-c)

    (add-hook 'c++-mode-hook 'setup-autocomplete-c)

    (global-auto-complete-mode t))

  (setup-yasnippet)
  
  (setup-autocomplete-c))

(defun setup-autocomplete-c ()

  (add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-c-headers")

  (require 'auto-complete-c-headers)

  (load "~/.emacs.d/auto-complete-clang-async.el")

  (require 'auto-complete-clang-async)

  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")

  (setq ac-sources '(ac-source-clang-async)))
