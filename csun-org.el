(require 'org-install)

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook 'turn-on-font-lock)

(setq org-agenda-custom-commands
  '(("H" "Office and Home Worklist"
    ((agenda "")
       (tags-todo "OFFICE")
       (tags-todo "HOME")
       (tags-todo "JOB")
       (tags-todo "WORK")
       (tags-todo "PROJECT")
       (tags-todo "READING")))))

(provide 'csun-org)
