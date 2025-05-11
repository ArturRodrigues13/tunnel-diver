//------------------------------------------------------------------------------------//

vel = 4; // Velocidade
velv = 0; // Velocidade vertical
velh = 0; // Velocidade horizontal
velv_max = 10; // Velocidade vertical máxima
acc = .6; // Acerelação 
dcc = .6; // Desacerelação
grav = 0.4; // Força da gravidade

altura_pulo = 7; // Autura do pulo 
altura_pulo_duplo = 5; // Altura do pulo duplo
pulo_duplo = true; // Determina se o player pode usar o pulo duplo
chao = false; // Determina se o player está no chão ou não
tempo = 0; // Quantidade de tempo que o player passou sem tocar o chão
tempo_maximo = 10; // Tempo máximo permitido antes de considerar que o player está fora do chão

parede = false; // Determina se o player está na parede ou não
pular_parede = true; // Determina se o player pode pular em uma parede ou não
pulando = false; // Verifica se o player está pulando ou não
tempo_parede = 0; // Quantidade de tempo que o player passou fora de uma parede após tocar em uma
tempo_parede_maximo = 6; // Tempo máximo permitido antes de considerar que o player está fora de uma parede
deslizar = 0; // Aumentar velocidade que o player desliza na parede
parede_proxima = noone; // Variável para armazenar a instância de parede que o player está tocando

//------------------------------------------------------------------------------------//

estado = "parado"; // Variável que armazena os estados do player

//------------------------------------------------------------------------------------//

intangible_touch = false; // Verifica se o usuário apertou o botão para ficar intangível
intangible_time = 90; // Tempo máximo que o player pode ficar intangível
recharging = false; // Determina se o player está recarregando a habilidade de intangibilidade
recharge_time = 60; // Tempo mínimo que o player precisa esperar antes de poder usar o poder novamente

atravessando = false; // Verifica se o player está atravassando uma parede
tempo_atravessado = 0; // Quantidade de tempo que o player passou fora de uma parede após atravessar uma
tempo_atravessado_maximo = 7; // Tempo máximo permitido antes de considerar que o player não pode mais usar o dash (provavelmente irá mudar)
tunelamento_proximo = noone;
dash_stack = 0;
dash = false; // Verifica se o player usou o dash ou não
dash_vel = 7; // Velocidade do dash
dash_duration = 0; // Duração do dash

//------------------------------------------------------------------------------------//

poderes = global.player_poderes; // Isso aqui vai mudar

//------------------------------------------------------------------------------------//

chaves = 0;