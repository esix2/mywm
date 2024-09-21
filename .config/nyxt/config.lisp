
(defvar *my-keymap* (make-keymap "my-map"))

(define-key *my-keymap*
            "C-w" 'switch-buffer-next
            "_" 'switch-buffer-next
            "s-;," 'switch-buffer-previous
            ";," 'switch-buffer-previous)

(define-mode my-mode
    nil
  "Dummy mode for the custom key bindings in *my-keymap*."
  ((keyscheme-map
    (nkeymaps/core:make-keyscheme-map nyxt/keyscheme:cua *my-keymap*
                                      nyxt/keyscheme:emacs *my-keymap*
                                      nyxt/keyscheme:vi-normal *my-keymap*))))

(define-configuration web-buffer
  "Enable this mode by default."
  ((default-modes (pushnew 'my-mode %slot-value%))))

(define-configuration web-buffer
((default-modes (pushnew 'nyxt/mode/vi:vi-normal-mode %slot-value%))))

(define-configuration (web-buffer)
  ((default-modes (pushnew 'nyxt/mode/style:dark-mode %slot-value%))))

(define-configuration browser
  ((theme theme:+dark-theme+)))

