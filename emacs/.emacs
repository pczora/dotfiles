(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4feee83c4fbbe8b827650d0f9af4ba7da903a5d117d849a3ccee88262805f40d" default)))
 '(markdown-command "pandoc")
 '(package-selected-packages
   (quote
    (dockerfile-mode org-link-minor-mode exec-path-from-shell company-go 0blayout company markdown-mode go-mode fold-this magit base16-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'base16-gruvbox-dark-medium t)

(global-set-key (kbd "C-c C-z") 'hs-toggle-hiding)

(require 'company)
(require 'company-go)

(add-hook 'go-mode-hook
      (lambda ()
        (set (make-local-variable 'company-backends) '(company-go))
        (company-mode)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(global-set-key (kbd "C-M-n") 'previous-buffer)
(global-set-key (kbd "C-M-m") 'next-buffer)

(menu-bar-mode -1)

;; Show line numbers
(global-linum-mode t)

;; Highlight current line
(global-hl-line-mode t)

;; Use M-SPC instead of C-SPC for setting marks (since I already use C-SPC as tmux' prefix)
;; (global-set-key (kbd "M-SPC") (lambda() (interactive) (push-mark nil nil 1)))

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Set indent to 2 for JavaScript
(setq js-indent-level 2)

;; Use '# Header' instead of '# Header #'
(setq markdown-asymmetric-header 1)
