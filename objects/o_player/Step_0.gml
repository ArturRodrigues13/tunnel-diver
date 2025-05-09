if(keyboard_check_pressed(ord("R"))) room_restart(); // Teste hahaha

var _left, _right, _jump, _jump_segurar, _intangible, _dir; // Variáveis de movimento e controle

_left = keyboard_check(ord("A")); // Mover pra esquerda
_right = keyboard_check(ord("D")); // Mover pra direita
_jump = keyboard_check_pressed(vk_space); // Pular
_jump_segurar = keyboard_check(vk_space); // Verifica se o usuário está segurando o botão de pulo
_intangible = keyboard_check(ord("J")); // Ativar intangibilidade
_dir = (_right - _left); // Determina a direção que o player está andando

if(velv < 0) pulando = true else pulando = false; // Se a velv é menor que 0, o player pulou

if (recharging || intangible_touch || poderes[1] == 0) _intangible = false; // Controle do poder de intangibilidade

dash_duration = max(dash_duration - 1,0) // Diminui a duração do dash em 1 por step

//------------------------------------------------------------------------------------//

if(dash_duration > 0) { // Se está usando o dash
	
	velv = 0; // Não tem gravidade aplicada
} else {
	
	velv = velv + grav; // Aplica gravidade no player
	velv = clamp(velv,-velv_max,velv_max); // Limita a velocidade vertical
}

if(dash && dash_duration == 0) { // Se usou o dash 
	
	dash_duration = 10;
	velh = _dir * dash_vel; // Faz o dash;
	dash = false; // Não permite usar novamente logo em sequência
	
} else if (dash_duration == 0) { // Se não está usando o dash
	
	velh = velh + acc * _dir // Movimento horizontal do player
	velh = clamp(velh,-vel,vel); // Limita a velocidade horizontal

	if(_dir == 0) {
	
		estado = "parado";
		velh = lerp(velh,0,dcc); // Desacerela o player se ele não está andando
	
	} else {
	
		estado = "anda";
	}
}

if(velh != 0){ // Inverte o xscale baseado na direção que estamos andando
	
	image_xscale = sign(velh);
} 

if(place_meeting(x+velh,y,o_wall)){
	
	while(!place_meeting(x+sign(velh),y,o_wall)) x = x +sign(velh); // Aproxima o player lentamente da parede, gerando a colisão perfeita
	
	velh = 0; // Para o player ao chegar numa parede horizontalmente
}

if(!_intangible) { // Checagem específica para paredes atravessáveis
	
	if(place_meeting(x+velh,y,o_traversable)){
	
		while(!place_meeting(x+sign(velh),y,o_traversable)) x = x +sign(velh); 
	
		velh = 0; 
	} 
}

x = x + velh; // Faz a movimentação regular do player horizontalmente

if(place_meeting(x,y+velv,o_wall)) {
	
	while(!place_meeting(x,y+sign(velv),o_wall)) y = y + sign(velv); // Aproxima o player lentamente da parede, gerando a colisão perfeita
	
	velv = 0; // Para o player ao chegar numa parede verticalmente
}

if(!_intangible) { // Checagem específica para paredes atravessáveis
	
	if(place_meeting(x,y+velv,o_traversable)) {
	
		while(!place_meeting(x,y+sign(velv),o_traversable)) y = y + sign(velv); // Aproxima o player lentamente da parede, gerando a colisão perfeita
	
		velv = 0;
	}
}

y = y + velv; // Faz a movimentação regular do player verticalmente

//------------------------------------------------------------------------------------//

if(place_meeting(x,y+1,o_wall) || place_meeting(x,y+1,o_traversable)) { // Player está no chão
	
	if(!_intangible) chao = true;
	if(!_intangible) pulo_duplo = true; // Pulo duplo liberado
	deslizar = 0; 
	tempo = 0;
	with (o_wall) usada = false; // Reseta o pulo em todas as paredes
	
	
} else { // Player está fora do chão
	
	tempo++;
	
	if(tempo >= tempo_maximo) { // Player passou muito tempo fora do chão
		
		tempo = 0;
		chao = false;
	}
}

if (chao = false) estado = "pula";

if((place_meeting(x-1,y,o_wall) || place_meeting(x+1,y,o_wall)) && chao == false) { // Player está em uma parede horizontalmente e fora do chão

	tempo_parede = 0;
	pular_parede = true;
	deslizar ++; 
	parede = true; // Avisa ao jogo que o player está em uma parede
	var _esquerda = instance_place(x-1,y,o_wall); // Verifica se há uma parede na esquerda
	var _direita = instance_place(x+1,y,o_wall); // Verifica se há uma parede na direita
	
    if (_esquerda != noone && _esquerda != parede_proxima) { // Detectou uma parede nova
		
		with (o_wall) usada = false; // Reseta o pulo em todas as paredes
        parede_proxima = _esquerda; // Armazena essa instância
		
    } else if (_direita != noone && _direita != parede_proxima) { // Detectou uma parede nova
		
		with (o_wall) usada = false; // Reseta o pulo em todas as paredes
		parede_proxima = _direita; // Armazena essa instância
	}
	
} else { // Player está fora da parede
	
	tempo_parede ++;
	parede = false;
	deslizar = 0;
	
	if(tempo_parede >= tempo_parede_maximo) { // Player passou muito tempo fora de uma parede

		pular_parede = false;
		tempo_parede = 0;
	}
}

if(poderes[0] == 1) if(parede) if(!pulando) velv = grav + (deslizar / 30) // Aumenta lentamente a velocidade que o player desliza na parede

if(!_jump_segurar && velv < 0) velv = max(velv,-altura_pulo/2); // Se o usuário não segurou o botão de pular, limita a altura pela metade

if(_jump){
	
	if(chao){ // Pulo no chão
		
		velv = velv - altura_pulo; // Faz o pulo se o player estiver no chão
		chao = false;
		
	} else if(!pular_parede) { // Pulo fora da parede e fora do chão

		if(poderes[0] == 0) pulo_duplo = false;
		
		if(pulo_duplo == true) { // Se não usou ainda, pulo duplo liberado
			
			velv = 0 - altura_pulo_duplo;
			pulo_duplo = false;
		}
	} else { // Pulo em uma parede e fora do chão
		
		if(parede_proxima != noone) if(poderes[0] == 0) parede_proxima.usada = true;
		
		if(parede_proxima != noone) if(parede_proxima.usada == false) { // Se ainda não usou ela
			
			velv = 0 - altura_pulo; // Faz o pulo
			parede_proxima.usada = true; // Determina a variável dessa instância específica para true
		}
		
	}
}

//------------------------------------------------------------------------------------//

if(place_meeting(x,y,o_finish)) { // Player chegou no final do nível 
	
	room_goto_next();
}

//------------------------------------------------------------------------------------//

if(keyboard_check_released(ord("J"))) intangible_touch = false; // Se soltou o botão, o poder pode ser usado novamente

if(_intangible) { // Está usando o poder
	
	if(place_meeting(x,y,o_traversable)) atravessando = true; // Se está dentro de uma parede, tá atravessando ela
	tempo_atravessado = 0;
	intangible_time--; // Gasta o poder
	
	if(intangible_time <= 0) { // Gastou o máximo do poder
		
		recharging = true; // Entra em modo de recarga
		intangible_touch = true; // Está segurando o botão
	}
} else {
	
	intangible_time++; // Recarrega o poder
	
	tempo_atravessado ++; // Aumenta o tempo ao sair de uma parede
	
	if(tempo_atravessado >= tempo_atravessado_maximo) { // Ao passar o tempo máximo, desliga a janela de dash
		
		atravessando = false;
		tempo_atravessado = 0;
	}
}

intangible_time = clamp(intangible_time,0,90); // Limita o tempo do poder

if(recharging) { // Está recarregando
	
	recharge_time--; // Diminui o tempo de recarga
	
	if(recharge_time <= 0) recharging = false; // Se acabou o tempo, não tá mais recarregando
	
} else {
	
	recharge_time++; // Volta a aumentar o tempo de recarga
}

recharge_time = clamp(recharge_time,0,60); // Limita o tempo de recarga

//------------------------------------------------------------------------------------//

if(!_intangible) && place_meeting(x,y,o_traversable) { // Não está intangível mas não saiu do bloco atravessável
	
	var _max_dist = 8; // Taxa de flexibilidade máxima, pra caso o player não esteja tanto pra dentro da parede
    var _escapou = false; // Váriavel de controle
	var _dist = 1;

    for (_dist = 1; _dist <= _max_dist; _dist++) { // Itera nas quatro direções
		
        // Testar direita, esquerda, baixo e cima
        if (!place_meeting(x + _dist, y, o_traversable)) { // Direita
            x += _dist;
            _escapou = true;
            break;
        }
        if (!place_meeting(x - _dist, y, o_traversable)) { // Esquerda
            x -= _dist;
            _escapou = true;
            break;
        }
        if (!place_meeting(x, y + _dist, o_traversable)) { // Baixo
            y += _dist;
            _escapou = true;
            break;
        }
        if (!place_meeting(x, y - _dist, o_traversable)) { // Cima
            y -= _dist;
            _escapou = true;
            break;
        }
    }

    if (!_escapou) { // Se o player ficou preso na parede, mata ele
        room_restart();
    }

}

//------------------------------------------------------------------------------------//

if(atravessando) { // Se está atravessando uma parede

	chao = false;
	pulo_duplo = false;
	
	if(!place_meeting(x,y,o_traversable)) { // Se saiu da parede mas continua com a janela de dash aberta
		
		if(keyboard_check_pressed(ord("K"))) {
			
			dash = true; // Usou o dash
			atravessando = false; // Não permite outro uso
		}
	}
}

//-------------------------------------------------------------------------------------//

if(y > room_height * 1.5) global.morreu = true; // Se o player caiu pro abismo, F

if(global.morreu) { // Fazer algo específico se o player morrer, no momento só reinicio a room
	
	global.morreu = false;
	room_restart();
}

//-------------------------------------------------------------------------------------//

switch estado { // State machine ultra simples que se pá vai mudar (no momento só tô usando sprites de teste)
	
	case "parado":
		sprite_index = spr_player_idle;
		break;
	case "anda":
		sprite_index = spr_player_run;
		break;
	case "pula":
		sprite_index = spr_player_jump;
		break;
}