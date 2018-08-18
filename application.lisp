(in-package #:cl-user)

;;;; Use Clack and ningle
(defvar *app* (make-instance 'ningle:<app>))

(setf (ningle:route *app* "/")
      "Welcome to ningle!")

(defun initialize-application (&key port)
  (clack:clackup *app* :port port))


;;;; Just use clack
;; (defvar *handler* nil)

;; ;; Override
;; (defun initialize-application (&key port)
;;   (when *handler*
;;     (clack:stop *handler*))
  
;;   (setf *handler*
;;         (clack:clackup
;;          (lambda (env)
;;            (declare (ignore env))
;;            '(200 (:content-type "text/plain") ("Hello, Clack!")))
;;          :port port)))

;; ;; Override
;; (defun heroku-toplevel ()
;;   (initialize-application :port (parse-integer (getenv "PORT")))
;;   (loop (sleep 600))
;;   )


