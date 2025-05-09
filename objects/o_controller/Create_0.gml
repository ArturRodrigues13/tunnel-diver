tempo_min = minutos; // Tempo limite da fase na casa dos minutos 
tempo_seg = segundos; // Tempo limite da fase na casa dos segundos 
tempo_miliseg = 0; // Armazenar os "milissegundos"

alarm[0] = 6 // A cada 6 frames fazer uma contagem de tempo

segurando = 0; // Determina o quanto a tecla de intangibilidade está sendo segurada

sala_atual = 0; // 0 = Sala padrão, se tiver mais de uma vai aumentando de 1 em 1;

direcao = ""; // Última direção que o player avançou
direcao_array = []; // Armazenar todos os movimentos do player
