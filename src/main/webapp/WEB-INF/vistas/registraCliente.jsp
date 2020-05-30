<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Registrar Cliente</title>
</head>
<body>

<div class="container">
<h1>Registrar Cliente</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registraCliente" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nom_cliente">Nombres</label>
				<input class="form-control" type="text" id="id_nom_cliente" name="nomCliente" placeholder="Ingrese sus nombres" maxlength="45">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_ape_cliente">Apellidos</label>
				<input class="form-control" type="text" id="id_ape_cliente" name="apeCliente" placeholder="Ingrese sus apellidos" maxlength="45" />
			</div>
			<div class="form-group">
				<label class="control-label" for="id_dni_cliente">DNI</label>
				<input class="form-control" type="text" id="id_dni_cliente" name="dniCliente" placeholder="Ingrese el DNI"  maxlength="8"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fec_nac_cliente">Fecha de Nacimiento</label>
				<input class="form-control" type="text" id="id_fec_nac_cliente" name="fnacCliente" placeholder="Ingrese la fecha de nacimiento. Formato 'YYYY/MM/DD'"  maxlength="10"/>
			</div>
			
			
			<div class="form-group">
				<label class="control-label" for="cod_tipo">Tipo</label>
				<select id="cod_tipo" name="tipo.codTipo" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crear Cliente</button>
			</div>
	</form>
</div>
<script type="text/javascript">
console.log("inicio");
$.getJSON("cargaTipo", {}, function(data){
	console.log("inicio2");
	$.each(data, function(index,item){
		$("#cod_tipo").append("<option value="+item.codTipo +">"+ item.nomTipo +"</option>");
	});
});
</script>



<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nomCliente: {
    		selector : '#id_nom_cliente',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 3 a 40 caracteres',
                	min : 3,
                	max : 40
                }
            }
        },
        apeCliente: {
    		selector : '#id_ape_cliente',
            validators: {
                notEmpty: {
                    message: 'El apellido es un campo obligatorio'
                },
                stringLength :{
                	message:'El apellido es de 3 a 40 caracteres',
                	min : 3,
                	max : 40
                }
            }
        },
        dniCliente: {
    		selector : '#id_dni_cliente',
            validators: {
            	notEmpty: {
                    message: 'El dni es un campo obligatorio'
                },
                regexp: {
                    regexp: /^[0-9]{8}$/,
                    message: 'el dni es 8 dígitos'
                }
            }
        },
        fnacCliente: {
    		selector : '#id_fec_nac_cliente',
            validators: {
            	notEmpty: {
                    message: 'La fecha de nacimiento es un campo obligatorio'
                },
                date: {
                    format: 'YYYY/MM/DD',
                    message: 'El valor ingresado es incorrecto, el formato debe de ser YYYY/MM/DD. Por ejemplo 2020/01/01'
                }
            }
        },

        codTipo: {
    		selector : '#cod_tipo',
            validators: {
            	notEmpty: {
                    message: 'El tipo es un campo obligatorio'
                },
            }
        },
    	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>