distancia = global.tamanho_blocos * blocos; // Determina até onde o pistão vai esmagar;

inst = instance_create_layer(x,y + sprite_height,"Obstacles",o_crushing); // Cria a instância da parte "esmagadora" do pistão e a armazena em uma variável

inst.image_xscale = image_xscale; // Define a imagem xscale da instância como a mesma do "contâiner" do pistão

y_final = y + sprite_height + distancia; // Armazena a posição y final

t_descendo = global.timer_obstacles / 3; // Tempo que vai levar para o pistão descer até a distância máxima;

t_subindo = global.timer_obstacles * 3; // Tempo em que ele vai subir (mais lento) 

descendo = true; // Define que ele começa descendo 

tempo_total = t_descendo; // Como ele começa descendo, define o tempo_total inicial coorespondente

frame = 0; // Contador de steps