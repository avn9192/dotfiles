(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
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

(set-frame-font "Ubuntu Mono 13" nil t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)

(global-set-key (kbd "C-x k") 'kill-this-buffer)

(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'dired-mode-hook 'auto-revert-mode)

(electric-pair-mode 1)

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
 '(package-selected-packages '(yasnippet-snippets yasnippet company use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
