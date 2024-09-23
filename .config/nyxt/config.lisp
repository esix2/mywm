""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SECTION:   Creating and defininf my own key binding"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
(defvar *my-keymap* (make-keymap "my-map"))
(define-key *my-keymap*
            "t" 'make-buffer-focus
            "u" 'reopen-last-buffer
            "x t" 'toggle-status-buffer
            "x b" 'toggle-toolbars
            ", f z" 'fzj  
            ", g m " 'gmail
            ", g p t " 'gpt
            ", i n v " 'invidious
            ", l e o " 'leo
            ", y t" 'youtube
            "_" 'switch-buffer-next
            "s-;" 'switch-buffer-previous
            ";" 'switch-buffer-previous)

(define-configuration web-buffer
  ((override-map
    (let ((map (make-keymap "override-map")))
      (define-key map 
                  "d" 'delete-current-buffer
                  "u" 'reopen-last-buffer)))))
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            "General configurations"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ChatGPT slution which are useless :-)"




