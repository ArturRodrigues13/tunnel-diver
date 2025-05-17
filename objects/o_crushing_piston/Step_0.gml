var _x = o_controller.x_atual; // Pega o x atual do controlador (controla a câmera) 
var _y = o_controller.y_atual; // Pega o y atual do controlador (controla a câmera)

// Apenas verificando se o objeto tá na sala ou não, se tiver pode causar o screen_shake (ficou clean esse aqui)
if(x > 0 + _x && x < 640 + _x && y > 0 + _y && y < 360 + _y) pode_tremer = true else pode_tremer = false; 

if(tela_tremeu && pode_tremer) {
	
	with(o_controller) { // Faz as mudanças com a câmera
	
		if(timer_shake > 0) {
		
			// Bem fraquinho
			x += random_range(-1,1);
			y += random_range(-1,1);
		
		} else {
			
			 // Volta pra posição original uma vez que o screen shake acabou
			tela_tremeu = false;
			x = x_atual;
			y = y_atual;
		}
	}
}

frame ++; // Aumenta um step

if(frame >= tempo_total) { // Se acabou o movimento, começa a subir (ou descer)
	
	frame = 0;
	descendo = !descendo; // Desce e sobe 
	if(descendo) tempo_total = t_descendo 
	else {
		
		tempo_total = t_subindo; // Define o tempo coorespondente
		tela_tremeu = true // Bateu no chão = faz o screen shake (se estiver liberado)
		o_controller.timer_shake = 10; // Aumenta o timer lá no controlador
	}
}

var alvo = noone; // Player não detectado

var dist = frame / tempo_total; // Fração da distância percorrida (0 a 1)

var _x = x + sprite_width - 1; // Facilitar leitura
var _y = y + sprite_height + (distancia * dist); // Atualizada frame por frame para permitir a detecção de colisão e ajuste do sprite correto

if (descendo) { // Movimento interpolado com base na direção
	
	alvo = collision_rectangle(x,_y,_x,_y + 5,o_player,false,false); // Colisão na parte inferior do pistão
 
	if(alvo != noone) { // Achou o player
		
		global.morreu = true; // Morreu kk
	}
	
	inst.image_yscale = (distancia * dist); // Atualiza a image_yscale dinamicamente, facilita minha vida
		
} else {
	
	inst.image_yscale = distancia - (distancia * dist);  // Atualiza a image_yscale dinamicamente, facilita minha vida
}