(asdf:defsystem #:heroku-clack-test
  :description "Deploy clack server on heroku."
  :author "Hsu, Po-Chun"
  :license  "GNU Lesser Public License 3.0"
  :version "0.0.1"
  :serial t
  :depends-on (#:hunchentoot
               #:cl-who
               #:ningle
               
               #:clack
               ;; Below package is important, but you can use clack-handler you want to replace.
               ;; If you don't add these package, your program will fail when heroku run your server.
               #:clack-handler-hunchentoot
               #:lack-middleware-backtrace)
  :components ((:file "package")
               (:file "application")))
