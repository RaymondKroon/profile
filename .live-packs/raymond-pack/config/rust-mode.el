(live-add-pack-lib "racer")

(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(eval-after-load "rust-mode"
  '(require 'racer))

(setq racer-cmd "racer")

(add-hook 'rust-mode-hook
          '(lambda ()
             (racer-activate)
             (local-set-key (kbd "M-.") #'racer-find-definition)
             (local-set-key (kbd "TAB") #'racer-complete-or-indent)))
