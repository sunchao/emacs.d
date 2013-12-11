(require 'org-install)
(require 'csun-utils)

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "C-c w") 'delete-first-n)))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "C-c e") 'delete-trailing-whitespace)))

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
        ("STARTED" . (:foreground "gold" :background backcolor))
        ("WAITING" . (:foreground "red" :background backcolor))
        ("CANCELLED" . (:foreground "blue" :weight bold)))))


;; If we want to create internal links in a org file, and show the
;; links on github, then we need to create properties with
;; "CUSTOM_ID" of a particular format. For a header like "Foo Bar", we
;; need a "CUSTOM_ID" of "foo-bar". Here we define a command to
;; automatically create such property for us.

(defun my-set-property ()
  (interactive)
  (org-set-property "COSTOM_ID" "foo"))

(defun my-test-iterate ()
  (interactive)
  (save-excursion
    (while (outline-next-heading)
      (message (word-at-point)))))

(provide 'csun-org)
