(setq twelf-root "/afs/cs.uwm.edu/package/twelf/twelf-1.5R3/")

;; make the variable more recognizable
(load (concat twelf-root "emacs/twelf-init.el"))
(load (concat twelf-root "emacs/twelf-font.el"))

(defun brown-vars ()
  (twelf-font-create-face 'twelf-font-evar-face 'default "brown"))
(brown-vars)
(setq twelf-font-dark-background nil)

(add-hook
 'twelf-mode-hook
 '(lambda ()
    (setq twelf-chatter "1")
    (setq twelf-unsafe "true")
    (setq twelf-indent 2) ;; set indentation to 2
    (set-fill-column 100) ;; break line at 78
    (auto-fill-mode))) ;; auto wrap lines

(provide 'csun-twelf)
