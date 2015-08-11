(add-hook 'clojure-mode-hook #'enable-paredit-mode)
(add-hook 'cider-mode-hook #'enable-paredit-mode)

(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook #'rainbow-delimiters-mode)

;; More sensibile defaults for cider
(defalias 'cider-start 'cider-jack-in)
(defalias 'cider-exit 'cider-quit)
