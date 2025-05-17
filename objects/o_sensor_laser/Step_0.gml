
// Linha de colisão no centro do objeto
var alvo = collision_line(x,y,x,y + distancia,o_player,false,false);

if(alvo != noone) { // Achou o player
	
	with(alvo) { // Player
		
		if(dash_duration <= 0) global.morreu = true; // Se não tá usando o dash, F
	}
}