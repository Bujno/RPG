
// Inicjalizujący stan
if (current == state.stand) {
	image_speed = 0;
	image_index = 0;
}

// Sprawdzamy czy klawisze odpowiedzialne za ruch zostały wciśnięte 
// przez użytkownika
var left = -keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = -keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var attack = keyboard_check_pressed(ord("Q"));
var shift = keyboard_check(vk_shift);
var boost = 0.5;

// Kod sprawia, że przy poruszaniu dochodzi do zmiany sprite z animacją 
// obiektu playera, dzięki czemu mamy odpowiednie animacje ruchu.
if (current != state.attack) {
	if((-left+right+down+(-up)) >= 1 && !shift) {
		current = state.walk;
	} else if((-left+right+down+(-up)) >= 1 && shift) {
		current = state.run;
	} else if((-left+right+down+(-up)) == 0){
		current = state.stand;	
	}
}

if (current == state.walk || current == state.run) {
	image_speed = 1;
	boost = 0.5;
	if(current == state.run) {
		image_speed = 1.5;
		boost = 1;
	}
	if (left + right != 0) {
		image_xscale = left + right;
		sprite_index = spr_player_right;
	}
	if (-up) {
		sprite_index = spr_player_up;
	}
	if (down) {
		sprite_index = spr_player_down;
	}
}

// Kod odpowiedzialny za animację ataku
if (current == state.stand && attack) {
	current = state.attack;
	timer = 20;
	image_speed = 1;
	if (sprite_index == spr_player_right) {
		sprite_index = spr_player_right_attack;
	}
	if (sprite_index == spr_player_up) {
		sprite_index = spr_player_up_attack;
	}
	if (sprite_index == spr_player_down) {
		sprite_index = spr_player_down_attack;
	}
}

if (timer > 0) {
	timer--;	
} else if (timer == 0) {
	current = state.stand
	if (sprite_index == spr_player_right_attack) {
		sprite_index = spr_player_right;
	}
	if (sprite_index == spr_player_up_attack) {
		sprite_index = spr_player_up;
	}
	if (sprite_index == spr_player_down_attack) {
		sprite_index = spr_player_down;
	}
}


// Kod odpowiada za kolizje. hsp jest to horizontal speed, ktory gdy natrafimy na obiekt
// kolizyjny w lini X, spada do zera. Analogicznie dzieje się to z osią Y.
var move = left + right;
hsp = move*sped*boost;
var move = up + down;
vsp = move*sped*boost;

if(!place_free(x+hsp,y)) {
	while(place_free(x+sign(hsp), y)){
		x +=sign(hsp)
	}
	hsp = 0;
}
if(!place_free(x,y+vsp)) {
	while(place_free(x,y+sign(vsp))){
		y +=sign(vsp)
	}
	vsp = 0;
}

x += hsp;
y += vsp;