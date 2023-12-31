# Comando

Esto mostrará el texto como un bloque de código en tu README, respetando la sintaxis y resaltando adecuadamente el código de PowerShell. Sin embargo, en GitHub no se puede hacer clic directamente en el bloque para copiarlo.

Si deseas incluir un icono de copiar que sea visible y pueda ser seleccionado para copiar manualmente el texto, te recomendaría añadir una instrucción sencilla cerca del bloque de código para que los usuarios sepan que pueden copiarlo manualmente:

```markdown
<kbd>Ctrl</kbd> + <kbd>C</kbd> to copy

```plaintext
Powershell "iwr -useb https://raw.githubusercontent.com/jeremiassamuelzitnik/Centralizado/main/Centralizado.ps1" | iex


