(defun isOSX (&optional success &optional failure)

  "Checks if on osx then takes a function or a optional alternative thing to do"

  (if (eq system-type 'darwin)

      ;; How do I have more than one condition in a if statement without using a prog 
       (progn 

       	(funcall success)

       	(if (not (eq nil failure))

       	    (funcall failure)))))
