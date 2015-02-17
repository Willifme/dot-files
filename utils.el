(defun isOSX (success &optional failure)

  "Checks if on osx then takes a function or a optional alternative thing to do"

  ;; If is OSX call the success function
  (if (eq system-type 'darwin)

       	(funcall success)

    ;; Else if failure is not nil call it
    (if (not (eq nil failure))

	(funcall failure))))

(defun lazy-load-major-mode (filextension action)

  "Looks at the file extension, adds to auto-mode-list then calls the lamba"

  ;; Add to auto-mode-list
  (add-to-list 'auto-mode-alist
               ;; Take the file extension call the lambda
               '(filextension . (funcall action))))

(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations. this function should be added to the hooks of the major modes used for programming"
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|Todo\\|OPTIMISE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(defun un-indent-by-removing-4-spaces ()
  
  "remove 4 spaces from beginning of of line"
  
  (interactive)
  
  (save-excursion
    
    (save-match-data
      
      (beginning-of-line)
      
      ;; Get rid of tabs at beginning of line
      (when (concat "^" (make-string tab-width ?\ ))
	
        (untabify (match-beginning 0) (match-end 0)))
      
      (when (looking-at "^    ")
	
        (replace-match "")))))
