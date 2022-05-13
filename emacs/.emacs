;; System

(setq gc-cons-threshold 50000000)
(setq large-file-warnings-threshold 100000000)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
 (require 'use-package))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(fset 'yes-or-no-p 'y-or-n-p)

(global-auto-revert-mode t)

(require 'server)
(if (not (server-running-p)) (server-start))

;; Visual

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(column-number-mode t)
(size-indication-mode t)

(setq inhibit-startup-screen t)

(setq frame-title-format
      '((:eval (if (buffer-file-name)
       (abbreviate-file-name (buffer-file-name))
     "%b"))))

(set-frame-font "Bitstream Vera Sans Mono 14" nil t)
;; (set-frame-font "Ubuntu Mono 16" nil t)
;; (set-frame-font "Terminus 14")

;; Editor

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)

(global-set-key (kbd "C-x k") 'kill-this-buffer)

(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'dired-mode-hook 'auto-revert-mode)

(electric-pair-mode 1)

;; (unless (package-installed-p 'evil)
;;   (package-install 'evil))

;; (require 'evil)
;; (evil-mode 1)

(unless (package-installed-p 'company)
  (package-install 'company))
(add-hook 'after-init-hook 'global-company-mode)

(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))
(unless (package-installed-p 'yasnippet-snippets)
  (package-install 'yasnippet-snippets))
(yas-global-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(darkburn))
 '(custom-safe-themes
   '("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "4af38f1ae483eb9335402775b02e93a69f31558f73c869af0d2403f1c72d1d33" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "76b4632612953d1a8976d983c4fdf5c3af92d216e2f87ce2b0726a1f37606158" "7575474658c34b905bcec30a725653b2138c2f2d3deef0587e3abfae08c5b276" "fc48cc3bb3c90f7761adf65858921ba3aedba1b223755b5924398c666e78af8b" default))
 '(package-selected-packages
   '(cider clojure-mode yasnippet-snippets yasnippet dockerfile-mode company fsharp-mode bubbleberry-theme color-theme-sanityinc-tomorrow twilight-bright-theme darkburn-theme zenburn-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
