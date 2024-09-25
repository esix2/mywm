""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SECTION:   Creating and defininf my own key binding"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
(defvar *my-keymap* (make-keymap "my-map"))
(define-key *my-keymap*
            "C-space" 'nothing ; disabling Ctrl-space (only ":" works for command--> to make qutebrowser like)
            "C-l" 'nothing ; disabling Ctrl-l (only ":" works for open url-> to make qutebrowser like)
;             "t" 'nothing ; disable showing list of headings
            "M" 'toggle-buffer-dark
            "D" 'delete-current-buffer
            "C-d" 'delete-all-buffers
            "U" 'reopen-last-buffer
            "R" 'reload-current-buffer
            "C-t" 'make-buffer-focus
            "C-n" 'openinternal ;open nyxt internal page in a new buffer
            "x t" 'toggle-status-buffer
            "x b" 'toggle-toolbars
            " y h " 'nyxt/mode/hint:copy-hint-url ;yank hint url 
            ", a t" 'atlas
            ", b i b" 'bibliothek
            ", f l e x" 'flex
            ", f z j" 'fzj  
            ", g l" 'gitlab  
            ", g m " 'gmail
            ", g p t" 'gpt
            ", h t" 'nyxt/mode/history:history-tree
            ", i n t r a" 'intra
            ", v " 'invidious
            ", l e o " 'leo
            ", m i t" 'mitarbeiterportal
            ", s d" 'searchDuck
            ", s l a c k" 'slack
            ", j s c" 'jsc
            ", j u d o o r" 'judoor
            ", w h " 'whatsapp
            ", w i k i " 'wiki
            ", y t" 'youtube
            "_" 'switch-buffer-next
            "s-;" 'switch-buffer-previous
            ";" 'switch-buffer-previous)

(define-mode my-mode nil
  ((keyscheme-map (nkeymaps/core:make-keyscheme-map 
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

(define-command toggle-buffer-dark () "Toggle dark and refresh"
  (nyxt/mode/style:dark-mode)
  (reload-current-buffer))

(define-command openinternal () "Shows the whole history"
  (make-buffer-focus :url "nyxt:new"))

(define-command atlas () "Shows the whole history"
  (make-buffer-focus :url "https://search.atlas.engineer/searxng/"))
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SECTION:     Commands for openning different web pages"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
(define-command bibliothek () "Opens Bibliothek"
  (make-buffer-focus :url "https://intranet.fz-juelich.de/de/organisation/zb"))

(define-command flex () "Opens Flex"
  (make-buffer-focus :url "https://booked.jsc.fz-juelich.de/Web/?"))

(define-command fzj () "Opens Forschungszentrum Jülich"
  (make-buffer-focus :url "https://www.fz-juelich.de"))

(define-command gitlab () "Opens Gitlab"
  (make-buffer-focus :url "https://gitlab.jsc.fz-juelich.de/"))

(define-command gmail () "Opens Gmail"
  (make-buffer-focus :url "https://gmail.com"))

(define-command gpt () "Opens ChatGPT"
  (make-buffer-focus :url "https://chatgpt.com"))

(define-command intra () "Opens Intranet"
  (make-buffer-focus :url "https://intranet.fz-juelich.de/de"))

(define-command invidious () "Opens Invidious"
  (make-buffer-focus :url "http://localhost:3000/feed/history"))

(define-command jsc () "Opens JSC"
  (make-buffer-focus :url "https://herten1.pages.jsc.fz-juelich.de/jsc-new-employees/#conf:hpcls,hpccdss,hpcase,tech,atmlpp,xdev,sarch,scsup,appreview,dma,esde"))

(define-command judoor () "Opens JuDoor"
  (make-buffer-focus :url "https://judoor.fz-juelich.de/login"))

(define-command leo () "Leo dictrionary"
  (make-buffer-focus :url "https://dict.leo.org/german-english")
  toggle-buffer-dark)

(define-command mitarbeiterportal () "Opens Mitarbeiterportal"
  (make-buffer-focus :url "https://service1.edv.kfa-juelich.de/cgi-bin/Prod/InfoSystem/eMapor/eMapor.pl"))

(define-command searchDuck () "Search in the current buffer"
  (set-url :url "https://start.duckduckgo.com"))

(define-command slack () "Opens Slack"
  (make-buffer-focus :url "https://app.slack.com/client/T01D7M1B6HF/D07PC2AH2GH"))

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


  ; Duckduckgo as default new page
(defmethod customize-instance ((browser browser) &key)
  (setf (slot-value browser 'default-new-buffer-url) "https://start.duckduckgo.com/"))
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            "General configurations"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

(in-package #:nyxt-user)

;; Import Files
; (nyxt::load-lisp "~/.config/nyxt/statusline.lisp")
(nyxt::load-lisp "~/.config/nyxt/stylesheet.lisp")
; (nyxt::load-lisp "~/.config/nyxt/hint.lisp")


(define-configuration web-buffer
  ((glyph-mode-presentation-p t)))  ;; Disable the glyph (lambda) presentation

(define-configuration :hint-mode
  "Set up QWERTY home row as the hint keys."
  ((hints-alphabet "0123456789")))

(define-nyxt-user-system-and-load nyxt-user/basic-config
  :components ("status"))
