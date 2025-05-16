draw_self();

var feixe = 6;
var espacamento = 4;
var y0 = y + sprite_height + 2;

for (var dist = 0; dist < distancia; dist += feixe + espacamento) {
	
    draw_set_color(c_red);
    draw_line(x, y0 + dist, x, y0 + dist + feixe);
}

/*
var dist = 0;

while (dist < distancia) {
	
	draw_set_color(c_red);
	draw_line(x,y + sprite_height + 2 + dist,x, y + sprite_height + 6 + dist);
	
	dist += distancia / 4;
}