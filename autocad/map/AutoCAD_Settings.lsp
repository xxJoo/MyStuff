;;; my autocad settings
;;; http://help.autodesk.com/view/ACD/2016/ENU/?guid=GUID-A809CD71-4655-44E2-B674-1FE200B9FE30
(vl-load-com)
; --------------------------------------------------------------------------------
;; This example returns the current setting of
;; CursorSize. It then changes the value, and finally
;; it resets the value back to the original setting.
(setq acadObj (vlax-get-acad-object))
(setq doc (vla-get-ActiveDocument acadObj))
(setq preferences (vla-get-Preferences acadObj))
; --------------------------------------------------------------------------------
(setq ACADPref (vla-get-Display preferences))
; --------------------------------------------------------------------------------
;; Retrieve the current CursorSize value
(setq currCursorSize (vla-get-CursorSize ACADPref))
;; Change the value for CursorSize
(vla-put-CursorSize ACADPref 10)
;; Reset CursorSize to its original value
; (vla-put-CursorSize ACADPref currCursorSize)
; --------------------------------------------------------------------------------
;; Read and display the original value
(setq originalAutoTrackingVecColor (vla-get-AutoTrackingVecColor ACADPref))
;; Modify the AutoTrackingVecColor preference by making it red
(vla-put-AutoTrackingVecColor ACADPref (vlax-make-variant acRed 19))
;; Reset AutoTrackingVecColor to its original value
; (vla-put-AutoTrackingVecColor ACADPref originalAutoTrackingVecColor)
; --------------------------------------------------------------------------------
;; Read and display the original value
(setq originalDisplayLayoutTabs (vla-get-DisplayLayoutTabs ACADPref))
;; Modify the DisplayLayoutTabs preference by toggling the value
; (vla-put-DisplayLayoutTabs ACADPref :vlax-false)
(vla-put-DisplayLayoutTabs ACADPref :vlax-true)
;; Reset DisplayLayoutTabs to its original value
; (vla-put-DisplayLayoutTabs ACADPref originalDisplayLayoutTabs)
; --------------------------------------------------------------------------------
;; Retrieve the current DisplayScreenMenu value
(setq currDisplayScreenMenu (vla-get-DisplayScreenMenu ACADPref))
;; Change the value for DisplayScreenMenu
; (vla-put-DisplayScreenMenu ACADPref :vlax-true)
(vla-put-DisplayScreenMenu ACADPref :vlax-false)
;; Reset DisplayScreenMenu to its original value
; (vla-put-DisplayScreenMenu ACADPref currDisplayScreenMenu)
; --------------------------------------------------------------------------------
;; Set PaperSpace/Layout current
(vla-put-ActiveSpace doc acPaperSpace)
;; Retrieve the current GraphicsWinLayoutBackgrndColor value
(setq currGrphcWnLytBckgrndColor (vla-get-GraphicsWinLayoutBackgrndColor ACADPref))
;; Change the value for GraphicsWinLayoutBackgrndColor
(vla-put-GraphicsWinLayoutBackgrndColor ACADPref (vlax-make-variant vbBlack))
;; Reset GraphicsWinLayoutBackgrndColor to its original value
; (vla-put-GraphicsWinLayoutBackgrndColor ACADPref currGrphcWnLytBckgrndColor)
; --------------------------------------------------------------------------------
