if(instance_exists(o_player)) {
	if(bbox_bottom >= o_player.bbox_bottom) { // Se o player tá acima da plataforma
	
		sprite_index = spr_wall_oneway; // Dá o sprite pra ele e consequentemente a colisão
	} else {

		sprite_index = -1; // Tira o sprite e a colisão
	}
	
	with(o_player) {
		
		if(keyboard_check_pressed(ord("S"))) { // Se o usuário apertar "S", tira a colisão fazendo ele cair
			
			other.sprite_index = -1;
		}
	}
}
