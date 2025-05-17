// Isso aqui vai mudar? tô pensando ainda, tá muito igual Katana Zero, me sinto um ladrão

draw_self();

var feixe = 6; // Tamanho de cada feixe
var espacamento = 4; // Distância entre cada feixe
var y0 = y + sprite_height + 2; // Começa nessa posição

for (var dist = 0; dist < distancia; dist += feixe + espacamento) { // Desenha todos eles até encontrar o chão
	
    draw_set_color(c_red); 
    draw_line(x, y0 + dist, x, y0 + dist + feixe);
}