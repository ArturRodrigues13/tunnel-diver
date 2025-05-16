var alvo = collision_line(x,y,x,y + distancia,o_player,false,false)

if(alvo != noone) {
	
	with(alvo) {
		
		if(dash_duration <= 0) global.morreu = true;
	}
}