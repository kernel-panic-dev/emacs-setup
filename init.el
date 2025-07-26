(setq evil-want-keybinding nil)  ;; Must be set before loading evil

(use-package evil
  :init
  (setq evil-want-integration t) ;; optional, enables some integrations
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; ---------------------------
;; 📦 Package Management Setup
;; ---------------------------
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(set-face-attribute 'default nil :font "FiraCode Nerd Font Mono" :height 120)

(use-package org
  :ensure t)

(use-package org-superstar
  :ensure t
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-headline-bullets-list '("◉" "○" "●" "◆" "▶"))
  (setq org-hide-leading-stars t))

(setq org-ellipsis " ▼")

(add-hook 'org-mode-hook #'org-indent-mode)

(set-face-attribute 'default nil :font "FiraCode Nerd Font Mono" :height 120)


;; ---------------------------
;; 🎨 Catppuccin Theme (Mocha)
;; ---------------------------
(setq catppuccin-flavor 'mocha) ;; 'latte, 'frappe, 'macchiato, 'mocha

(use-package catppuccin-theme
  :config
  (load-theme 'catppuccin :no-confirm))

;; ---------------------------
;; 💻 UI Tweaks
;; ---------------------------
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Smooth scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; ---------------------------
;; 🌈 Nyan Cat in Mode Line
;; ---------------------------
(use-package nyan-mode
  :config
  (setq nyan-bar-length 60) ;;
  (nyan-mode 1))

;; ---------------------------
;; 📊 Beautiful Doom Modeline
;; ---------------------------
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-bar-width 3)
  ;; icons disabled since no all-the-icons fonts
  (doom-modeline-icon nil)
  (doom-modeline-major-mode-icon nil))

;; ---------------------------
;; 🌳 Tree-sitter for Syntax Highlighting
;; ---------------------------
(use-package tree-sitter
  :hook ((prog-mode . turn-on-tree-sitter-mode)
         (tree-sitter-after-on . tree-sitter-hl-mode)))

(use-package tree-sitter-langs
  :after tree-sitter)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
