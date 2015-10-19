;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

(live-add-pack-lib "company")
(live-add-pack-lib "flycheck")
(live-add-pack-lib "irony")

;; Load bindings config
(live-load-config-file "let-alist.el")
(live-load-config-file "bindings.el")
(live-load-config-file "docker-mode.el")
(live-load-config-file "adoc-mode.el")
(live-load-config-file "go-mode.el")
(live-load-config-file "rust-mode.el")
(live-load-config-file "irony-mode.el")

(require 'iso-transl)
(require 'package)
(require 'adoc-mode)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)
(defun un-indent-by-removing-4-spaces ()
  "remove 4 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^    ")
        (replace-match "")))))
