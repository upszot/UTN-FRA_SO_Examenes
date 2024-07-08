fetch('/file/info.txt')
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.text();
    })
    .then(content => {
        document.getElementById('contenido-archivo-texto').value = content;
    })
    .catch(error => {
        console.error('Error al obtener el contenido del archivo:', error);
        document.getElementById('contenido-archivo-texto').value = 'Error al obtener el contenido del archivo.';
    });
