(defun eval-scala (start end)
  (interactive (list (point) (mark)))
  ;; start scala if it hasn't started yet
  (setq cur-buffer (current-buffer))
  (unless (get-process "scala-repl")
    (let ((process-connection-type t))  ; use a pipe
      (start-process "scala-repl" "*scala*" "scala" "-J-Xmx512M"))
    (set-buffer "*scala*")
    (shell-mode)
    (set-buffer cur-buffer)
    )
  ;; execute
  (process-send-string "scala-repl" ":paste\n")
  (process-send-region "scala-repl" start end)
  (process-send-string "scala-repl" "\n\C-d")
  ;;display buffer
  (display-buffer
   (get-buffer "*scala*")
   '((display-buffer-reuse-window
      display-buffer-below-selected
      display-buffer-use-some-window
      display-buffer-pop-up-window
      display-buffer-pop-up-frame)
     (reusable-frames . A)
     (window-height . 8) (window-width . nil)
   ))
  ;;focus in buffer
  (set-buffer "*scala*")
  (set-window-point (get-buffer-window "*scala*") (point-max))
  )
