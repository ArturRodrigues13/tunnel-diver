frame += 1; // Aumenta um step

if (frame >= tempo_total) { // Se acabou o movimento, faz a volta do caminho
	
    frame = 0;
    ligado = !ligado;
}

var alvo = noone;

if(ligado) {
	
	switch(direcao) {
		
		// Direita
		case 0:
	
			alvo = collision_rectangle(x,y,x + distancia,y + sprite_height,o_player,false,false);
	
			if(alvo != noone) {
		
				if(!alvo.esquerda) alvo.velh += forca else alvo.velh /= forca; 
			}
			break;
			
		// Esquerda
		case 1:
			
			
			alvo = collision_rectangle(x - distancia,y,x,y - sprite_height,o_player,false,false);
	
			if(alvo != noone) {
				
				if(!alvo.direita) alvo.velh -= forca else alvo.velh /= forca; 
			}
			break;
			
		// Baixo
		case 2:
			
			alvo = collision_rectangle(x - sprite_height,y,x,y + distancia,o_player,false,false);
	
			if(alvo != noone) {
				
				alvo.velv += forca;
				alvo.velh /= forca;
			}
			break;
			
		// Cima
		case 3: 
		
			alvo = collision_rectangle(x,y - distancia,x + sprite_height,y,o_player,false,false);
	
			if(alvo != noone) {
				
				alvo.velv -= forca;	
			}
			break;
	}
}