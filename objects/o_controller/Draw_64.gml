var bar_width = 200;
var bar_height = 30;
var bar_x = display_get_width() / 2 - bar_width / 2;
var bar_y = 40;

// Calcula a largura da barra de progresso com base no tempo de pressionamento da tecla
var progress = segurando / 90
var current_bar_width = bar_width * progress;

// Desenha a barra de fundo (barra completa)
draw_set_color(c_gray);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Desenha a barra de progresso (barra atual)
draw_set_color(c_red);
draw_rectangle(bar_x, bar_y, bar_x + current_bar_width, bar_y + bar_height, false);

// Opcional: Desenhar o contorno da barra
draw_set_color(c_maroon);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, true);

draw_set_color(c_white);

var _t = "";

_t += string(tempo_min);
_t += ".";
if(tempo_seg > 9) _t += "" + string(tempo_seg);
if(tempo_seg < 10) _t += "0" + string(tempo_seg);
_t += ".";
_t += string(tempo_miliseg);

draw_text(100,100,_t);



