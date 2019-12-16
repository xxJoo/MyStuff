

# 创建 OpenFileDialog 对象
# 获取一个文件名
Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    InitialDirectory = [Environment]::GetFolderPath('Desktop') 
    Filter = 'Documents (*.docx)|*.docx|SpreadSheet (*.xlsx)|*.xlsx'
    Title = 'Select files to open'
}
# 显示这个对象
$FileBrowser.ShowDialog()
# 拿到对象的 FileName 属性
$FileBrowser|Get-Member
<# 
TypeName:System.Windows.Forms.OpenFileDialog

Name                         MemberType Definition
----                         ---------- ----------
Disposed                     Event      System.EventHandler Disposed(System.Object, System.EventArgs)
FileOk                       Event      System.ComponentModel.CancelEventHandler FileOk(System.Object, System.Compon...
HelpRequest                  Event      System.EventHandler HelpRequest(System.Object, System.EventArgs)
CreateObjRef                 Method     System.Runtime.Remoting.ObjRef CreateObjRef(type requestedType)
Dispose                      Method     void Dispose(), void IDisposable.Dispose()
Equals                       Method     bool Equals(System.Object obj)
GetHashCode                  Method     int GetHashCode()
GetLifetimeService           Method     System.Object GetLifetimeService()
GetType                      Method     type GetType()
InitializeLifetimeService    Method     System.Object InitializeLifetimeService()
OpenFile                     Method     System.IO.Stream OpenFile()
Reset                        Method     void Reset()
ShowDialog                   Method     System.Windows.Forms.DialogResult ShowDialog(), System.Windows.Forms.DialogR...
ToString                     Method     string ToString()
AddExtension                 Property   bool AddExtension {get;set;}
AutoUpgradeEnabled           Property   bool AutoUpgradeEnabled {get;set;}
CheckFileExists              Property   bool CheckFileExists {get;set;}
CheckPathExists              Property   bool CheckPathExists {get;set;}
Container                    Property   System.ComponentModel.IContainer Container {get;}
CustomPlaces                 Property   System.Windows.Forms.FileDialogCustomPlacesCollection CustomPlaces {get;}
DefaultExt                   Property   string DefaultExt {get;set;}
DereferenceLinks             Property   bool DereferenceLinks {get;set;}
FileName                     Property   string FileName {get;set;}
FileNames                    Property   string[] FileNames {get;}
Filter                       Property   string Filter {get;set;}
FilterIndex                  Property   int FilterIndex {get;set;}
InitialDirectory             Property   string InitialDirectory {get;set;}
Multiselect                  Property   bool Multiselect {get;set;}
ReadOnlyChecked              Property   bool ReadOnlyChecked {get;set;}
RestoreDirectory             Property   bool RestoreDirectory {get;set;}
SafeFileName                 Property   string SafeFileName {get;}
SafeFileNames                Property   string[] SafeFileNames {get;}
ShowHelp                     Property   bool ShowHelp {get;set;}
ShowReadOnly                 Property   bool ShowReadOnly {get;set;}
Site                         Property   System.ComponentModel.ISite Site {get;set;}
SupportMultiDottedExtensions Property   bool SupportMultiDottedExtensions {get;set;}
Tag                          Property   System.Object Tag {get;set;}
Title                        Property   string Title {get;set;}
 #>