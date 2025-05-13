t_ligado *= global.timer_obstacles;
t_desligado *= global.timer_obstacles;
tempo_total = t_desligado;
frame = 0; // Contador de steps
ligado = false; // Verifica se tá ligado ou desligado

switch (image_angle) {
	
	case 0:
		
		x_1 = x;
		y_1 = y - 2;
		x_2 = x + sprite_width;
		y_2 = y;
		break;
	
	case 90:
		
		x_1 = x - 2;
		y_1 = y - sprite_width;
		x_2 = x;
		y_2 = y - 1;
		break;
		
	case 180:
		
		x_1 = x - sprite_width;
		y_1 = y;
		x_2 = x - 1;
		y_2 = y + 2;
		break;
	
	case 270:
		
		x_1 = x;
		y_1 = y;
		x_2 = x + 2;
		y_2 = y + sprite_width - 1;
		break;
		
	default:
	
		x_1 = 0;
		y_1 = 0;
		x_2 = 0;
		y_2 = 0;
		break;
}