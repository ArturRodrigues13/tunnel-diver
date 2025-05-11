if(instance_exists(o_player)) {
	if(bbox_bottom >= o_player.bbox_bottom) {
	
		sprite_index = spr_wall_oneway;
	} else {

		sprite_index = -1;	
	}
	
	with(o_player) {
		
		if(keyboard_check_pressed(ord("S"))) {
			
			other.sprite_index = -1;
		}
	}
}
