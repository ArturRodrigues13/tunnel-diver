frame ++; // Aumenta um step

if(frame >= tempo_total) { // Se acabou o movimento, começa a subir (ou descer)
	
	frame = 0;
	descendo = !descendo; // Desce e sobe 
	if(descendo) tempo_total = t_descendo else tempo_total = t_subindo; // Define o tempo coorespondente
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