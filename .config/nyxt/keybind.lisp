(in-package #:nyxt-user)

(defvar *my-keymap* (make-keymap "my-map"))
(define-key *my-keymap*
            "C-space" 'nothing ; disabling Ctrl-space (only ":" works for command--> to make qutebrowser like)
            "C-l" 'nothing ; disabling Ctrl-l (only ":" works for open url-> to make qutebrowser like)
            "r" 'reload-current-buffer ; disable reloading all buffers
            "M" 'toggle-buffer-dark
            "D" 'delete-current-buffer
            "U" 'reopen-last-buffer
            "C-d" 'delete-all-buffers
            "R" 'nothing
            "C-t" 'make-buffer-focus
            "C-n" 'openinternal ;open nyxt internal page in a new buffer
            "x t" 'toggle-status-buffer
            "x b" 'toggle-toolbars
            " y h " 'nyxt/mode/hint:copy-hint-url ;yank hint url 
            ", a d e" 'amazon
            ", a t" 'atlas
            ", b i b" 'bibliothek
            ", c o n f" 'confluence
            ", d u c k" 'duckSearch
            ", f l e x" 'flex
            ", f z j" 'fzj  
            ", g l" 'gitlab  
            ", g m " 'gmail
            ", g p t" 'gpt
            ", h t" 'nyxt/mode/history:history-tree
            ", i n t r a" 'intra
            ", i n v " 'invidious
            ", l e o " 'leo
            ", l l v" 'llview
            ", m i t" 'mitarbeiterportal
            ", s l a c k" 'slack
            ", j s c" 'jsc
            ", j u d o o r" 'judoor
            ", j u p" 'jupyter-lab
            ", j u w e l s " 'juwels-doc
            ", w h " 'whatsapp
            ", w i k i " 'wiki
            ", y t" 'youtube
            "_" 'switch-buffer-next
            "s-;" 'switch-buffer-previous
            ";" 'switch-buffer-previous)

(define-mode my-mode nil
  ((keyscheme-map (nkeymaps/core:make-keyscheme-map 
                    nyxt/keyscheme:vi-normal *my-keymap*))))

; Global mapping
(define-configuration buffer
  ((override-map (let ((map (make-keymap "override-map")))
                   (define-key map
                   "M-v" 'nyxt/mode/vi:vi-normal-mode))))) ; Alt-v for toggle vi-mode

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



