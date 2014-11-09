(defun isOSX (success &optional failure)

  "Checks if on osx then takes a function or a optional alternative thing to do"

  ;; If is OSX call the success function

<<<<<<< HEAD
  (if (eq system-type 'darwin)

       	(funcall success)

    ;; Else if failure is not nil call it

    (if (not (eq nil failure))

	(funcall failure))))
=======
       	(funcall success)

    (if (not (eq nil failure))

	(funcall failure))))
       	;; (if (not (eq nil failure))

       	;;     (print "not called")))))
>>>>>>> e79d20ab289caeec82dca9aae15cda5daad35fdb
