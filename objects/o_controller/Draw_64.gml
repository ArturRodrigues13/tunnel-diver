draw_set_font(fnt_HUD);

var _x = display_get_gui_width() / 2; // Metade da tela horizontal
var _y = 30;
var _yy = display_get_gui_height() / 2; // Metade da tela vertical

if(instance_exists(o_player)) {
	
	if(o_player.poderes[1] == 1) { // Se o player tem o poder desbloqueado, desenha a barra
	
		var bar_width = 200;
		var bar_height = 30;
		var bar_x = 125 - bar_width / 2;
		var bar_y = 15;

	
		var progress = segurando / 90; // Calcula a largura da barra de progresso com base no tempo de habilidade do player
		var current_bar_width = bar_width * progress;

		draw_set_color(c_gray);
		draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false); // Desenha a barra de fundo (barra completa)

		draw_set_color(c_red);
		draw_rectangle(bar_x, bar_y, bar_x + current_bar_width, bar_y + bar_height, false); // Desenha a barra de progresso (barra atual)

		draw_set_color(c_maroon);
		draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, true); // Desenha o contorno da barra
	}
}

draw_set_color(c_black);

var _t = ""; // Armazenar o tempo

if(tempo_min > 0) { // Se não tem minutos a serem contabilizados, não o coloca na String
	
	_t += string(tempo_min);
	_t += ".";
}

if(tempo_seg > 9) _t += "" + string(tempo_seg);
if(tempo_seg < 10) _t += "0" + string(tempo_seg); // Coloca um 0 pra ficar "09" pra 9 segundos
_t += ".";
_t += string(tempo_miliseg);

draw_sprite_ext(spr_HUD,0,_x,_y,4,2,0,c_white,1);

// Pegue as dimensões do texto
var largura_texto = string_width(_t);
var altura_texto = string_height(_t);

// Calcule a posição central do objeto
var centro_x = _x;
var centro_y = _y;

// Desenhe o texto ajustando-o para o centro
draw_text((centro_x - largura_texto / 2),(centro_y - altura_texto / 1.5) + 3, _t); // Tem uns números mágicos aí no meio porque essa fonte é meio bizarra, trocar futuramente

if(morreu) {
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_transformed(_x,_yy,"BINGA BONGA",3,3,0);
	draw_text(_x,_yy + 100,"Pressione [R] Para Reiniciar");
}

draw_set_halign(-1);
draw_set_valign(-1);

draw_set_font(-1); // Volta a fonte padrão
draw_set_color(c_white); // Volta a cor padrão