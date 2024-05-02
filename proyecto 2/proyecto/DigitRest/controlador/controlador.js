let vista = new Vista();



document.body.onload = function(){
    vista.mostrarPlantilla('template-form-ingreso', 'contenido');
    //vista.mostrarPlantilla('btn-pie-pagina', 'area-btn-pie')
    
}

function mostrarFormRegistro() {
    vista.mostrarPlantilla('template-form-registro', 'contenido');
    
}
