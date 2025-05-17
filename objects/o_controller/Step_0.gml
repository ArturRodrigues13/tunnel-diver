camera_set_view_pos(view_camera[0],x,y) // Faz a câmera seguir o objeto de controle (posição inicial = (0,0))

if(instance_exists(o_player)) {

	segurando = o_player.intangible_time; // Atualiza ela pra quantidade de poder que o player pode usar
} else {
	
	morreu = true; // Player sumiu da Room
	if(keyboard_check_pressed(ord("R"))) {
		
		room_restart();
	}
}

timer_shake = max(timer_shake -1,0); // Diminui o timer_shake em 1 por frame, não passando de 0

if(!instance_exists(o_player)) exit // Player morreu = isso é inútil

direcao = ""; // Apaga o valor todo frame

sala_atual = array_length(direcao_array) + 1; // Determina a sala atual do jogo, o +1 é pra ficar bonitinho mesmo, tipo "sala 1" (dá muito mais trabalho kk)

if((x + 640) < o_player.x) { // Saiu da câmera pela direita
	
	x += 640;
	x_atual = x;
	direcao = "direita";
}

if(o_player.x < x){ // Saiu da câmera pela esquerda
	
	x -= 640;
	x_atual = x;
	direcao = "esquerda";
}

if((y + 360) < o_player.y) { // Saiu da câmera por baixo
	
	y += 360;
	y_atual = y;
	direcao = "baixo";
}

if(o_player.y < y) { // Saiu da câmera por cima
	
	y -= 360;
	y_atual = y;
	direcao = "cima";
}

if(direcao != "") { // Se ele mudou de sala, coloca esse movimento no array

	direcao_array[sala_atual - 1] = direcao;
}

if(direcao != "" && sala_atual > 1) { // Se ele foi pra outra sala 
	
	if(direcao_array[sala_atual - 2] == "direita" && direcao == "esquerda") { // Verifica movimentos reversos, ou seja, entrou em uma sala pela direita e voltou
	
		array_delete(direcao_array,sala_atual - 2,2); // Deleta tanto a direção que acabamos de colocar como a anterior
	
	} else if (direcao_array[sala_atual - 2] == "esquerda" && direcao == "direita") { // Verifica movimentos reversos, ou seja, entrou em uma sala pela esquerda e voltou
	
		array_delete(direcao_array,sala_atual - 2,2); // Deleta tanto a direção que acabamos de colocar como a anterior
	
	} else if (direcao_array[sala_atual-2] == "cima" && direcao == "baixo") { // Verifica movimentos reversos, ou seja, entrou em uma sala por cima e voltou
	
		array_delete(direcao_array,sala_atual - 2,2); // Deleta tanto a direção que acabamos de colocar como a anterior
	
	} else if (direcao_array[sala_atual-2] == "baixo" && direcao == "cima") { // Verifica movimentos reversos, ou seja, entrou em uma sala por baixo e voltou
	
		array_delete(direcao_array,sala_atual- 2,2); // Deleta tanto a direção que acabamos de colocar como a anterior
	}
}

if(sala_atual > array_length(direcao_array) + 1) { // Se eu apaguei os elementos do array, quer dizer que voltei uma sala
	
	sala_atual --;
} 