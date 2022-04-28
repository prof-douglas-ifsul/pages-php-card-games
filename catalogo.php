<?php
require_once("includes/banco.php");
require_once("includes/config.php");
require_once("includes/games.php");

$template = file_get_contents(TPL_CATALOGO);

$catalogo = catalogo_cards_games();
$template = str_replace("<!--catalogo_cards_games-->", $catalogo["html"], $template);
$template = str_replace("<!--quantidade_cards_games-->", $catalogo["quantidade"], $template);

$novidades = lista_whatsnew_game();
$template = str_replace("<!--lista_whatsnew_games-->", $novidades, $template);

echo $template;
?>

