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


;;;; Can work
;; (defvar *handler* nil)

;; (defun initialize-application (&key port)
;;   (when *handler*
;;     (clack:stop *handler*))
  
;;   (setf *handler*
;;         (clack:clackup
;;          (lambda (env)
;;            (declare (ignore env))
;;            '(200 (:content-type "text/plain") ("Hello, Clack!")))
;;          :port port)))

;; (defun heroku-toplevel ()
;;   (initialize-application :port (parse-integer (getenv "PORT")))
;;   (loop (sleep 600))
;;   )

(defvar *app* (make-instance 'ningle:<app>))

(setf (ningle:route *app* "/")
      "Welcome to ningle!")

(setf (ningle:route *app* "/login" :method :POST)
      #'(lambda (params)
          (if (authorize (cdr (assoc "username" params :test #'string=))
                         (cdr (assoc "password" params :test #'string=)))
              "Authorized!"
              "Failed...Try again.")))



(defun initialize-application (&key port)
  (clack:clackup *app* :port port))
