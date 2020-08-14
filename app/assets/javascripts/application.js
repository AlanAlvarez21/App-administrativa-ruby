// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require popper
//= require bootstrap
//= require rails-ujs
//= require sb-admin-2.min
//= require activestorage
//= require turbolinks
//= require_tree .


document.addEventListener("turbolinks:load", function()  {
    $("#buscador_productos").keyup(function(event){
            let termino = $(this).val();
            let id_modelo = $(this).data("model");
            let tipo_modelo = $(this).data("tipo");

            if (termino.length == 0) {
                        $("#tabla_buscador tbody").empty();
            }
            else {
                        request_url = getRootUrl() + "/buscador_productos/" + termino;
                        $.get(request_url, function(data, status){
                            if(data.length > 0) {
                                $("#tabla_buscador tbody").empty();
                                for(x in data){
                                    let nombre_producto = data[x].nombre_producto;
                                    let existencia = data[x].existencia;
                                    let id_producto = data[x].id;

                                    newRowContent = `<tr>

                                                        <td>${nombre_producto}</td>
                                                        <td>${existencia}</td>
                                                        <td><button type="button" class="btn btn-primary" onclick="seleccionarProducto(${id_producto}, ${id_modelo}, '${tipo_modelo}')">
                                                            Agregar
                                                            </button>
                                                        </td>                    
                                                    <tr>`;
                                    $("#tabla_buscador tbody").append(newRowContent);
                                }
                            }
                        });
            }              
});
});

function getRootUrl (){

     return window.location.origin;
}