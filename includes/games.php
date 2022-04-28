<?php

$games = [
	["id" => 1, "nome" => "Dota 2", "link" => "https://mrreiha.keybase.pub/codepen/hover-fx/1.jpg", "link2" => "", "titulo_novidade" => "", "novidade" => ""]
	,["id" => 2, "nome" => "Stick Fight", "link" => "https://mrreiha.keybase.pub/codepen/hover-fx/2.jpg", "link2" => "", "titulo_novidade" => "", "novidade" => ""]
	,["id" => 3, "nome" => "Minion Masters", "link" => "https://mrreiha.keybase.pub/codepen/hover-fx/3.jpg", "link2" => "", "titulo_novidade" => "", "novidade" => ""]
	,["id" => 4, "nome" => "KoseBoz!", "link" => "https://mrreiha.keybase.pub/codepen/hover-fx/4.jpg", "link2" => "", "titulo_novidade" => "", "novidade" => ""]
	,["id" => 5, "nome" => "", "link" => "", "link2" => "https://mrreiha.keybase.pub/codepen/hover-fx/news1.jpg", "titulo_novidade" => "New Item", "novidade" => "In today’s update, two heads are better than one, and three heads are better than that, as the all-new Flockheart’s Gamble Arcana item for Ogre Magi makes its grand debut."]	
	,["id" => 6, "nome" => "", "link" => "", "link2" => "https://mrreiha.keybase.pub/codepen/hover-fx/news2.png", "titulo_novidade" => "Update", "novidade" => "Just in time for Lunar New Year and the Rat’s time in the cyclical place of honor, the Treasure of Unbound Majesty is now available."]	
];

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
	global $games;
	$html = "";
	$qtd = 0;
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
	global $games;
	$html = "";
	foreach($games as $game) {
		if ($game['link2'] != "") {
			$html .= whatsnew_game($game['link2'], $game['titulo_novidade'], $game["novidade"]);
		}
	}
	return $html;
	
}


?>