(progn (package-initialize)(package-refresh-contents)(package-install 'google-c-style))

(eval-after-load "sql" '(load-library "sql-indent"))
(add-to-list 'auto-mode-alist '("\\.hql\\'" . sql-mode))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(require 'google-c-style)
(add-hook 'c-mode-common-hook
          (lambda()
            (subword-mode)
            (google-set-c-style)
            (google-make-newline-indent)
            (setq c-basic-offset 2)))
(add-hook 'java-mode-hook
          (lambda ()
            (setq c-basic-offset 2)
            (c-set-offset 'case-label '+)
            (c-set-offset 'statement-cont '++)))
