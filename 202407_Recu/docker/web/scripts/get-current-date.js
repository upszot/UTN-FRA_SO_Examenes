// Obtener la fecha actual
var fechaActual = new Date();
var dia = fechaActual.getDate();
var mes = fechaActual.getMonth() + 1; // El mes es devuelto en base 0, por lo que sumamos 1
var anio = fechaActual.getFullYear();

// Formatear la fecha como "DD/MM/YYYY"
var fechaFormateada = `${dia}/${mes}/${anio}`;

// Insertar la fecha en el elemento HTML
document.getElementById('fecha').textContent = fechaFormateada;
