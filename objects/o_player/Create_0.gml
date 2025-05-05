//------------------------------------------------------------------------------------//

vel = 7; // Velocidade
velv = 0; // Velocidade vertical
velh = 0; // Velocidade horizontal
velv_max = 10; // Velocidade vertical máxima
acc = .5; // Acerelação 
dcc = .5; // Desacerelação
grav = 0.4; // Força da gravidade

altura_pulo = 12; // Autura do pulo 
altura_pulo_duplo = 9; // Altura do pulo duplo
pulo_duplo = true; // Determina se o player pode usar o pulo duplo
chao = false; // Determina se o player está no chão ou não
tempo = 0; // Quantidade de tempo que o player passou sem tocar o chão
tempo_maximo = 7; // Tempo máximo permitido antes de considerar que o player está fora do chão

parede = false; // Determina se o player está na parede ou não
tempo_parede = 0; // Quantidade de tempo que o player passou fora de uma parede após tocar em uma
tempo_parede_maximo = 10; // Tempo máximo permitido antes de considerar que o player está fora de uma parede
parede_proxima = noone; // Variável para armazenar a instância de parede que o player está tocando

//------------------------------------------------------------------------------------//

estado = "parado"; // Variável que armazena os estados do player

//------------------------------------------------------------------------------------//

atravessando = false;
intangible_touch = false; // Verifica se o usuário apertou o botão para ficar intangível
intangible_time = 90; // Tempo máximo que o player pode ficar intangível
recharging = false; // Determina se o player está recarregando a habilidade de intangibilidade
recharge_time = 60; // Tempo mínimo que o player precisa esperar antes de poder usar o poder novamente
tempo_atravessado = 0;
tempo_atravessado_maximo = 10;
dash = false;
dash_vel = 15;
dash_duration = 0;

