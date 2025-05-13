frame += 1; // Aumenta um step

if (frame >= tempo_total) { // Se acabou o tempo, desliga/liga a turbina
	
    frame = 0;
    ligado = !ligado;
	if(ligado) tempo_total = t_ligado else tempo_total = t_desligado;
}

if(ligado) {
	
	image_blend = c_red;
	
	var _alvo = collision_rectangle(x_1,y_1,x_2,y_2,o_player,false,false); // Retângulo pra direita
 
	if(_alvo != noone) { // Achou o player
		
		global.morreu = true;
	}
} else {
	
	image_blend = c_white;
}