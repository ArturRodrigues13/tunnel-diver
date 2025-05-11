if(item_atual <= 6) {
	
	global.player_poderes[item_atual] = 1; // Desbloqueia o poder do player
} else {
	
	other.chaves ++;	
}

instance_destroy();