<?php
    include 'inc/funciones/funciones.php';
    //include 'inc/funciones/conexion.php';//para abrir la conexion a la base de datos
    include 'inc/templates/header.php';
?>

    <div class="contenedor-formulario">
        <h1>ABM Usuario<span></span>s</h1>
        <form id="formulario" class=" caja-login" method="post">
            <div class="campo">
                <label for="usuario">Usuario: </label>
                <input type="text" name="usuario" id="usuario" placeholder="Usuario">
            </div>
            <div class="campo">
                <label for="password">Password: </label>
                <input type="password" name="password" id="password" placeholder="Password">
            </div>
            <div class="campo">
                <label for="nombre">Nombre: </label>
                <input type="text" name="nombre" id="nombre" placeholder="Nombre">
            </div>
            <div class="campo">
                <label for="apellido">Apellido: </label>
                <input type="text" name="apellido" id="apellido" placeholder="Apellido">
            </div>
            <div class="campo">
                <label for="correo_electronico">Correo Electrónico: </label>
                <input type="text" name="correo_electronico" id="correo_electronico" placeholder="Correo Electrónico">
            </div>
            <div class="campo">
                <label for="descripcion">Descripción: </label>
                <input type="text" name="descripcion" id="descripcion" placeholder="Descripción">
            </div>
            <div class="campo">
                <label for="telefono">Teléfono: </label>
                <input type="text" name="telefono" id="telefono" placeholder="Teléfono">
            </div>
            <div class="campo enviar">
                <input type="hidden" id="tipo" value="crear">
                <input type="submit" class="boton" value="Guardar">
            </div>
<!--            <div class="campo">
                <a href="login.php">Inicia Sesión Aquí</a>
            </div> -->
        </form>
    </div>
    <script src="js/sweetalert2.all.min.js"></script>

<?php
    include 'inc/templates/footer.php';
?>
