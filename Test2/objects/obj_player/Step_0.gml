/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
pular = keyboard_check_pressed(ord("W"));


hveloc = (direita - esquerda) * veloc;

if direita {
	direc = 0;
	sprite_index = spr_player_andando_direita;

}else if esquerda {
	direc = 1;
	sprite_index = spr_player_andando_esquerda;

}else{
	if direc == 0 {
		sprite_index = spr_parado_direita;
}else if direc == 1 {
	sprite_index = spr_parado_esquerda;
}

}

if !place_meeting(x, y + 1, obj_parede){
	vveloc += gravidade;

}else {
	if pular {
		vveloc = -3.0;
	
	}

}

if place_meeting (x + hveloc, y, obj_parede){
	while !place_meeting(x + sign(hveloc), y, obj_parede){
		x += sign(hveloc);
	
	}
	hveloc = 0;

}

x += hveloc;

if place_meeting(x, y + vveloc, obj_parede){
	while !place_meeting(x, y + sign(vveloc), obj_parede){
		y += sign(vveloc);
	}
	vveloc = 0;

}
y += vveloc;