<?php

function usuario_autenticado()//verificar que los usuarios esten autenticados, en caso que no este se direcciona al login
{
    if(!revisar_usuario()){
        header('Location:login.php');
        exit();
    }
}    
function revisar_usuario(){//revisa las sesiones iniciadas
    return isset($_SESSION['nombre']);
}
session_start();
usuario_autenticado();
