distancia = 0;
var max_dist = 1000;
var alvo = noone;

while(distancia <= max_dist) {
	
	switch (direcao) {
		
		case 0:
		
			alvo = collision_point(x + sprite_width + distancia,y,o_wall,false,false);
			break;
		case 1:

			alvo = collision_point(x - distancia,y,o_wall,false,false);
			break;
		case 2:
	
			alvo = collision_point(x,y + sprite_height + distancia,o_wall,false,false);
			break;
		case 3:
		
			alvo = collision_point(x,y - sprite_height  - distancia,o_wall,false,false);
			break;
	}
	
	if(alvo != noone) break;
	
	distancia ++;
}

t_ligado *= global.timer_obstacles;
t_desligado *= global.timer_obstacles;
tempo_total = t_ligado; // Quanto tempo ele vai ficar ligado, se aumentar a frequencia é mais tempo ligado (e desligado também né)
frame = 0; // Contador de steps
ligado = true; // Verifica se tá ligado ou desligado