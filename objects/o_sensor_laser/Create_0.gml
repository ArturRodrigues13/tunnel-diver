// Pega a distância pro chão automáticamente daqui

distancia = 0;
var max_dist = 1000;

while(distancia <= max_dist) {
	
	var alvo = collision_point(x,y + sprite_height +distancia,o_wall,false,false);
	
	if(alvo != noone) break;
	
	distancia ++;
}

// até aqui