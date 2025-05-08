image_angle = rotacao; // Muda o ângulo

rotacao += 7; // Aumenta a rotacao 

if(rotacao > 360) rotacao = 0; // Volta pra 0 sempre que passar 360

if(place_meeting(x,y,o_player)) global.morreu = true; // Player tocou na serra = morte

if(estatico) exit // Se ela não for se mover, não executa o que está abaixo

frame += 1; // Aumenta um step

if (frame >= tempo_total) { // Se acabou o movimento, faz a volta do caminho
	
    frame = 0;
    sentido *= -1;
}
 
var dist = frame / tempo_total; // Fração da distância percorrida (0 a 1)

if (horizontal) { // Movimento interpolado com base na direção
	
	if (sentido == 1) {
			
		// Faz a movimentação levando em consideração se a serra começou da direita pra esquerda (true) ou da esquerda pra direita (false)
	    x = esquerda ? x_inicial - (movimento * dist) : x_inicial + (movimento * dist);
	} else {
		
		// Faz a volta do caminho levando em consideração se a serra começou da direita pra esquerda (true) ou da esquerda pra direita (false)
	    x = esquerda ? x_inicial - (movimento * (1 - dist)) : x_inicial + (movimento * (1 - dist));
	}
		
} else {
	
	if (sentido == 1) {
		
		// Faz a movimentação levando em consideração se a serra começou de baixo pra cima (true) ou de cima pra baixo (false)
	    y = cima ? y_inicial - (movimento * dist) : y_inicial + (movimento * dist);
	} else {
		
		// Faz a volta do caminho levando em consideração se a serra começou de baixo pra cima (true) ou de cima pra baixo (false)
		y = cima ? y_inicial - (movimento * (1 - dist)) : y_inicial + (movimento * (1 - dist));
	}
}
