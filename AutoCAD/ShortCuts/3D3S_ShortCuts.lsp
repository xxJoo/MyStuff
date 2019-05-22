; ShortCuts Added By PowerShell
;  -- Will Clark Defined Command Aliases for 3D3S --
;  Define shortcuts for 3d3s
;  **********------------**********
;  No xlate 
;  DO NOT REMOVE


(defun c:3FX    ()    (command "pos_define")        (prin1)  )
(defun c:3SS    ()    (command "sec_define")        (prin1)  )
(defun c:3V     ()    (command "noshow")            (prin1)  )
(defun c:3VS    ()    (command "secshow")           (prin1)  )
(defun c:3D     ()    (command "unitbreak")         (prin1)  )



(prompt "Define shortcuts for 3d3s")

(prin1)

; 3FX,      *pos_define
; 3SS,      *sec_define
; 3V,       *noshow
; 3D,       *unitbreak

; ShortCutAdded
