// Pega a distância pro chão automáticamente daqui

distancia = 0;
var max_dist = 1000;

while(distancia <= max_dist) {
	
	var alvo = collision_point(x,y + sprite_height + distancia,o_wall,false,false); // Checa se chegou no chão
	
	if(alvo != noone) break; // Quando achar, quebra o loop
	
	distancia ++; // Incrementa a distãncia de 1 em 1 pra garantir uma distãncia precisa
}

// até aqui, código lindo esse

inst = instance_create_layer(x,y + sprite_height,"Obstacles",o_crushing); // Cria a instância da parte "esmagadora" do pistão e a armazena em uma variável

inst.image_xscale = image_xscale; // Define a imagem xscale da instância como a mesma do "contâiner" do pistão

y_final = y + sprite_height + distancia; // Armazena a posição y final

t_descendo = global.timer_obstacles / t_descendo; // Tempo que vai levar para o pistão descer até a distância máxima;

t_subindo = global.timer_obstacles * t_subindo; // Tempo em que ele vai subir (mais lento) 

descendo = true; // Define que ele começa descendo 

tempo_total = t_descendo; // Como ele começa descendo, define o tempo_total inicial coorespondente

frame = 0; // Contador de steps

pode_tremer = false; // Booleano pra verificar se o objeto tá na tela
tela_tremeu = false; // Apenas definir se a tela tá tremendo ou não