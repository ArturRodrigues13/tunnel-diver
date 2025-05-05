tempo_miliseg -= 1;

if(tempo_miliseg = -1) {

	tempo_miliseg = 9;
	tempo_seg -= 1;
}

if(tempo_seg = -1) {
	
	tempo_seg = 59;
	tempo_min -= 1;
}

if !(tempo_min == 0 && tempo_seg == 0 && tempo_miliseg == 0) {
	
	alarm[0] = 6;
} else {
	
	room_restart();
}