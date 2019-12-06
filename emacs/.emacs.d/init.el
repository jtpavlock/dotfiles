(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (csharp-mode undo-tree php-mode go-mode web-mode yaml-mode flycheck evil-magit magit systemd evil-surround evil-nerd-commenter org-bullets evil-tutor evil flx smex counsel ivy general which-key linum-relative zenburn-theme smart-mode-line use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; load emacs configuration through "emacs-init.org"
;; if you get an error here that org cannot be found, you may have to:
;; 1. M-x package-list-packages
;; 2. Find "org" in list
;; 3. Type i to mark org for installation and then x to install
;; 4. Restart Emacs
(package-initialize)
(require 'org)
(org-babel-load-file
 (expand-file-name "emacs-init.org"
                   user-emacs-directory))

;; temporary until I figure out how to get this to work with use-package
(flycheck-add-mode 'javascript-eslint 'web-mode)
