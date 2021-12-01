;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Mark Feltner"
      user-mail-address "feltner.mj@gmail.com")

(setq doom-font (font-spec :family "Hack" :size 14)
      ivy-posframe-font (font-spec :family "Hack" :size 15))

(setq doom-theme 'doom-gruvbox)

;; (setq org-directory "~/org/")

(setq display-line-numbers-type nil)

;; Set Doom's scratch buffer to LISP mode by default
(setq doom-scratch-initial-major-mode 'lisp-interaction-mode)

;; Manual auto-complete
(setq company-idle-delay nil)

;; Disable invasive lsp-mode features
(setq lsp-ui-sideline-enable nil   ; not anymore useful than flycheck
      lsp-ui-doc-enable nil        ; slow and redundant with K
      lsp-enable-symbol-highlighting nil
      ;; If an LSP server isn't present when I start a prog-mode buffer, you
      ;; don't need to tell me. I know. On some systems I don't care to have a
      ;; whole development environment for some ecosystems.
      +lsp-prompt-to-install-server 'quiet)

;; Implicit /g flag on evil ex substitution
(setq evil-ex-substitute-global t)

;;; :editor evil
;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;;; :tools magit
(setq magit-repository-directories '(("~/code" . 2))
      magit-save-repository-buffers nil
      ;; Don't restore the wconf after quitting magit, it's jarring
      magit-inhibit-save-previous-winconf t
      transient-values '((magit-rebase "--autosquash" "--autostash")
                         (magit-pull "--rebase" "--autostash")))
;;
;;; Keybinds

;;
(use-package key-chord
  :config
  (key-chord-mode t)
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jj" #'evil-normal-state)
  (key-chord-define evil-insert-state-map "jk" #'evil-normal-state)
  (key-chord-define evil-normal-state-map "qq" #'evil-normal-state))


;; Window management
(map! :leader
      "s w" #'+evil/window-split-and-follow
      "s v" #'+evil/window-vsplit-and-follow
      "TAB c" #'+workspace:delete
      "TAB TAB" #'+workspace:switch-next
      "<backtab> TAB" #'+workspace:switch-previous
      )

(use-package prettier-js
  :config (setq prettier-js-command "prettier-standard")
  :hook ((typescript-mode . prettier-js-mode)
         (js-mode . prettier-js-mode)
         (css-mode . prettier-js-mode)
         (json-mode . prettier-js-mode)
         (yaml-mode . prettier-js-mode)
         (ruby-mode . prettier-js-mode)
         (web-mode . prettier-js-mode)))


;; @todo: add vim-unite keybinds (in some form)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
