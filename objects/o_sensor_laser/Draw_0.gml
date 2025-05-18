// Isso aqui vai mudar? tô pensando ainda, tá muito igual Katana Zero, me sinto um ladrão

draw_self();
draw_set_color(c_red);

var feixe = 6; // Tamanho de cada feixe
var espacamento = 4; // Distância entre cada feixe
var y0 = y; // Começa nessa posição
	
if(variacao > 5) draw_line(x,y0,x,y0 + variacao - 5);

for (var dist = 0 + variacao; dist < distancia; dist += feixe + espacamento) { // Desenha todos eles até encontrar o chão

	draw_line(x, y0 + dist, x, y0 + dist + feixe);
}

variacao += .5;

if(variacao > 10) variacao = 0;


draw_set_color(c_white);