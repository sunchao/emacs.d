(add-hook 
 'haskell-mode-hook
 '(lambda () 
    (turn-on-haskell-doc-mode)
    (turn-on-haskell-indent)
    (local-set-key (kbd "C-c C-f") 'haskell-hoogle)))

(provide 'csun-haskell)
