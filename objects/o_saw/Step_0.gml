image_angle = rotacao; // Muda o ângulo

rotacao += 7; // Aumenta a rotacao 

if(rotacao > 360) rotacao = 0; // Volta pra 0 sempre que passar 360

if(place_meeting(x,y,o_player)) room_restart(); // Player tocou na serra = morte

if(estatico) exit
	
if(horizontal){
		
	if(indo && !esquerda) {
			
		if(id.x <=  x_inicial + movimento) {
			
			id.x += (vel * direcao_h);
		} else {
			
			indo = false;
		}
	} else if (indo && esquerda) {
			
		if(id.x >=  x_inicial - movimento) {
			
			id.x += (vel * direcao_h);
		} else {
			
			indo = false;
		}
	} else if (!indo && !esquerda) {
		
		id.x += (vel * -direcao_h);
			
		if(x_inicial >= id.x) {
			
			indo = true
		}
	} else {
			
		id.x += (vel * -direcao_h);
			
		if(id.x >= x_inicial) {
			
			indo = true
		}
	}
} else {
		
	if(indo && !cima) {
			
		if(id.y <=  y_inicial + movimento) {
			
			id.y += (vel * direcao_v);
		} else {
			
			indo = false;
		}
	} else if (indo && cima) {
			
		if(id.y >=  y_inicial - movimento) {
			
			id.y += (vel * direcao_v);
		} else {
			
			indo = false;
		}
	} else if (!indo && !cima) {
		
		id.y += (vel * -direcao_v);
			
		if(y_inicial >= id.y) {
			
			indo = true
		}
	} else {
			
		id.y += (vel * -direcao_v);
			
		if(id.y >= y_inicial) {
			
			indo = true
		}
	}
}
