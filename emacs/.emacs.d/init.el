(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Show line numbers
(global-linum-mode t)

;; Use M-SPC instead of C-SPC for setting marks
(global-set-key (kbd "M-SPC") (lambda() (interactive) (push-mark nil nil 1)))
