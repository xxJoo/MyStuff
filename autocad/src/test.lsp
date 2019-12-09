




(setq acadObj (vlax-get-acad-object))
(setq preferences (vla-get-Preferences acadObj))

;; Retrieve the current SupportPath value
(setq currSupportPath (vla-get-SupportPath (vla-get-Files preferences)))
(alert (strcat "The current value for SupportPath is " currSupportPath))