<?php
//Obtiene la pagina atual que se ejecuta
function obtenerPaginaActual(){
    $archivo = basename($_SERVER['PHP_SELF']);
    $pagina = str_replace(".php","",$archivo);
    return $pagina;
}
