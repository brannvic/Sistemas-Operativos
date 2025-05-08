VERSION 5.00
Begin VB.Form frmNotificacion 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Notificacion"
   ClientHeight    =   4620
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   4500
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4620
   ScaleWidth      =   4500
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   1920
      Top             =   1800
   End
   Begin VB.Label lblMsg 
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "NSimSun"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1793
      TabIndex        =   0
      Top             =   1920
      Width           =   975
   End
End
Attribute VB_Name = "frmNotificacion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Sub Mostrar(texto As String)
    lblMsg.Caption = texto
    Me.Show vbModal
End Sub

Private Sub Form_Load()
    ' Estilo de borde y título
    Me.BorderStyle = 1 ' Fijo
    Me.Caption = "Notificacion"

    ' Tamaño del formulario (más pequeño)
    Me.Width = 3000
    Me.Height = 1500

    ' Centrar el formulario en la pantalla
    Me.Move (Screen.Width - Me.Width) \ 2, (Screen.Height - Me.Height) \ 2

    ' Configurar la etiqueta del mensaje
    lblMsg.Left = 200
    lblMsg.Top = 400
    lblMsg.Width = 2600
    lblMsg.Height = 500
    lblMsg.Alignment = vbCenter
    lblMsg.FontSize = 10
    ' Configurar y activar el temporizador para autocierre
    Timer1.Interval = 1000
    Timer1.Enabled = True
End Sub

Public Sub MostrarNotificacion(texto As String)
    lblMsg.Caption = texto
    Me.Show vbModal
End Sub

Private Sub Timer1_Timer()
    Unload Me ' Cerrar la ventana de notificación
End Sub


