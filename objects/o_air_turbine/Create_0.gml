tempo_total = global.timer_obstacles * frequencia; // Quanto tempo ele vai ficar ligado, se aumentar a frequencia é mais tempo ligado (e desligado também né)
frame = 0; // Contador de steps
ligado = true; // Verifica se tá ligado ou desligado
distancia = global.tamanho_blocos * blocos; // Distância que ele vai empurrar o player