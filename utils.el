(defun isOSX (success &optional failure)

  "Checks if on osx then takes a function or a optional alternative thing to do"

  ;; If is OSX call the success function

  (if (eq system-type 'darwin)

       	(funcall success)

    ;; Else if failure is not nil call it

    (if (not (eq nil failure))

	(funcall failure))))

(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations. this function should be added to the hooks of the major modes used for programming"
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|Todo\\|OPTIMISE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))
