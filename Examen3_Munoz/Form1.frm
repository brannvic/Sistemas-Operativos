VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "ieframe.dll"
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.Form frmEscritorio 
   Caption         =   "Escritorio"
   ClientHeight    =   6000
   ClientLeft      =   225
   ClientTop       =   870
   ClientWidth     =   11130
   LinkTopic       =   "Form1"
   ScaleHeight     =   12075
   ScaleWidth      =   22800
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Musica 
      Caption         =   "Play"
      Height          =   495
      Left            =   240
      TabIndex        =   19
      Top             =   720
      Width           =   495
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      Height          =   3495
      Left            =   20040
      TabIndex        =   17
      Top             =   6840
      Width           =   2535
      ExtentX         =   4471
      ExtentY         =   6165
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin VB.Frame fraInicio 
      Caption         =   "Menu"
      BeginProperty Font 
         Name            =   "NSimSun"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5775
      Left            =   240
      TabIndex        =   11
      Top             =   4920
      Visible         =   0   'False
      Width           =   2775
      Begin VB.CommandButton cmdVMware 
         Caption         =   "VMware Workstation Pro"
         BeginProperty Font 
            Name            =   "NSimSun"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   795
         Left            =   120
         Picture         =   "Form1.frx":0000
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   4800
         Width           =   2535
      End
      Begin VB.CommandButton cmdVSCode 
         Caption         =   "Visual Studio Code"
         BeginProperty Font 
            Name            =   "NSimSun"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1035
         Left            =   120
         Picture         =   "Form1.frx":0638
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   3600
         Width           =   2535
      End
      Begin VB.CommandButton cmdTerminal 
         Caption         =   "Terminal"
         BeginProperty Font 
            Name            =   "NSimSun"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   120
         Picture         =   "Form1.frx":0EBF
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   2520
         Width           =   2535
      End
      Begin VB.CommandButton cmdWord 
         Caption         =   "Word"
         BeginProperty Font 
            Name            =   "NSimSun"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   120
         Picture         =   "Form1.frx":154D
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   1560
         Width           =   2535
      End
      Begin VB.CommandButton cmdFotos 
         Caption         =   "Fotos"
         BeginProperty Font 
            Name            =   "NSimSun"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1095
         Left            =   120
         Picture         =   "Form1.frx":1A38
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   360
         Width           =   2535
      End
   End
   Begin VB.PictureBox picBarraTareas 
      Align           =   2  'Align Bottom
      BackColor       =   &H00FF8080&
      Height          =   1230
      Left            =   0
      ScaleHeight     =   11.686
      ScaleMode       =   0  'User
      ScaleWidth      =   22740
      TabIndex        =   4
      Top             =   10845
      Width           =   22800
      Begin VB.CommandButton cmdInicio 
         Caption         =   "Inicio"
         BeginProperty Font 
            Name            =   "NSimSun"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   240
         Picture         =   "Form1.frx":2377
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   120
         Width           =   1575
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   21240
         Top             =   240
      End
      Begin VB.CommandButton cmdArchivos 
         Caption         =   "Explorador de Archivos"
         BeginProperty Font 
            Name            =   "NSimSun"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1035
         Left            =   14400
         Picture         =   "Form1.frx":2B09
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   120
         Width           =   2775
      End
      Begin VB.CommandButton cmdNotas 
         Caption         =   "Bloc de Notas"
         BeginProperty Font 
            Name            =   "NSimSun"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1035
         Left            =   10680
         Picture         =   "Form1.frx":3353
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   120
         Width           =   1815
      End
      Begin VB.CommandButton cmdGoogle 
         Caption         =   "Google"
         DisabledPicture =   "Form1.frx":3C7A
         BeginProperty Font 
            Name            =   "NSimSun"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1035
         Left            =   4560
         Picture         =   "Form1.frx":A4D6
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   120
         Width           =   975
      End
      Begin VB.CommandButton cmdCalc 
         Caption         =   "Calculadora"
         BeginProperty Font 
            Name            =   "NSimSun"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1035
         Left            =   7200
         Picture         =   "Form1.frx":ADEB
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   120
         Width           =   1545
      End
      Begin VB.Label lblHoraFecha 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "NSimSun"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   960
         Left            =   20400
         TabIndex        =   9
         Top             =   120
         Width           =   1815
      End
   End
   Begin VB.CommandButton cmdMostrarInfo 
      Caption         =   "Datos de la creadora"
      BeginProperty Font 
         Name            =   "NSimSun"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   20400
      TabIndex        =   3
      Top             =   0
      Width           =   2655
   End
   Begin VB.OptionButton Option3 
      Caption         =   "Fondo 3"
      BeginProperty Font 
         Name            =   "NSimSun"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2760
      TabIndex        =   2
      Top             =   0
      Width           =   1335
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Fondo 2"
      BeginProperty Font 
         Name            =   "NSimSun"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1320
      TabIndex        =   1
      Top             =   0
      Width           =   1455
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Fondo 1"
      BeginProperty Font 
         Name            =   "NSimSun"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1335
   End
   Begin WMPLibCtl.WindowsMediaPlayer WMP 
      Height          =   495
      Left            =   240
      TabIndex        =   18
      Top             =   720
      Width           =   3255
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   5741
      _cy             =   873
   End
   Begin VB.Image imgFondo 
      Height          =   10935
      Left            =   0
      Top             =   360
      Width           =   21975
   End
   Begin VB.Menu mnuInicio 
      Caption         =   "&Inicio"
      WindowList      =   -1  'True
   End
   Begin VB.Menu mnuBuscar 
      Caption         =   "Buscar..."
   End
   Begin VB.Menu mnuCamara 
      Caption         =   "Camara"
   End
   Begin VB.Menu mnuConfiguracion 
      Caption         =   "Configuracion"
   End
   Begin VB.Menu mnuCerrarSesion 
      Caption         =   "Cerrar Sesion"
   End
End
Attribute VB_Name = "frmEscritorio"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    ' Inicializar el fondo con la primera imagen y centrarla
    CambiarFondo App.Path & "\Imagenes\Fondo1.jpg", "Fondo inicial cargado"

    ' Configurar la barra de tareas
    picBarraTareas.Align = vbAlignBottom
    picBarraTareas.Height = 1200 ' Ajusta según necesite

    ' Iniciar el Timer para actualizar la hora
    Timer1.Enabled = True
    
    ' Cargar el GIF usando App.Path
    WebBrowser1.Navigate "file:///" & App.Path & "\Imagenes\dogxp.gif"
End Sub

' Musica a reproducir
Private Sub musica_Click()
    ' Asigna la ruta del archivo MP3
    WMP.URL = App.Path & "\Musica\cancion.mp3"
    
    ' Reproduce la canción cuando se haga clic en el botón
    WMP.Controls.play
End Sub

' Menu inicio
Private Sub cmdWord_Click()
    Shell "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE", vbNormalFocus
    fraInicio.Visible = False
End Sub

Private Sub cmdVSCode_Click()
    Shell "cmd /c start "" "" ""C:\Users\victo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk""", vbNormalFocus
    fraInicio.Visible = False
End Sub

Private Sub cmdVMware_Click()
    Shell "cmd /c start "" "" ""C:\ProgramData\Microsoft\Windows\Start Menu\Programs\VMware\VMware Workstation Pro.lnk""", vbNormalFocus
    fraInicio.Visible = False
End Sub

Private Sub cmdTerminal_Click()
    Shell "cmd /c start cmd", vbNormalFocus
    fraInicio.Visible = False
End Sub

Private Sub cmdFotos_Click()
    Shell "explorer.exe shell:Appsfolder\Microsoft.Windows.Photos_8wekyb3d8bbwe!App", vbNormalFocus
    fraInicio.Visible = False
End Sub

Private Sub cmdInicio_Click()
    fraInicio.Visible = Not fraInicio.Visible ' Cambia entre visible/oculto
End Sub

Private Sub mnuCerrarSesion_Click()
    ' Volver al login
    Unload Me        ' Cierra este escritorio
    frmInicioSesion.Show    ' Muestra tu formulario de login
End Sub

Private Sub mnuBuscar_Click()
    Dim term As String
    term = InputBox("Que quieres buscar en Google?", "Buscar en Google")
    If term <> "" Then
        term = Replace(term, " ", "%20")
        Shell "C:\Program Files\Google\Chrome\Application\chrome.exe https://www.google.com/search?q=" & term, vbNormalFocus
    End If
End Sub

Private Sub mnuCamara_Click()
    ' Abre la aplicación Cámara de Windows 10/11
    Shell "explorer.exe shell:AppsFolder\Microsoft.WindowsCamera_8wekyb3d8bbwe!App", vbNormalFocus
End Sub

Private Sub mnuConfiguracion_Click()
    ' Abre la Configuración de Windows
    Shell "explorer.exe ms-settings:", vbNormalFocus
End Sub

Private Sub Timer1_Timer()
    ' Mostrar la fecha y hora actual en el formato deseado
    lblHoraFecha.Caption = "Fecha: " & Format(Now, "dd/mm/yyyy") & vbCrLf & "Hora: " & Format(Now, "hh:mm:ss AMPM")
End Sub

Private Sub Form_Resize()
    AjustarFondo
End Sub

Private Sub AjustarFondo()
    With imgFondo
        .Left = 0
        .Top = 0
        .Width = Me.ScaleWidth
        .Height = Me.ScaleHeight
        .Stretch = True
    End With
End Sub

' Fondos a cambiar
Private Sub Option1_Click()
    CambiarFondo App.Path & "\Imagenes\Fondo1.jpg", "Fondo 1 cambiado"
End Sub

Private Sub Option2_Click()
    CambiarFondo App.Path & "\Imagenes\Fondo2.jpg", "Fondo 2 cambiado"
End Sub

Private Sub Option3_Click()
    CambiarFondo App.Path & "\Imagenes\Fondo3.jpg", "Fondo 3 cambiado"
End Sub

Private Sub CambiarFondo(ruta As String, mensaje As String)
    If Dir(ruta) <> "" Then
        imgFondo.Picture = LoadPicture(ruta)
        AjustarFondo
        frmNotificacion.Mostrar mensaje
    Else
        MsgBox "No se encontró la imagen: " & ruta, vbExclamation, "Error"
    End If
End Sub

' Ventana de informacion
Private Sub cmdMostrarInfo_Click()
    Dim info As String
    info = "Nombre: Victoria Monserrat Munoz San Agustin" & vbCrLf
    info = info & "Grupo: 6to Semestre" & vbCrLf
    info = info & "Carrera: Ingenieria en Computacion" & vbCrLf
    info = info & "Numero de cuenta: 3200094187" & vbCrLf
    info = info & "Contacto: victorua2104@gmail.com"
    MsgBox info, vbInformation, "Informacion de la Autora"
End Sub

' Botones de la barra de tareas
Private Sub cmdGoogle_Click()
    Shell "cmd /c start https://www.google.com", vbHide
End Sub

Private Sub cmdCalc_Click()
    Shell "calc.exe", vbNormalFocus
End Sub

Private Sub cmdNotas_Click()
    Shell "notepad.exe", vbNormalFocus
End Sub

Private Sub cmdArchivos_Click()
    Shell "explorer.exe " & App.Path, vbNormalFocus
End Sub

