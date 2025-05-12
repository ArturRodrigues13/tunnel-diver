frame += 1; // Aumenta um step

if (frame >= tempo_total) { // Se acabou o movimento, faz a volta do caminho
	
    frame = 0;
    ligado = !ligado;
}

var alvo = noone;

var forca = empurrao;

if(ligado) {
	
	switch(direcao) {
		
		// Direita
		case 0:
	
			alvo = collision_rectangle(x,y,x + distancia,y + sprite_height,o_player,false,false);
	
			if(alvo != noone) {
				
				with(alvo) {
					
					if(place_meeting(x+forca,y,o_wall_collision)){
	
						while(!place_meeting(x+sign(forca),y,o_wall_collision)) x = x +sign(forca); // Aproxima o player lentamente da parede, gerando a colisão perfeita
	
						forca = 0; // Para o player ao chegar numa parede horizontalmente
					}
				x += forca;	
				}	
			}
			break;
			
		// Esquerda
		case 1:
			
			
			alvo = collision_rectangle(x - distancia,y,x,y - sprite_height,o_player,false,false);
	
			if(alvo != noone) {
				
				with(alvo) {
					
					if(place_meeting(x-forca,y,o_wall_collision)){
	
						while(!place_meeting(x-sign(forca),y,o_wall_collision)) x = x -sign(forca); // Aproxima o player lentamente da parede, gerando a colisão perfeita
	
						forca = 0; // Para o player ao chegar numa parede horizontalmente
					}
				x -= forca;	
				}
			}
			break;
			
		// Baixo
		case 2:
			
			alvo = collision_rectangle(x - sprite_height,y,x,y + distancia,o_player,false,false);
	
			if(alvo != noone) {
				
				with(alvo) {
					
					if(place_meeting(x,y+forca,o_wall_collision)) {
	
						while(!place_meeting(x,y+sign(forca),o_wall_collision)) y = y + sign(forca); // Aproxima o player lentamente da parede, gerando a colisão perfeita
	
						forca = 0; // Para o player ao chegar numa parede verticalmente
					}
					
					y += forca;
					velh = lerp(velh,0,.5)
				}
			}
			break;
			
		// Cima
		case 3: 
		
			alvo = collision_rectangle(x,y - distancia,x + sprite_height,y,o_player,false,false);
	
			if(alvo != noone) {
				
				with(alvo) {
					
					if(place_meeting(x,y-forca,o_wall_collision)) {
	
						while(!place_meeting(x,y-sign(forca),o_wall_collision)) y = y - sign(forca); // Aproxima o player lentamente da parede, gerando a colisão perfeita
	
						forca = 0; // Para o player ao chegar numa parede verticalmente
					}
					
					velv = 0;
					y -= forca;
				}
			}
			break;
	}
}