if(instance_exists(o_player)) {

	segurando = o_player.intangible_time; // Atualiza ela pra quantidade de poder que o player pode usar
}

if(nivel_composto) { // Se o nivel tem mais de uma sala
	
	if(global.passou) { // se receber o sinal indicando que o player passou de sala
		
		switch string_char_at(direcoes,sala_atual) { // Pega o caractere na posição específica na string direções
													 // 1 = direita, 2 = esquerda, 3 = cima, 4 = baixo
			
			case "1":
				
				sala_atual ++; // Indica que estamos na próxima sala
				x += 640; // Avançar para a direita
				global.passou = false; // Desliga o sinal;
				break;
		}
	}
}

camera_set_view_pos(view_camera[0],x,y) // Faz a câmera seguir o objeto de controle (posição inicial = (0,0))

