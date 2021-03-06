VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Form1 
   Caption         =   "Bulk Hash Lookup"
   ClientHeight    =   7770
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   11190
   LinkTopic       =   "Form2"
   ScaleHeight     =   7770
   ScaleWidth      =   11190
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      Height          =   285
      Left            =   8190
      TabIndex        =   8
      Top             =   150
      Width           =   645
   End
   Begin VB.TextBox txtCacheDir 
      Height          =   285
      Left            =   3780
      TabIndex        =   7
      Text            =   "C:\VT_Cache\"
      Top             =   120
      Width           =   4335
   End
   Begin VB.CheckBox chkCache 
      Caption         =   "Cache Reports"
      Height          =   285
      Left            =   2130
      TabIndex        =   6
      Top             =   120
      Width           =   1545
   End
   Begin VB.Timer tmrDelay 
      Enabled         =   0   'False
      Interval        =   4500
      Left            =   8700
      Top             =   540
   End
   Begin VB.CommandButton cmdAbort 
      Caption         =   "Abort"
      Height          =   405
      Left            =   9480
      TabIndex        =   5
      Top             =   60
      Width           =   1455
   End
   Begin MSComctlLib.ProgressBar pb 
      Height          =   285
      Left            =   60
      TabIndex        =   4
      Top             =   1740
      Width           =   10875
      _ExtentX        =   19182
      _ExtentY        =   503
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton cmdQuery 
      Caption         =   "Begin Query"
      Height          =   405
      Left            =   60
      TabIndex        =   3
      Top             =   60
      Width           =   1605
   End
   Begin VB.TextBox Text2 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3165
      Left            =   30
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   4530
      Width           =   10965
   End
   Begin MSComctlLib.ListView lv 
      Height          =   2445
      Left            =   30
      TabIndex        =   1
      Top             =   2040
      Width           =   10935
      _ExtentX        =   19288
      _ExtentY        =   4313
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   0   'False
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "hash"
         Object.Width           =   7056
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "detections"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Date"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Description"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.ListBox List1 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1230
      Left            =   30
      TabIndex        =   0
      Top             =   510
      Width           =   10935
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "Options"
      Begin VB.Menu mnuUsePrivateKey 
         Caption         =   "Use Private API Key"
      End
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "mnuPopup"
      Begin VB.Menu mnuCopyTable 
         Caption         =   "Copy Table"
      End
      Begin VB.Menu mnuCopyResult 
         Caption         =   "Copy Result"
      End
      Begin VB.Menu mnuCopyAll 
         Caption         =   "Copy All Results"
      End
      Begin VB.Menu mnuSaveReports 
         Caption         =   "Save Reports to Files"
      End
      Begin VB.Menu mnuDivider 
         Caption         =   "-"
      End
      Begin VB.Menu mnuClearList 
         Caption         =   "Remove All"
      End
      Begin VB.Menu mnuRemoveSelected 
         Caption         =   "Remove Selected"
      End
      Begin VB.Menu mnuRemoveUnsel 
         Caption         =   "Remove Unselected"
      End
      Begin VB.Menu mnuPrune 
         Caption         =   "Remove No Detections"
      End
      Begin VB.Menu mnuspacer55 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSearch 
         Caption         =   "Search All"
      End
      Begin VB.Menu mnuRescanSelected 
         Caption         =   "Rescan Selected"
      End
      Begin VB.Menu mnuDivider2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAddHashs 
         Caption         =   "Load Hashs from Clipboard"
      End
      Begin VB.Menu mnuViewRaw 
         Caption         =   "View raw JSON"
      End
      Begin VB.Menu mnuSpacer4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSubmitSelected 
         Caption         =   "Submit Selected Files"
      End
      Begin VB.Menu mnuSPacer5 
         Caption         =   "-"
      End
      Begin VB.Menu mnuClearCache 
         Caption         =   "Clear Cache"
      End
      Begin VB.Menu mnuClearSelectedFromCache 
         Caption         =   "Clear Selected From Cache"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim vt As New CVirusTotal
Dim selli As ListItem
Public abort As Boolean
Dim dlg As New clsCmnDlg
Dim fso As New CFileSystem2

Dim files As New Collection

Private Sub cmdAbort_Click()
    abort = True
End Sub

Private Sub cmdClear_Click()
    List1.Clear
    lv.ListItems.Clear
    Text2 = Empty
    Set selli = Nothing
End Sub

Private Sub cmdBrowse_Click()
    Dim f As String
    f = dlg.FolderDialog()
    If Len(f) = 0 Then Exit Sub
    txtCacheDir = f
End Sub


Private Sub cmdQuery_Click()
    
    Dim report As String
    Dim detections As Long
    Dim li As ListItem
    Dim scan As CScan
    Dim pth As String
    
    On Error Resume Next
    
    If lv.ListItems.Count = 0 Then
        MsgBox "Load hashs first!"
        Exit Sub
    End If
    
    vt.report_cache_dir = Empty
    
    If chkCache.value = 1 Then        'currently sets cache_dir to exist or not once at start of sub, cant change during operation..
        If Len(txtCacheDir) = 0 Then
            chkCache.value = 0
        Else
            If Not fso.FolderExists(txtCacheDir) Then
                If Not fso.buildPath(txtCacheDir) Then
                    chkCache.value = 0
                End If
            End If
        End If
        If fso.FolderExists(txtCacheDir) Then vt.report_cache_dir = txtCacheDir
    End If
        
    
    abort = False
    
    pb.Max = lv.ListItems.Count
    vt.delayInterval = IIf(pb.Max < 5, 2500, 17300) 'cant exceed 4 requests per minute...
    List1.AddItem "Max: " & pb.Max & " Interval: " & vt.delayInterval
    
    For Each li In lv.ListItems
    
        If abort Then Exit For
        
        If Len(Trim(li.Text)) = 0 Then GoTo nextone
        
        Set scan = vt.GetReport(li.Text, List1, tmrDelay)
        
        pth = PathForHash(li.Text)
        If Len(pth) > 0 Then scan.LocalFilePath = pth
    
        If Not scan.HadError Then
            li.SubItems(1) = scan.positives
            li.SubItems(2) = scan.scan_date
            li.SubItems(3) = scan.verbose_msg
            Set li.Tag = scan
        Else
            li.SubItems(1) = "Failure"
            li.SubItems(2) = Empty
            li.SubItems(3) = Empty
            Set li.Tag = Nothing
            Set vt = New CVirusTotal
        End If
        
        li.EnsureVisible
        DoEvents
        Me.Refresh
        pb.value = pb.value + 1
        
        If pb.value = lv.ListItems.Count Then GoTo nextone
        
nextone:
    Next
    
    pb.value = 0
    MsgBox "Queries Complete" & vbCrLf & vbcrllf & "Click on an item to view report.", vbInformation
 
 
End Sub



Private Sub Command2_Click()
'    Dim m_json As String
'    Dim b As String
'    Dim c As Long
'    Dim d As Dictionary
'
'    If AddComment(txtHash, Text2, m_json, b, c) Then
'        Set d = JSON.parse(m_json)
'        If d Is Nothing Then
'            List1.AddItem "AddComment JSON parsing error"
'            Exit Sub
'        End If
'
'        If JSON.GetParserErrors <> "" Then
'            List1.AddItem "AddComment Json Parse Error: " & JSON.GetParserErrors
'            Exit Sub
'        End If
'
'        If d.Item("response") <> 1 Then
'            MsgBox d.Item("verbose_msg")
'            Exit Sub
'        End If
'
'        MsgBox "Comment was added successfully", vbInformation
'
'    Else
'        MsgBox "Add Comment Failed Status code: " & c & " " & b
'    End If
        
   
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    abort = True
    SaveSetting "vt", "settings", "cachedir", txtCacheDir.Text
    SaveSetting "vt", "settings", "usecache", chkCache.value
End Sub

Private Sub mnuAddHashs_Click()
    On Error Resume Next
    Dim f As CFile
    
    x = Clipboard.GetText
    tmp = Split(x, vbCrLf)
    For Each x In tmp
        x = Trim(x)
        If Len(x) > 0 Then
            If InStr(x, ",") > 0 Then 'new "hash,path" format
                Y = Split(x, ",")
                Set f = New CFile
                f.hash = Y(0)
                f.path = Y(1)
                lv.ListItems.Add , , f.hash
                If fso.FileExists(f.path) Then files.Add f
            Else
                lv.ListItems.Add , , x
            End If
        End If
    Next
    
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    List1.Width = Me.Width - List1.Left - 200
    Text2.Width = List1.Width
    lv.Width = List1.Width
    pb.Width = List1.Width
    Text2.Height = Me.Height - Text2.Top - 400
End Sub



Private Sub Form_Load()
    
    On Error Resume Next
    
    Dim path As String
    Dim hash_mode As Boolean
    
    mnuUsePrivateKey.Checked = vt.usingPrivateKey
    mnuPopup.Visible = False
    Set vt.owner = Me
    txtCacheDir = GetSetting("vt", "settings", "cachedir", "c:\VT_Cache")
    chkCache.value = GetSetting("vt", "settings", "usecache", 0)
    
    lv.ColumnHeaders(4).Width = lv.Width - lv.ColumnHeaders(4).Left - 150
    
    'bulk can be a raw crlf hash list, or it can be a crlf hash,file list in which case submit is available, as well as file path included in report..
    If InStr(Command, "/bulk") > 0 Then
       If InStr(Command, "/bulktest") > 0 Then
            Clipboard.Clear
            limit = 4
            Clipboard.SetText Join(Split("f99e279d071fedc77073c4f979672a3c,e9e63cbcee86fa508856c84fdd5a8438,55c8660374ba2e76aa56012f0e48fbbf,6e7a8fe5ca03d765c1aebf9df7461da9,2f52937aab6f97dbf2b20b3d4a4b1226,c31b2f42c15d3c0080c8c694c569e8,e069c340a2237327e270d9bd5b9ed1dc,ab1de766e7fca8269efe04c9d6f91af0,142b70232a81a067673784e4e99e8165,60bf1bace9662117d5e0f1b2a825e5f3,6e6c35ad1d5271be255b2776f848521,bb41f3db526e35d722409086e3a7d111,00bdaecd9c8493b24488d5be0ff7393a,7b83a45568a8f8d8cdffcef70b95cb05,aa1e8e25bd36c313f4febe200c575fc7,f6e5d212dd791931d7138a106c42376c,e6c129c0694c043d8dda1afa60791cbf,3e4d1b61653fedeba122b33d15e1377d,48821e738e56d8802a89e28e1cab224d", ",", limit), vbCrLf)
       End If
       Me.Show
       mnuAddHashs_Click
       cmdQuery_Click
       
    ElseIf InStr(Command, "/submit") > 0 Then
        
        If InStr(Command, "/submitbulk") > 0 Then
            frmSubmit.SubmitBulk
        Else
           path = Replace(Command, """", Empty)
           path = Replace(path, "/submit", Empty)
           path = Trim(path)
           If Not fso.FileExists(path) Then
                MsgBox "File not found for /submit path=" & path, vbInformation
                End
           End If
           frmSubmit.SubmitFile CStr(path)
        End If
        
        Unload Me
        
    Else
        hash_mode = IIf(InStr(Command, "/hash") > 0, True, False)
        path = Replace(Command, """", Empty)
        If hash_mode Then path = Replace(path, "/hash", Empty)
        path = Trim(path)
        
        If Len(path) = 0 Then GoTo errorStartup
            
        If hash_mode Then
            Form2.StartFromHash path
        Else
            If Not fso.FileExists(path) Then GoTo errorStartup
            Form2.StartFromFile path
        End If
        Unload Me
    End If
    
    Exit Sub
errorStartup:
    List1.AddItem "Designed to be run from right click menus in explorer."
    List1.AddItem "You can add bulk hash lists to lookup by right click on listview"
    Me.Show
End Sub


Private Sub lv_ItemClick(ByVal Item As MSComctlLib.ListItem)
    On Error Resume Next
    Dim scan As CScan
    Set selli = Item
    Set scan = Item.Tag
    If scan Is Nothing Then Exit Sub
    Text2 = scan.GetReport()
End Sub

Private Function PathForHash(hash As String) As String
    Dim f As CFile
    For Each f In files
        If f.hash = hash Then
            PathForHash = f.path
            Exit Function
        End If
    Next
End Function

Private Sub lv_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
    If Button = 2 Then PopupMenu mnuPopup
End Sub


Private Sub mnuClearCache_Click()
    
    Dim f() As String
    Dim ff
    
    If fso.FolderExists(txtCacheDir) Then
        f() = fso.GetFolderFiles(txtCacheDir, "*.txt")
        For Each ff In f
            If Len(fso.FileNameFromPath(CStr(ff))) = 36 Then fso.DeleteFile CStr(ff)
        Next
    End If
    
End Sub

Private Sub mnuClearList_Click()
    cmdClear_Click
End Sub

Private Sub mnuClearSelectedFromCache_Click()
    Dim li As ListItem
    Dim fpath As String
    
    If fso.FolderExists(txtCacheDir) Then
        For Each li In lv.ListItems
            If li.Selected Then
                fpath = txtCacheDir & "\" & li.Text & ".txt"
                If fso.FileExists(fpath) Then fso.DeleteFile fpath
                li.SubItems(1) = Empty
                li.SubItems(2) = Empty
                li.SubItems(3) = Empty
            End If
        Next
    End If
    
End Sub

Private Sub mnuCopyAll_Click()
    Dim li As ListItem
    Dim r
    Dim scan As CScan
    
    On Error Resume Next
    
    For Each li In lv.ListItems
        r = r & li.Text & "  Detections: " & li.SubItems(1) & "  ScanDate: " & li.SubItems(2) & vbCrLf
    Next
    
    r = r & vbCrLf & vbCrLf
    
    For Each li In lv.ListItems
        Set scan = li.Tag
        r = r & scan.GetReport() & vbCrLf & String(60, "-") & vbCrLf & vbCrLf
    Next
    
    r = vbCrLf & "This is a temp file do a file SaveAs if you want to keep it." & vbCrLf & vbCrLf & r
    
    Dim tf As String
    tf = fso.GetFreeFileName(Environ("temp"))
    fso.writeFile tf, r
    Shell "notepad.exe """ & tf & """", vbNormalFocus
    
End Sub

Private Sub mnuCopyResult_Click()

On Error Resume Next

    If selli Is Nothing Then
        MsgBox "Nothing selected"
        Exit Sub
    End If
    
    Dim r As String
    Dim scan As CScan
    Set scan = selli.Tag
    
    r = selli.Text & "  Detections: " & selli.SubItems(1) & "  ScanDate: " & li.SubItems(2) & vbCrLf & String(50, "-") & vbCrLf & scan.GetReport()
    Clipboard.Clear
    Clipboard.SetText r
    MsgBox Len(r) & " bytes copied to clipboard"
    
End Sub

Private Sub mnuCopyTable_Click()

On Error Resume Next

    Dim li As ListItem
    Dim r
    Dim s As CScan
    
    For Each li In lv.ListItems
        r = r & li.Text & "  Detections: " & li.SubItems(1) & "  ScanDate: " & li.SubItems(2)
            
        Set s = li.Tag
        If Not s Is Nothing Then
            If Len(s.LocalFilePath) > 0 Then
                r = r & "  File: " & fso.FileNameFromPath(s.LocalFilePath)
            End If
        End If
        
        r = r & vbCrLf
    Next
    
    Clipboard.Clear
    Clipboard.SetText r
    MsgBox Len(r) & " bytes copied to clipboard"
    
End Sub

Private Sub mnuPrune_Click()
    Dim li As ListItem
    On Error Resume Next
    For i = lv.ListItems.Count To 1 Step -1
        Set li = lv.ListItems(i)
        If li.SubItems(1) = "0" Then lv.ListItems.Remove i
    Next
End Sub

Private Sub mnuRemoveSelected_Click()
    On Error Resume Next
    
    For i = lv.ListItems.Count To 1 Step -1
        If lv.ListItems(i).Selected Then lv.ListItems.Remove i
    Next
    
End Sub

Private Sub mnuRemoveUnsel_Click()
 On Error Resume Next
    
    For i = lv.ListItems.Count To 1 Step -1
        If Not lv.ListItems(i).Selected Then lv.ListItems.Remove i
    Next
    
End Sub

Private Sub mnuRescanSelected_Click()
    Dim li As ListItem
    Dim scan As CScan
    
    For Each li In lv.ListItems

        If li.Selected Then
            If Len(Trim(li.Text)) > 0 Then
            
                Set scan = vt.GetReport(li.Text, List1, tmrDelay)
                
                pth = PathForHash(li.Text)
                If Len(pth) > 0 Then scan.LocalFilePath = pth
                
                If Not scan.HadError Then
                    li.SubItems(1) = scan.positives
                    li.SubItems(2) = scan.scan_date
                    li.SubItems(3) = scan.verbose_msg
                    Set li.Tag = scan
                Else
                    li.SubItems(1) = "Failure"
                    li.SubItems(2) = Empty
                    li.SubItems(3) = Empty
                    Set li.Tag = Nothing
                    Set vt = New CVirusTotal
                End If
                
                li.EnsureVisible
                DoEvents
                
            End If
        End If
    Next
         
    
End Sub

Private Sub mnuSaveReports_Click()
    
    On Error Resume Next
    Dim li As ListItem
    Dim pf As String
    Dim scan As CScan
    Dim report As String
    
    pf = dlg.FolderDialog()
    If Len(pf) = 0 Then Exit Sub
    
    For Each li In lv.ListItems
        hash = li.Text
        Set scan = li.Tag
        
        report = "Hash: " & li.Text & vbCrLf & _
                 "Detections: " & li.SubItems(1) & vbCrLf & _
                 "ScanDate: " & li.SubItems(2) & vbCrLf & _
                 String(50, "-") & vbCrLf & vbCrLf & _
                 scan.GetReport()
                 
        fso.writeFile pf & "\VT_" & hash & ".txt", report
    Next

End Sub

Private Sub mnuSearch_Click()
    Dim li As ListItem
    Dim likeSearch As Boolean
    Dim cs As CScan
    Dim found As Long
    
    find = InputBox("Enter marker to search for, to use vb like operator prefix with like:")
    If Len(find) = 0 Then Exit Sub
    
    If Len(find) > 5 And VBA.Left(find, 5) = "like:" Then
        find = Trim(Mid(find, 6))
        likeSearch = True
    End If
    
    For Each li In lv.ListItems
        li.Selected = False
        Set cs = li.Tag
        If likeSearch Then
            If cs.GetReport() Like find Then li.Selected = True
        Else
            If InStr(1, cs.GetReport(), find, vbTextCompare) > 0 Then li.Selected = True
        End If
        If li.Selected Then
            found = found + 1
            li.EnsureVisible
        End If
    Next
    
    Me.Caption = found & " matches found for string: " & find
    
End Sub

Private Sub mnuSubmitSelected_Click()

    Dim li As ListItem
    Dim scan As CScan
    Dim pth As String
    
    List1.Clear
    List1.AddItem "Submitting selected files"
    
    For Each li In lv.ListItems

        If li.Selected Then
            If Len(Trim(li.Text)) > 0 Then
            
                pth = PathForHash(li.Text)
                If Len(pth) > 0 Then
                    Set scan = vt.SubmitFile(pth, List1, tmrDelay)
                    scan.response_code = 2 'manually overridden for getreport() display purposes..
                    li.SubItems(1) = scan.verbose_msg
                    Set li.Tag = scan
                Else
                    List1.AddItem "No file path found for " & li.Text
                End If
                
                li.EnsureVisible
                DoEvents
                
            End If
        End If
    Next
    
End Sub

Private Sub mnuUsePrivateKey_Click()
    Dim x As String
    
    x = InputBox("By default we use a rate limited public API key. If you have access to a private api key, you may enter it here to avoid delays. " & _
                 "Enter an empty string or hit cancel to clear the private key." & vbCrLf & vbCrLf & "Your key will be stored in the registry.", _
                 "Enter private api key", _
                 vt.ReadPrivateApiKey _
        )
                 
    vt.SetPrivateApiKey x
    mnuUsePrivateKey.Checked = vt.usingPrivateKey
    
    If vt.usingPrivateKey Then
        MsgBox "Private key successfull set", vbInformation
    Else
        MsgBox "You are now using the default public key which is rate limited and free for non-commercial use. " & vbCrLf & vbCrLf & "Please see the VirusTotal terms of service.", vbInformation
    End If
    
End Sub

Private Sub mnuViewRaw_Click()
    On Error Resume Next
    If selli Is Nothing Then Exit Sub
    Dim scan As CScan
    Set scan = selli.Tag
    Text2 = scan.RawJson
End Sub
