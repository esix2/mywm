
;; For version 3
(in-package #:nyxt-user)

;; This only works on the versions of Nyxt after 2.2.4.
(define-configuration browser
  ((theme (make-instance
           'theme:theme
           :background-color "#555555"
           :background-color- "#333333"
           :background-color+ "#882222"
           :highlight-color "#000022"
           :contrast-text-color "#ffffff"
           :text-color "#333333"
           :accent-color "#77aa00"
           :primary-color "#333333"
           :secondary-color "#333333"
           :tertiary-color "#333333"
           :text-color+ "#00ff00"
           :text-color- "#ff00ff"
           :quaternary-color "#ffff00"))))
; 
;; Custom Dark-mode for webpages
