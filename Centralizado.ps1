Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -ErrorAction SilentlyContinue
Add-Type -assembly System.Windows.Forms
Add-Type -AssemblyName PresentationCore,PresentationFramework

Clear-Host

#Declaramos los objetos y la ventana.
$mainForm = New-Object System.Windows.Forms.Form
$Label = New-Object System.Windows.Forms.Label
$ComboBox = New-Object System.Windows.Forms.ComboBox
$ProgressBar = New-Object System.Windows.Forms.ProgressBar
$Button = New-Object System.Windows.Forms.Button

function ventana()
{
#Creamos la ventana.
$mainForm.Text = 'Jeremos Software'
$mainForm.Width = 0
$mainForm.Height = 0
$mainForm.AutoSize = $true
$mainForm.MaximizeBox = $false
$mainForm.StartPosition = "CenterScreen"
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Fixed3D
Invoke-WebRequest "https://github.com/jeremiassamuelzitnik/Centralizado/raw/main/Icono.ico" -outfile $env:TEMP\JeremosIcon.ico
$mainForm.Icon = "$env:TEMP\JeremosIcon.ico"


}
function label()
{
#Creamos y ubicamos el Label.
$Label.Text = "Seleccionar un script:"
$Label.Location  = New-Object System.Drawing.Point(3,10)
$Label.AutoSize = $true
#Agregamos el Label en el main.
$mainForm.Controls.Add($Label)

}
function combobox()
{
#Creamos y ubicamos el ComboBox.

$ComboBox.Width = 255
$ComboBox.Location  = New-Object System.Drawing.Point(3,35)
$ComboBox.TabIndex = 0
#Agregamos los items al combo box.
$comboBox.Items.Add("Seleccionar")
$comboBox.Items.Add("Script General")
$comboBox.Items.Add("Jeremos Software Updater")
$comboBox.DropDownStyle = "DropDownList"
$comboBox.Selectedindex = 0
#Agregamos ComboBox al main form.
$mainForm.Controls.Add($ComboBox)

}
function progressbar()
{
$ProgressBar.Location = New-Object System.Drawing.Point(3,60)
$ProgressBar.Width = 255
$ProgressBar.Style = "Marquee"
$ProgressBar.MarqueeAnimationSpeed = 0
$ProgressBar.Visible=$false

$mainForm.Controls.Add($ProgressBar);
}
function boton()
{
#Creamos y ubicamos el Boton.
$Button.Location = New-Object System.Drawing.Size(158,5)
$Button.Size = New-Object System.Drawing.Size(100,25)
$Button.Text = "Ejectuar"

#Agregamos el Boton al main.
$mainForm.Controls.Add($Button)
}

function ejecucion()
{
$Label.Text = "Ejecutando, espere por favor."
$ProgressBar.Visible=$true
$ProgressBar.MarqueeAnimationSpeed=10


if ($comboBox.SelectedIndex.Equals(0) = $true) 
{
[System.Windows.MessageBox]::Show("No se ha seleccionado nada.","Atención", "OK", "Warning")
}

elseif ($comboBox.SelectedIndex.Equals(1) = $true) 
{
Start-Process -Wait Powershell "iwr -useb https://raw.githubusercontent.com/jeremiassamuelzitnik/Soporte/main/ScriptGeneral.ps1 | iex" -verb runas -WindowStyle Minimized

}

elseif ($comboBox.SelectedIndex.Equals(2) = $true) 
{
Start-Process -Wait Powershell "iwr -useb https://raw.githubusercontent.com/jeremiassamuelzitnik/Updater/main/Instalador/Instalar.ps1 | iex" -verb runas -WindowStyle Minimized -ErrorAction Continue 
}


$Label.Text = "Seleccionar un script:"
$ProgressBar.MarqueeAnimationSpeed=0
$ProgressBar.Visible=$false
$mainForm.Width = 0
$mainForm.Height = 0
}



ventana
label
combobox
progressbar
boton
#Accion del boton.
$Button.Add_Click({ejecucion})

Clear-Host
#Ejecutamos la ventana.
$mainForm.ShowDialog() 
