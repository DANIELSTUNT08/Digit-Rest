
class Vista{
    constructor(){}

    /**
     * 
     * @param {*} plantilla : plantilla a copiar
     * @param {*} destino : area donde se copea la plantilla
     */
    mostrarPlantilla(plantilla, destino){
        let dest = document.getElementById(destino);
        dest.innerHTML = "";
        let template = document.getElementById(plantilla);
        if (template) {
            let clon = template.content.cloneNode(true);
            dest.appendChild(clon);
        }
    }
}