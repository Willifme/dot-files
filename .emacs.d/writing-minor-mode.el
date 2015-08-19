(defun change-view (writing-mode)
  (if writing-mode
    (progn 
	(set-fringe-style nil)
	(set-fringe-mode
	(/ (- (frame-pixel-width)
		(* 100 (frame-char-width)))
	   2)))
    (set-fringe-mode 1)))

;; (defun change-mode-line (writing-mode)
;;   (if writing-mode
;;       (setq hide-mode-line mode-line-format
;; 	    mode-line-format nil)
;;     (setq mode-line-format hide-mode-line
;; 	  (hide-mode-line nil))
;;     (force-mode-line-update)
;;     (redraw-display)))

;; TODO: Work on getting the mode line to redisplay
(defun change-mode-line (writing-mode)
  (if writing-mode
      (setq mode-line-format nil)
    (progn
      (force-mode-line-update)
      (redraw-display))))

(defun change-line-numbers (writing-mode)
  (if writing-mode
      (progn
	(global-linum-mode -1)
	(global-relative-line-numbers-mode -1))
    (progn
      (global-linum-mode 1)
      (global-relative-line-numbers-mode 1))))

(define-minor-mode writing-mode
  "A minor mode for writing notes"
  :lighter "writing"
  :variable writing-mode
  (change-view writing-mode)
  (change-mode-line writing-mode)
  (change-line-numbers writing-mode))

(writing-mode -1)
