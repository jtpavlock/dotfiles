;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jacob Pavlock"
      user-mail-address "jtpavlock@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


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

(setq projectile-project-search-path '("~/src/"))

;; prefer microsoft python-langauge-server
(after! lsp-python-ms
  (set-lsp-priority! 'mspyls 1))
(setq lsp-diagnostics-provider :none)

;;;; Magit
;; automatically refresh magit on file changes
(add-hook 'after-save-hook 'magit-after-save-refresh-status t)

(setq git-commit-summary-max-length 72) ;; commit summary turns red after
(add-hook 'git-commit-setup-hook 'turn-off-auto-fill
          ;; append to end of git-commit-setup-hook to ensure our hook trumps others.
          t) ;; prevent magit from auto-wrapping lines

;; Projectile project type - python + poetry + pytest
(after! projectile
  (projectile-register-project-type 'python-poetry '("poetry.lock")
                                    :project-file "poetry.lock"
                                    :compile "poetry build"
                                    :test "poetry run pytest"
                                    :test-dir "tests"
                                    :test-prefix "test_"
                                    :test-suffix "_test"
                                    )
  )

;; Doom sets this to true by default, but needs to be false to run tests
;; multiple times on the same buffer.
(setq comint-prompt-read-only nil)

;; vterm popup from the right instead of bottom
(after! vterm
  (set-popup-rule! "*doom:vterm-popup:*" :size 0.33 :slot -4 :select t :quit 'current :ttl nil :side 'right
    :action '+popup-display-buffer-stacked-side-window-fn)
  )

;; clear flycheck auto-disabled-checkers after entering a (poetry) virtualenv
(defun clear-flycheck-auto-disabled-checkers ()
  "Clears any automatically disabled flycheck checkers."
  (setq flycheck--automatically-disabled-checkers ()))

(advice-add 'poetry-venv-toggle :after 'clear-flycheck-auto-disabled-checkers)

;;;; Keybinds

;; venv virtual environments for python (pyvenv)
(map! :after python
      :map python-mode-map
      :localleader
      (:prefix ("v" . "venv")
       :desc "Activate" "a" #'pyvenv-activate
       :desc "Deactivate" "d" #'pyvenv-deactivate
       ))

;; python poetry commands
(map! :after python
      :map python-mode-map
      :localleader
      (:prefix ("p" . "poetry")
       :desc "menu" "p" #'poetry
       :desc "toggle virtualenv" "v" #'poetry-venv-toggle
       ))

(map! :leader
      :desc "Execute shell command" ":" #'shell-command
      :desc "M-x" ";" #'execute-extended-command
      )
