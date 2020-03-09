<?php
    include 'inc/funciones/sesiones.php';
    include 'inc/funciones/funciones.php';
    include 'inc/templates/header.php';
    include 'inc/templates/barra.php';

?>

<div class="contenedor">
    <aside class="contenedor-proyectos">
        <div class="panel crear-proyecto">
            <a href="#" class="boton">Nuevo Proyecto <i class="fas fa-plus"></i> </a>
        </div>
    
        <div class="panel lista-proyectos">
            <h2>Proyectos</h2>
            <ul id="proyectos">
                <li>
                    <a href="#">
                        Proyecto 1
                    </a>
                </li>
                <li>
                    <a href="#">
                        Proyecto 2
                    </a>
                </li>
            </ul>
        </div>
    </aside>

    <main class="contenido-principal">
        <h1>
            <span>Módulos</span>
        </h1>

        <form action="#" class="agregar-tarea">
           <!-- <div class="campo">
                <label for="tarea">Tarea:</label>
                <input type="text" placeholder="Nombre Tarea" class="nombre-tarea"> 
            </div>-->
            <div class="campo enviar">
                <input type="hidden" id="id_proyecto" value="id_proyecto">
                <input type="submit" class="boton nueva-tarea" value="Administración">
                <input type="submit" class="boton nueva-tarea" value="Desarrollo"><!-- agregado 02/03/2020-->
                <input type="submit" class="boton nueva-tarea" value="Gestión de configuración"><!--agregado 02/03/2020 -->
            </div>
        </form>
        
 

        <!--<h2>Listado de tareas:</h2>

        <div class="listado-pendientes">
            <ul>

                <li id="tarea:<?php echo $tarea['id'] ?>" class="tarea">
                <p>Cambiar el Logotipo</p>
                    <div class="acciones">
                        <i class="far fa-check-circle"></i>
                        <i class="fas fa-trash"></i>
                    </div>
                </li>  
            </ul>
        </div>-->
    </main>
</div><!--.contenedor-->


<?php
    include 'inc/templates/footer.php';
?>

