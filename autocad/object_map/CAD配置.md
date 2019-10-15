


按照[Object Model (ActiveX)](http://help.autodesk.com/view/ACD/2016/ENU/?guid=GUID-A809CD71-4655-44E2-B674-1FE200B9FE30)的模型，cad的对象结构如下

- Application
  - Preferences
    - [PreferncesDisply](PreferncesDisply.md)
    - PreferencesDrafting
    - PreferencesFiles
    - PreferencesOpenSave
    - PreferencesOutput
    - PreferencesProfiles
    - PreferencesSelection
    - PreferencesSystem
    - PreferencesUser
  - Documents
  - Document
    - Blocks - Block
      - Geometries
      - Database
    - ModelSpace
      - Geometries
    - PaperSpace
      - Geometries
      - PViewport
    - Dictionaries
    - DimStyles
    - FileDependencies
    - Groups
    - Layers
    - Layouts
    - Linetypes
