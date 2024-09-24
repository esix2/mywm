""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SECTION:   Creating and defininf my own key binding"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
(defvar *my-keymap* (make-keymap "my-map"))
(define-key *my-keymap*
            "r" 'reload-current-buffer
            "D" 'delete-current-buffer
            "t" 'make-buffer-focus
            "x t" 'toggle-status-buffer
            "x b" 'toggle-toolbars
            ", f z" 'fzj  
            ", g m " 'gmail
            ", g p t " 'gpt
            ", v " 'invidious
            ", w h " 'whatsapp
            ", w i k i " 'wiki
            ", l e o " 'leo
            ", y t" 'youtube
            "_" 'switch-buffer-next
            "s-;" 'switch-buffer-previous
            ";" 'switch-buffer-previous)

(define-configuration web-buffer
  ((override-map
    (let ((map (make-keymap "override-map")))
      (define-key map 
                  "D" 'delete-current-buffer
                  "U" 'reopen-last-buffer)))))
"Dummy mode for the custom key bindings in *my-keymap*."
(define-mode my-mode
    nil
  ((keyscheme-map
    (nkeymaps/core:make-keyscheme-map nyxt/keyscheme:cua *my-keymap*
                                      nyxt/keyscheme:emacs *my-keymap*
                                      nyxt/keyscheme:vi-normal *my-keymap*))))


" Adding my keybindings to the browser"
(define-configuration web-buffer
  "Enable this mode by default."
  ((default-modes (pushnew 'my-mode %slot-value%))))

" Adding vim keybindings to the browser"
(define-configuration web-buffer
((default-modes (pushnew 'nyxt/mode/vi:vi-normal-mode %slot-value%))))

" Making vim keybindings (insert) default to the prompt buffer"
(define-configuration prompt-buffer
((default-modes (pushnew 'nyxt/mode/vi:vi-insert-mode %slot-value%))))
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
           "Creating and defininf my own key binding"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SECTION:     Commands for openning different web pages"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
(define-command fzj () "Opens Forschungszentrum Jülich"
  (make-buffer-focus :url "https://www.fz-juelich.de"))

(define-command gmail () "Opens Gmail"
  (make-buffer-focus :url "https://gmail.com"))

(define-command gpt () "Opens ChatGPT"
  (make-buffer-focus :url "https://chatgpt.com"))

(define-command invidious () "Opens Invidious"
  (make-buffer-focus :url "http://localhost:3000/feed/popular"))

(define-command leo () "Leo dictrionary"
  (make-buffer-focus :url "https://dict.leo.org/german-english"))

(define-command whatsapp () "Opens whatsaApp"
  (make-buffer-focus :url "https://web.whatsapp.com/"))

(define-command wiki () "Opens my Wiki page"
   (preview-file :file "/home/ehsan/git/wiki.wiki/Home.html"))


(define-command youtube () "Opens Youtube"
  (make-buffer-focus :url "https://www.youtube.com"))
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
             "Commands for openning different web pages"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SECTION:     General configurations"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Making dark mode for the whole browser"
(define-configuration browser
  ((theme theme:+dark-theme+)))

" Making dark mode for the web pages"
(define-configuration (web-buffer)
  ((default-modes (pushnew 'nyxt/mode/style:dark-mode %slot-value%))))

(define-configuration buffer
  ((download-policy
    (lambda (url)
      (when (quri:uri-pathmatch-p ".*\\.pdf" url)
        (uiop:launch-program (list "zathura" (quri:render-uri url)))
        'download))))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            "General configurations"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ChatGPT slution which are useless :-)"



    
    (defun mpv (url)
      "MPV launches with given url using the fast profile."
      (uiop:run-program (list "mpv" "--profile=fast" url "&")))
    
    ;; Let's create a function to hint videos, convert the url to a sting, and play them in MPV
    (define-command hint-mpv (&key nyxt/web-mode::annotate-visible-only-p)
      "Show a set of element hints, and copy the URL of the user inputted one."
      (nyxt/web-mode:query-hints "Copy element URL"
                                 (lambda (nyxt/web-mode::result)
                                   ;; this converts the url to a string to be used in mpv
                                   (let*
                                       ((url
                                          (format nil "~a"
                                                  (url (first nyxt/web-mode::result)))))
                                     ;; here we take that string and pipe it into mpv
                                     (mpv url)))
                                 :annotate-visible-only-p
                                 nyxt/web-mode::annotate-visible-only-p))
