<!-- Cargamos js que corresponde a vista de articulos -->

<script src="view/users/products.js"></script>
<div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Grafics 2D</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v3</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
<div class="col-md-12 col-sm-12 ">
    <div class="dashboard_graph">
       
    <!-- Title secction -->
    <div class="row x_title">
        <div class="col-md-6">
          <h3>Mantenimiento de Artículos </h3>
        </div>
        <div class="col-md-6">
          <h2>LISTA DE ARTICULOS</h2>
        </div>
    </div>        
          <div class="form-group">
            <div class="col-md-9">
                <div class="input-group">
                    <input type="text" class="global_filter form-control" id="global_filter" placeholder="Ingrese el código o nombre del artículo">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                </div>            
            </div>
            <div class="col-md-3">
                <button class="btn btn-primary" style="width: 100%" onclick="AbrirModal()"> <i class="glyphicon glyphicon-plus"></i>Nuevo Artículo</button>
            </div>              
          </div>
                          
                <div class="panel-body">
                    <table id="table_listdata" class="table table-striped table-bordered dt-responsive nowrap table-td-valign-middle" style="width:100%">

                    <thead class="bg-info text-white">
                        <tr>
                            <th>id</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Detalle</th>
                            <th>Precio </th>
                            <th>Cantidad</th>                            
                            <th>Categoría</th>
                            <th>Estado</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                     
                    </tbody>
                    <tfoot class="bg-info text-white">
                        <tr>
                           <th>id</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Detalle</th>
                            <th>Precio </th>
                            <th>Cantidad</th>                            
                            <th>Categoría</th>
                            <th>Estado</th>
                            <th>Opciones</th>
                        </tr>
                    </tfoot>
                    </table>
            </div>
        </div>
</div>


<!-- modal for inser and update -->
<form autocomplete="false" onsubmit="return false">
    <div class="modal fade " id="modal_editupdate" role="document"> 
        <div class="modal-dialog modal-lg modal-dialog-centered ">
            <div class="modal-content">
              
              <div class="modal-header bg-info">  
                <h3 class="modal-title text-white"><b>Formulario de Artículo</b></h3>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">&times;</button>
              </div>

              <div class="modal-body">
                <input type="hidden" value="0" id="newarticle">
                <div class="form-group row" >
                    <label class="col-sm-3 col-form-label" for="form-label">Nombre: <span class="required text-danger">*</span></label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control is-valid" id="namea" placeholder="Ingrese el Nombre" maxlength="40" minlength="1" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="form-label">Precio: <span class="required text-danger">*</span></label>
                    <div class="col-sm-9">
                        <input type="number" min="0.10" max="9999.00"  class="form-control is-valid" id="pricea" placeholder="Ingrese el precio" required onkeyup="validateinput(this)">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="form-label">Cantidad: <span class="required text-danger">*</span></label>
                    <div class="col-sm-9">
                        <input type="number" id="cantya" min="0.10" max="9999.00" class="form-control is-valid"  placeholder="Ingrese la cantidad">                   
                    </div>                        
                </div>

                <div class="form-group row">
                    <label class="col-form-label" for="form-label">Descripción: <span class="required text-danger">*</span></label>
                    <div class="col-sm-12">
                        <textarea class="form-control" class="descarticle"  name="desc" id="desc" rows="7"></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-form-label" for="form-label">Detalle: <span class="required text-danger">*</span></label>
                    <div class="col-sm-12">
                       <textarea class="form-control" class="descarticle" name="detalle" id="detalle" rows="7"></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="form-label">Categoría:</label>
                    <div class="col-sm-9">
                        <select name="cbcat" id="cbcat" class="form-control js-example-basic-single is-valid" style="width: 100%;"></select>
                    </div>
                </div>

                <div class="form-group row secestado">
                    <label class="col-sm-3 col-form-label " for="form-label">Estado: </label>
                    <div class="col-sm-9">
                        <select name="cbstate" id="cbstate" class="form-control js-example-basic-single is-valid" style="width: 100%;">
                            <option value="1">Disponible</option>
                            <option value="2">No Disponible</option>
                        </select>
                    </div>
                </div>
                                

              </div>


              <div class="modal-footer">
                <button type="button" class="btn btn-outline-danger"  data-dismiss="modal"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Cerrar Ventana</font></font></button>
                <button type="button"  class="btn btn-outline-success btnsave"  onclick="saveObjData()"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Guardar Artículo</font></font></button>
              </div>


            </div>
         </div>
    </div>
</form>

<script>
$(document).ready(function() {    
    
    $(".js-example-basic-single").select2();
    $("#modal_consulta").on('shown.bs.modal',function(){
        $("#nombrem").focus();  
    })

    tinymce.init({
        selector: '#desc',
        mode : "exact" ,
        elements : "country",
        plugins: "textcolor, table lists code",
        language: 'es',
        toolbar: " undo redo | bold italic | alignleft aligncenter alignright alignjustify \n\
                    | bullist numlist outdent indent | forecolor backcolor table code"
      });
    tinymce.init({

          selector: '#detalle',
          mode : "exact" ,
          elements : "country",
          language: 'es_MX',
          plugins: "textcolor, table lists code",
          toolbar: " undo redo | bold italic | alignleft aligncenter alignright alignjustify \n\
                    | bullist numlist outdent indent | forecolor backcolor table code"
      });

});

</script>