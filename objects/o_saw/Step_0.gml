image_angle = rotacao; // Muda o ângulo

rotacao += 7; // Aumenta a rotacao 

if(rotacao > 360) rotacao = 0; // Volta pra 0 sempre que passar 360

if(place_meeting(x,y,o_player)) room_restart(); // Player tocou na serra = morte