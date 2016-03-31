;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     themes-megapack
     auto-completion
     better-defaults
     (git :variables
          git-gutter-use-fringe t)
     github
     (shell :variables
            shell-default-shell `multi-term
            shell-default-term-shell "/bin/zsh -i")
     syntax-checking
     search-engine

     prodigy ;; run external tasks

     ; fun
     xkcd
     emoji
     games
     osx

     ; programming language and syntax support
     emacs-lisp
     org
     go
     java
     html
     javascript
     python
     rust
     scala
     scheme
     shell-scripts
     dash
     markdown
     dockerfile
     ansible
     clojure
     yaml
     react

     (colors :variables
             colors-enable-rainbow-identifiers t
             colors-enable-nyan-cat-progress-bar t)
     )
   ;; List of additional packages that will be installed wihout being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(flycheck-clojure editorconfig nvm)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(bookmarks recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         cyberpunk
                         gandalf
                         ;;material
                         ;;molokai
                         ;;odersky
                         ;;solarized-dark
                         ;;solarized-light
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Meslo LG L DZ for Powerline"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 50
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  ;; start server
  ;;(server-start)

  ;; line numbers
  (global-linum-mode)

  ;; make emacs open files in existing frame
  ;;(setq ns-pop-up-frames nil)
  ;;(x-focus-frame nil)

  ;; shell
  (setq multi-term-program "/usr/local/bin/zsh")
  (setq-default dotspacemacs-configuration-layers
                '(shell :variables shell-default-shell 'ansi-term))
  (setq-default dotspacemacs-configuration-layers
                '(shell :variables shell-default-term-shell "/usr/local/bin/zsh"))
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

  ;; browser
  (setq browse-url-browser-function 'browse-url-generic
        engine/browser-function 'browse-url-generic
        browse-url-generic-program "google-chrome")

  ;; java (eclim)
  (setq eclim-eclipse-dirs '("~/Applications/eclipse/Eclipse.app/Contents/Eclipse")
        eclim-executable "~/Applications/eclipse/eclim")

  ;; clojure
  (setq clojure-enable-fancify-symbols t)

  ;; rust
  (setq racer-rust-src-path "~/bin/rust/src/")

  ;; groovy


  ;; javascript
  ;; flycheck-executable-find
  ;; if node_modules exists in projectile-project-root
  ;;   node_modules/.bin to front of exec-path
  ;; (file-exists-p (concat projectile-project-root "node_modules"))
  ;; flycheck-set-checker-executable
  ;; (reqiure 'projectile)
  ;; (add-to-list 'exec-path (concat (projectile-project-root) "/node_modules/.bin/"))
  ;; (flycheck-add-mode 'javascript-eslint 'js-mode)

  (defun feltnerm/setup-local-eslint ()
    "If ESLint found in node_modules directory - use that for flycheck.
Intended for use in PROJECTILE-AFTER-SWITCH-PROJECT-HOOK."
    (interactive)
    (let ((local-eslint (expand-file-name (concat (projectile-project-root) "node_modules/.bin/eslint"))))
      (setq flycheck-javascript-eslint-executable
            (and (file-exists-p local-eslint) local-eslint))))

  (defun feltnerm/setup-local-standard ()
    "If ESLint found in node_modules directory - use that for flycheck.
Intended for use in PROJECTILE-AFTER-SWITCH-PROJECT-HOOK."
    (interactive)
    (let ((local-standard (expand-file-name (concat (projectile-project-root) "node_modules/.bin/standard"))))
      (setq flycheck-javascript-standard-executable
            (and (file-exists-p local-standard) local-standard))))

  ;; disable jshint since we prefer eslint checking
  ;; (setq-default flycheck-disabled-checkers
  ;;               (append flycheck-disabled-checkers
  ;;                       '(javascript-jscs)
  ;;                       '(javascript-jshint)))

  ;; use eslint with web-mode for jsx files
  (add-to-list 'auto-mode-alist '("\\.jsx?$" . js2-jsx-mode))

  (with-eval-after-load 'web-mode
    ;; set reasonable indentation for web-mode
    (setq web-mode-markup-indent-offset 2
          web-mode-css-indent-offset 2
          web-mode-code-indent-offset 2))

  (with-eval-after-load 'js
    (setq js-indent-level 2)
    (setq js2-basic-offset 2)
    (setq js2-strict-missing-semi-warning nil)
    (setq js2-missing-semi-one-line-override nil))

  (with-eval-after-load 'flycheck
    (feltnerm/setup-local-eslint)
    (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
    (flycheck-add-mode 'javascript-eslint 'web-mode)
    (flycheck-disable-checker 'javscript-standard)
    (flycheck-disable-checker 'javscript-jshint)
    (flycheck-disable-checker 'javscript-jscs)
)
    ;; (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
    ;; (flycheck-add-mode 'javascript-eslint 'js-mode)
    ;; (flycheck-add-mode 'javascript-eslint 'js2-mode)

  (with-eval-after-load 'projectile
    (add-hook 'projectile-after-switch-project-hook 'feltnerm/setup-local-eslint)
    (add-hook 'projectile-after-switch-project-hook 'feltnerm/setup-local-standard)))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
