// Obtenemos la IP pública al cargar la página
fetch('https://ifconfig.me/ip')
    .then(response => response.text())
    .then(ip => {
        document.getElementById('ip-publica').textContent = ip.trim();
    })
    .catch(error => {
        console.error('Error al obtener la IP pública:', error);
    });
