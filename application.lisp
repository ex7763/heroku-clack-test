;; TODO: duncan@bayne.id.au: make the Buildpack aware of the app package name
(in-package #:cl-user)

;; (hunchentoot:define-easy-handler (root :uri "/") ()
;;   (cl-who:with-html-output-to-string (s nil :prologue t)
;;     (:html
;;       (:body
;;         (:p "hello, world")
;;         (:img :src "lisp-logo120x80.png")))))

;; (defvar *acceptor* nil)

;; (defun initialize-application (&key port)
;;   (setf hunchentoot:*dispatch-table*
;;     `(hunchentoot:dispatch-easy-handlers
;;        ,(hunchentoot:create-folder-dispatcher-and-handler
;;           "/" "/app/static/")))

;;   (when *acceptor*
;;     (hunchentoot:stop *acceptor*))

;;   (setf *acceptor*
;;     (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port port))))

(defvar *handler* nil)

(defun initialize-application (&key port)
  (when *handler*
    (clack:stop *handler*))
  
  (setf *handler*
        (clack:clackup
         (lambda (env)
           (declare (ignore env))
           '(200 (:content-type "text/plain") ("Hello, Clack!")))
         :port port)))

(defun heroku-toplevel ()
  (when *handler*
    (clack:stop *handler*))
  
  (setf *handler*
        (clack:clackup
         (lambda (env)
           (declare (ignore env))
           '(200 (:content-type "text/plain") ("Hello, Clack!")))
         :port (parse-integer (getenv "PORT"))))
  ;; (initialize-application :port (parse-integer (getenv "PORT")))
  ;; (loop (sleep 600))
  )

