

/*peticiones fetch al servidor */
async function getApiData(url, datos){
	let resul = await fetch(url,{
		method: 'POST',
		body: datos
	})
	.then(converdata=>converdata.json())
	.then(resp=>resp)
	return resul;
}


var table;
function listArticle(){

	table = $("#table_listdata").DataTable({        
        "ordering":true,   
        "LengthChange":true,
        "LengthMenu" : true,
        "bInfo": true,
        "searching": { "regex": true },
        "lengthMenu": [ [5,10, 25, 50, 100, -1], [5,10, 25, 50, 100, "All"] ],
        "pageLength": 20,
        "destroy":true,
        "async": false ,
        "order": [[ 0, "asc" ]],
        "processing": true, 
        "dom": 'Bfrtip',      
         "buttons": [
              'copyHtml5',
              'excelHtml5',
              'csvHtml5',
              'pdfHtml5'
          ],
       "columnDefs": [//ocultar columna
            {
                "targets": [2],
                "visible": false
            },
            {
                "targets": [3],
                "visible": false
            }
        ],
       "ajax":{
           "url":"../cms/controller/listAllproductController.php",
           "type":'POST',
           "dataSrc": "data",
           error: function (e) {
                console.log(e);
            }

       },
       "columns":[
          {"data":"id"},
          {"data":"name"},
          {"data":"description"},
          {"data":"detalle"},
          {"data":"price",
            render: function(data, type, row){
              return '<span class="badge badge-success">S/. </span>'+row.price;
            }
          },
          {"data":"quantity" },
          {"data":"catname"},
          {"data":"state",
            render: function(data, type, row){
              if(row.state=='1'){
              return '<span class="badge badge-success">Activo</span>';
            }else{
              return '<span class="badge badge-danger">Inactivo </span>';
            }}
          },
          {"defaultContent": "No generated",
           render: function (data, type, row ) {
               if(row.state=='1'){
                  return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i>&nbsp;Editar</button>"                   ;
               }else{
                  return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i>&nbsp;Editar</button>";
               }
             }
          },           
       ],

       "language":idioma_espanol,
       select: true
   });


   document.getElementById("table_listdata_filter").style.display="none";
   
   $('input.global_filter').on( 'keyup click', function () {
        filterGlobal();
    });

    $('input.column_filter').on( 'keyup click', function () {
        filterColumn( $(this).parents('tr').attr('data-column') );
    });

}

function filterGlobal(){
    $("#table_listdata").DataTable().search(
        $("#global_filter").val(),
      ).draw();
}
/**
 * Muestra modal para registrar nuevo artículos
 */

function AbrirModal(){
  $("#modal_editupdate").modal("show")
  $("#modal_editupdate").modal({backdrop:'static', keyboard:false}) 
  $("#newarticle").val('0')
  $(".secodigo").removeAttr('style')
  $(".secestado").css({"display":"none"})
  $("#namea").val("")
    
  $("#pricea").val(1)
  $("#cantya").val(1)
  tinyMCE.get("detalle").setContent('');
  tinyMCE.get("desc").setContent('');
  $(".mce-branding-powered-by").css({"display":"none"})
  
  //listCombos("controllers/category/listCategory.php", "cbcat")
    
  $(".btnsave").html("Guardar Artículo")
  
}

function validateinput(e){
   var RE = /^\d*(\.\d{1})?\d{0,1}$/;
}

/**
 * editar Articulo
 */
$("#table_listdata").on('click','.editar',function(){
    var obj = table.row($(this).parents('tr')).data()
    if(table.row(this).child.isShown()){
      var obj = table.row(this).data()
    }
    //evitamos cerrar el modal
    $("#modal_editupdate").modal({backdrop:'static', keyboard:false})
    $("#modal_editupdate").modal("show")
    $(".secodigo").css({"display":"none"})
     $(".secestado").removeAttr('style')     
    $("#newarticle").val(obj.id)

    $("#namea").val(obj.name)   
    $("#pricea").val(obj.price)
    $("#cantya").val(obj.quantity)
    $("#cbcat").val(obj.idcat).trigger("change")
    $("#cbstate").val(obj.state).trigger("change")
    tinyMCE.get("detalle").setContent(obj.detalle);
    tinyMCE.get("desc").setContent(obj.description); 
    $(".mce-branding-powered-by").css({"display":"none"})
    //listCombos("controllers/category/listCategory.php", "cbcat")
    
    $(".btnsave").html("Actualizar Artículo")
})

/**
 * Listamos los combos del formulario
 */
function listCombos(pathApi,cbo){
  let url = pathApi
  let datos = new FormData();
  datos.append("id", 1);
  var options = "";
  let category = getApiData(url,datos)
  category.then(ps=>{
    var resul = ps['data']
    if(resul.length>0){
      for (var i = 0; i < resul.length; i++) {
          options +="<option value='"+resul[i].id+"'>"+resul[i].name+"</option>";
      }      
    }else{
       options="<option value='0'>No hay datos Disponibles</option>";
    } 

    $("#"+cbo).html(options)   
  })
  
}


function saveObjData(){
    let url = "controllers/article/iuarticleController.php";
    let skua    =$("#skua").val()
    let namea   =$("#namea").val()
    let pricea  =$("#pricea").val()
    let cantya  =$("#cantya").val()
    let cbcat   =$("#cbcat").val()
    let cbsize  =$("#cbsize").val()
    let cbmarca =$("#cbmarca").val()
    let cbstate =$("#cbstate").val()
    let newarticle =$("#newarticle").val()

    let datos= new FormData()

        datos.append("skua",skua)
        datos.append("namea",namea)
        datos.append("pricea",pricea)
        datos.append("cantya",cantya)
        datos.append("cbcat",cbcat)
        datos.append("cbsize",cbsize)
        datos.append("cbmarca",cbmarca)
        datos.append("cbstate",cbstate)
        datos.append("newarticle",newarticle)


        let resul = getApiData(url,datos)
        resul.then(ps=>{
          
          if(ps==true && newarticle !="0"){
            alertSms('success','El articulo se Actualizó')
            $("#modal_editupdate").modal("hide")            
              table.ajax.reload();
          }else if(ps==true && newarticle=="0"){            
            alertSms('success','El articulo se Guardó')
            $("#modal_editupdate").modal("hide")
              table.ajax.reload();
          }else{
            alertSms("error","<h3>El articulo no se Guardó</h3><br> <span class='text-danger'>"+ps+"</span>")
          }
        })
}

function alertSms(typoaler,sms){
    Swal.fire({ position: 'top-center',
    icon: typoaler,
    title: sms,
    showConfirmButton: false,              
    timer: 1500,
    timerProgressBar: true,
    onBeforeOpen: ()=>{
      Swal.showLoading()
    }
  });
}
listArticle();