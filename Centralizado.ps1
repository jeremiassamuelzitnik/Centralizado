Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
Add-Type -assembly System.Windows.Forms

#Declaramos los objetos y la ventana.
$mainForm = New-Object System.Windows.Forms.Form
$Label = New-Object System.Windows.Forms.Label
$Button = New-Object System.Windows.Forms.Button
$ComboBox = New-Object System.Windows.Forms.ComboBox

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
$mainForm.Icon = "https://github.com/jeremiassamuelzitnik/Centralizado/raw/main/Icono.ico"

}
function label()
{
#Creamos y ubicamos el Label.
$Label.Text = "Seleccionar un script:"
$Label.Location  = New-Object System.Drawing.Point(5,10)
$Label.AutoSize = $true
#Agregamos el Label en el main.
$mainForm.Controls.Add($Label)

}
function combobox()
{
#Creamos y ubicamos el ComboBox.

$ComboBox.Width = 250
$ComboBox.Location  = New-Object System.Drawing.Point(5,35)
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
function boton()
{
#Creamos y ubicamos el Boton.
$Button.Location = New-Object System.Drawing.Size(155,5)
$Button.Size = New-Object System.Drawing.Size(100,25)
$Button.Text = "Ejectuar"

#Agregamos el Boton al main.
$mainForm.Controls.Add($Button)
}

function ejecucion()
{
$Label.Text = "Ejecutando, espere por favor."
echo $comboBox.SelectedIndex

if ($comboBox.SelectedIndex.Equals(0) = $true) 
{
[System.Windows.MessageBox]::Show("¡No se seleccionó nada!","Atención", "OK", "Warning")
}

elseif ($comboBox.SelectedIndex.Equals(1) = $true) 
{
Start-Process -wait Powershell "iwr -useb https://raw.githubusercontent.com/jeremiassamuelzitnik/Soporte/main/ScriptGeneral.ps1 | iex" -verb runas -WindowStyle Minimized

}

elseif ($comboBox.SelectedIndex.Equals(2) = $true) 
{
Start-Process -wait Powershell "iwr -useb https://raw.githubusercontent.com/jeremiassamuelzitnik/Updater/main/Instalador/Instalar.ps1 | iex" -verb runas -WindowStyle Minimized -ErrorAction Continue
}



$Label.Text = "Seleccionar un script:"
}



ventana
label
combobox
boton

#Accion del boton.
$Button.Add_Click(
{
ejecucion
}
)


#Ejecutamos la ventana.
$mainForm.ShowDialog() 
