tempo_miliseg -= 1; // -1 "milissegundo"

if(tempo_miliseg = -1) { // Passou um segundo

	tempo_miliseg = 9;
	tempo_seg -= 1;
}

if(tempo_seg = -1) { // Passou um minuto
	
	tempo_seg = 59;
	tempo_min -= 1;
}

if !(tempo_min == 0 && tempo_seg == 0 && tempo_miliseg == 0) { // Se o tempo não acabou ainda, pode reiniciar o alarme
	
	if(instance_exists(o_player)) alarm[0] = 6;
} else {
	
	global.morreu = true; // Caso o contrário, reinicia a room
}