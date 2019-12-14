








# 创建 OpenFileDialog 对象
# 获取一个文件明
Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    InitialDirectory = [Environment]::GetFolderPath('Desktop') 
    Filter = 'Documents (*.docx)|*.docx|SpreadSheet (*.xlsx)|*.xlsx'
    Title = 'Select files to open'
}
# 显示这个对象
$FileBrowser.ShowDialog()
# 拿到对象的 FileName 属性
$FileBrowser.FileName

