;;;; SPDX-FileCopyrightText: Atlas Engineer LLC
;;;; SPDX-License-Identifier: BSD-3-Clause

(in-package #:nyxt-user)

(define-mode hint-mode ()
  "Interact with elements by typing a short character sequence."
  ((visible-in-status-p nil)
   (rememberable-p nil)
   (hinting-type
    :emacs
    :type (member :emacs :vi)
    :documentation "Set the hinting mechanism.
In :emacs, hints are computed for the whole page, and the usual `prompt-buffer'
facilities are available.
In :vi, the `prompt-buffer' is collapsed to the input area, hints are computed
in viewport only and they're followed when user input matches the hint string.")
   (style
    (theme:themed-css (theme *browser*)
      `(".nyxt-hint"
        :background-color ,"#ff0000"
        :color ,theme:on-background
        :font-family ,theme:monospace-font-family
        :font-size "1.85rem"
        :padding "0px 0.3em"
        :border-color ,"#ff00bb"
        :border-radius "2px"
        :border-width "200px"
        :border-style "solid"
        :z-index #.(1- (expt 2 31)))
      `(".nyxt-hint.nyxt-mark-hint"
        :background-color ,theme:secondary
        :color ,theme:on-secondary
        :font-weight "bold")
      `(".nyxt-hint.nyxt-select-hint"
        :background-color ,theme:action
        :color ,theme:on-action)
      `(".nyxt-hint.nyxt-match-hint"
        :padding "0px"
        :border-style "none"
        :opacity "0.5")
      `(".nyxt-element-hint"
        :background-color ,theme:action))
    :documentation "The style of the hint overlays.")
   (show-hint-scope-p
    nil
    :type boolean
    :documentation "Whether `style' is applied to the hinted element.
When t, the hinted element is, by default, shown its scope by applying a
background color.")
   (hints-alphabet
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    :type string
    :documentation "The alphabet (charset) to use for hints.
Order matters -- the ones that go first are more likely to appear more often and
to index the top of the page.")
   (hints-selector
    "a, button, input, textarea, details, select"
    :type string
    :documentation "The elements to be hinted.
The hints-selector syntax is that of CLSS, and broadly, that of CSS. Use it to
define which elements are picked up by element hinting.

For instance, to include images:

    a, button, input, textarea, details, select, img:not([alt=\"\"])")
   (hints-offset-x
    0
    :type integer
    :documentation "The number of pixels that hint overlays are horizontally shifted by.
A positive value shifts to the right.")
   (hints-offset-y
    0
    :type integer
    :documentation "The number of pixels that hint overlays are vertically shifted by.
A positive value shifts to the bottom.")
   ))












