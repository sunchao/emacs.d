(require 'org-install)

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook 'turn-on-font-lock)

(setq org-agenda-files (list "~/Dropbox/org/gtd.org"))
(setq org-agenda-columns-add-appointments-to-effort-sum t)
(setq org-clock-into-drawer t)
(setq org-agenda-custom-commands
  '(("H" "Office and Home Worklist"
    ((agenda "")
       (tags-todo "OFFICE")
       (tags-todo "HOME")
       (tags-todo "JOB")
       (tags-todo "WORK")
       (tags-todo "PROJECT")
       (tags-todo "READING")))))

(let ((backcolor (assq :background face-attribute-name-alist)))
  (setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("STARTED" . (:foreground "yellow" :background backcolor))
        ("WAITING" . (:foreground "red" :background backcolor))
        ("CANCELLED" . (:foreground "blue" :weight bold)))))

(provide 'csun-org)
