(defun isOSX (success &optional failure)

  "Checks if on osx then takes a function or a optional alternative thing to do"

  (if (eq system-type 'darwin)

       	(funcall success)

    (if (not (eq nil failure))

	(funcall failure))))
       	;; (if (not (eq nil failure))

       	;;     (print "not called")))))
