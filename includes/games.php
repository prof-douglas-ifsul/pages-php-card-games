<?php

function db_select_games() {
	// referencia de get_result do comentario em 
	// https://www.php.net/manual/pt_BR/mysqli.prepare.php#107568

	global $mysqli;
	$sql = "select * from games where link <> './'";
	$stmt = $mysqli->prepare($sql);
	$stmt->execute();
	$result = $stmt->get_result();
	$registros = $result->fetch_all(MYSQLI_ASSOC);
	return $registros;
	
}

function db_select_games_novidades() {
	// referencia de get_result do comentario em 
	// https://www.php.net/manual/pt_BR/mysqli.prepare.php#107568

	global $mysqli;
	$sql = "select * from games_novidades";
	$stmt = $mysqli->prepare($sql);
	$stmt->execute();
	$result = $stmt->get_result();
	$registros = $result->fetch_all(MYSQLI_ASSOC);
	return $registros;
	
}


function card_game($nome, $link) {
	$html = "
		<figure class=\"card\">
			<img src=\"".$link."\" />
			<figcaption>$nome</figcaption>
		</figure>
	";
	return $html;
}

function catalogo_cards_games() {
	$html = "";
	$qtd = 0;
	$games = db_select_games();
	foreach($games as $game) {
		if ($game['nome'] != "") {
			$html .= card_game($game['nome'], $game['link']);
			$qtd ++;
		}
	}
	return array("quantidade" => $qtd, "html" => $html);
	
}

function whatsnew_game($link2, $titulo, $info) {
	$html = "
		<figure class=\"article\">
			<img src=\"$link2\" />
			<figcaption>
				<h3>$titulo</h3>
				<p>$info</p>
			</figcaption>
		</figure>
	";
	return $html;
}

function lista_whatsnew_game() {
	$html = "";
	$games = db_select_games_novidades();
	foreach($games as $game) {
		if ($game['link'] != "") {
			$html .= whatsnew_game($game['link'], $game['titulo'], $game["descricao"]);
		}
	}
	return $html;
	
}

?>