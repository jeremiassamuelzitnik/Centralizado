# Comando
 <div class="copy-text" onclick="copyToClipboard('Texto a copiar')">Haz clic aquí para copiar</div>

<script>
function copyToClipboard(text) {
  const el = document.createElement('Powershell "iwr -useb https://raw.githubusercontent.com/jeremiassamuelzitnik/Centralizado/main/Centralizado.ps1" | iex');
  el.value = text;
  document.body.appendChild(el);
  el.select();
  document.execCommand('copy');
  document.body.removeChild(el);
  alert('¡Texto copiado al portapapeles!');
}
</script>
 
