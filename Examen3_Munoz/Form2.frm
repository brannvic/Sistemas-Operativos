VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "ieframe.dll"
Begin VB.Form frmInicioSesion 
   Caption         =   "Bloqueo"
   ClientHeight    =   5910
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   10320
   LinkTopic       =   "Form2"
   Picture         =   "Form2.frx":0000
   ScaleHeight     =   5910
   ScaleWidth      =   10320
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   120
      Left            =   11880
      Top             =   1200
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser2 
      Height          =   3495
      Left            =   13200
      TabIndex        =   7
      Top             =   6000
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
      Location        =   ""
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      Height          =   3495
      Left            =   7680
      TabIndex        =   6
      Top             =   6000
      Width           =   2655
      ExtentX         =   4683
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
      Location        =   ""
   End
   Begin VB.CommandButton Ingresar 
      Caption         =   "Iniciar sesion"
      BeginProperty Font 
         Name            =   "NSimSun"
         Size            =   15
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   13200
      TabIndex        =   5
      Top             =   5160
      Width           =   2535
   End
   Begin VB.CommandButton Salir 
      Caption         =   "Salir"
      BeginProperty Font 
         Name            =   "NSimSun"
         Size            =   15
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   8400
      TabIndex        =   4
      Top             =   5160
      Width           =   1215
   End
   Begin VB.TextBox Contrasena 
      Alignment       =   2  'Center
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   10320
      PasswordChar    =   "*"
      TabIndex        =   2
      Top             =   3360
      Width           =   5415
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Contrasena:"
      BeginProperty Font 
         Name            =   "NSimSun"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   8520
      TabIndex        =   3
      Top             =   3480
      Width           =   1695
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Ingresa tu contrasena"
      BeginProperty Font 
         Name            =   "NSimSun"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   10560
      TabIndex        =   1
      Top             =   2040
      Width           =   3615
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Me alegro de verte de nuevo en YakOS!"
      BeginProperty Font 
         Name            =   "NSimSun"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   8640
      TabIndex        =   0
      Top             =   1200
      Width           =   7215
   End
   Begin VB.Image Image1 
      Height          =   13200
      Left            =   -2880
      Stretch         =   -1  'True
      Top             =   -2040
      Width           =   23280
   End
End
Attribute VB_Name = "frmInicioSesion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim intentos As Integer  ' Declaración de la variable de intentos fuera de la función

Private Sub Form_Load()
    frmEscritorio.Hide  ' Oculta el formulario principal
    intentos = 0  ' Inicializa el contador de intentos

    ' Cargar la imagen de fondo
    Image1.Picture = LoadPicture(App.Path & "\Imagenes\Fondo.jpg")
    Image1.Stretch = True

    ' Ajustar tamaño del fondo al tamaño del formulario
    AjustarFondo

    ' Asegurar que los controles estén al frente
    Label1.ZOrder 0
    Label2.ZOrder 0
    Label3.ZOrder 0
    Contrasena.ZOrder 0
    Ingresar.ZOrder 0
    Salir.ZOrder 0
    
    ' Cargar GIFs desde la carpeta de imágenes en el directorio de la aplicación
    Dim rutaGif1 As String, rutaGif2 As String
    rutaGif1 = App.Path & "\Imagenes\merlinxp.gif"
    rutaGif2 = App.Path & "\Imagenes\clippyxp.gif"

    ' Cargar los GIFs en el control WebBrowser
    WebBrowser1.Navigate "file:///" & rutaGif1
    WebBrowser2.Navigate "file:///" & rutaGif2
End Sub

Private Sub Form_Resize()
    AjustarFondo
End Sub

Private Sub AjustarFondo()
    With Image1
        .Left = 0
        .Top = 0
        .Width = Me.ScaleWidth
        .Height = Me.ScaleHeight
    End With
End Sub

Private Sub Ingresar_Click()
    Dim contrasenaCorrecta As String
    contrasenaCorrecta = "Sandias21"  ' Define la contraseña correcta

    ' Verificar si la contraseña ingresada es correcta
    If Contrasena.Text = contrasenaCorrecta Then
        MsgBox "Bienvenido, acceso correcto.", vbInformation, "Inicio de sesión"
        
        ' Mostrar el formulario de escritorio
        frmEscritorio.Show
        Unload Me  ' Cierra el formulario de login

    Else
        intentos = intentos + 1  ' Incrementa el contador de intentos
        If intentos >= 3 Then
            MsgBox "Número máximo de intentos alcanzado. Saliendo...", vbCritical, "Error"
            Unload Me  ' Cierra el formulario o la aplicación
        Else
            MsgBox "Contraseña incorrecta. Intentos restantes: " & (3 - intentos), vbExclamation, "Error"
        End If
    End If
End Sub

Private Sub Salir_Click()
    ' Cierra la aplicación si el usuario hace clic en salir
    Unload Me
End Sub

