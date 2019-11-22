;;; my autocad settings
;;; http://help.autodesk.com/view/ACD/2016/ENU/?guid=GUID-A809CD71-4655-44E2-B674-1FE200B9FE30
(vl-load-com)
; --------------------------------------------------------------------------------
;; load settings
; (load "AutoCAD_Settings.vba")
; (defun S::STARTUP() (command "_VBALOAD" "AutoCAD_Settings.dvb"))
; (findfile "AutoCAD_Settings.dvb")
(command "_VBALOAD"  "AutoCAD_Settings.dvb")
(prompt "º”‘ÿÕÍ±œ")


