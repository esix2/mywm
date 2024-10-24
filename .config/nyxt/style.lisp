
;; For version 3
(in-package #:nyxt-user)

; " Making dark mode for the whole browser"
(define-configuration browser
  ((theme theme:+dark-theme+)))

" Making dark mode for the web pages"
(define-configuration (web-buffer)
 ((default-modes (pushnew 'nyxt/mode/style:dark-mode %slot-value%))))


  ; Duckduckgo as default new page
(defmethod customize-instance ((browser browser) &key)
  (setf (slot-value browser 'default-new-buffer-url) "https://start.duckduckgo.com/"))

;; This only works on the versions of Nyxt after 2.2.4.
(define-configuration browser
  ((theme (make-instance
           'theme:theme
           :background-color "#222222"
           :background-color- "#333333";hint, secondardy modes
;            :background-color+ "#882222"
;            :accent-color "#882222"
           :background-color+ "#de5833"
           :accent-color "#de5833"
           :highlight-color "#0000ff"
           :contrast-text-color "#ffffff"
           :text-color "#333333"
           :primary-color "#333333"
           :secondary-color "#333333"
           :tertiary-color "#333333"
           :text-color+ "#00ff00"
           :text-color- "#ff00ff"
           :quaternary-color "#ffff00"))))
; 
;; Custom Dark-mode for webpages
