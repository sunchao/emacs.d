;; utility functions

(defun copy-lines-matching-re (re)
  "find all lines matching the regexp RE in the current buffer
putting the matching lines in a buffer named *matching*"
  (interactive "sRegexp to match: ")
  (let ((result-buffer (get-buffer-create "*matching*")))
    (with-current-buffer result-buffer
      (erase-buffer))
    (save-match-data
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward re nil t)
          (princ (buffer-substring-no-properties (line-beginning-position)
                                                 (line-beginning-position 2))
                 result-buffer))))
    (pop-to-buffer result-buffer)))

(defun replace-tabs (begin end)
  "Replace all tabs in the selected region with 2 whitespaces."
  (interactive "r")
  (save-excursion
    (goto-char begin)
    (while (re-search-forward "\t" end t)
      (replace-match "  " nil t))))

(defun delete-n-chars (n)
  (interactive "n")
  (if (> n 0)
    (save-excursion
    (progn
      (delete-char 1)
      (delete-n-chars (-1 n))))))

(defun delete-first-n (begin end &optional n)
  "For all lines in the region, delete first n characters"
  (interactive "r\nNHow many: ")
  (or n (setq n 2))
  (let ((number-of-lines
         (save-excursion
           (goto-char begin)
           (let ((count 0))
             (while (< (point) end)
               (forward-line)
               (setq count (1+ count)))
             count))))
    (save-excursion
      (while (> number-of-lines 0)
        (beginning-of-line)
        (let ((line-length
             (save-excursion
               (end-of-line)
               (current-column))))
          (if (> line-length n)
              (delete-char n)))
        (setq number-of-lines (1- number-of-lines))
        (forward-line)))))

(defun print-point ()
  (interactive)
  (message "point is %d" (point)))

(provide 'csun-utils)


