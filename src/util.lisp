(in-package :gloss.util)

(define-condition gloss-error (error)
  ((message :reader gloss-error-message
            :initarg :message)
   (value :reader gloss-error-value
          :initarg :value
          :initform nil)))

(defmethod print-object ((object gloss-error) stream)
  (print-unreadable-object (object stream :type t)
    (format stream "~S~@[: ~{~S~^, ~}~]"
            (gloss-error-message object)
            (gloss-error-value object))))

(defgeneric gloss-message (kind)
  (:method (kind)
    "An unknown error has occurred."))

(defun gloss-error (kind &optional value)
  (error 'gloss-error
         :message (gloss-message kind)
         :value value))