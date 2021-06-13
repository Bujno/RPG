
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
var shift = keyboard_check(vk_shift);
var boost = 0.5;

// Kod sprawia, że przy poruszaniu dochodzi do zmiany sprite z animacją 
// obiektu playera, dzięki czemu mamy odpowiednie animacje ruchu.
if((-left+right+down+(-up)) >= 1 && !shift) {
	current = state.walk;
} else if((-left+right+down+(-up)) >= 1 && shift) {
	current = state.run;
} else if((-left+right+down+(-up)) == 0){
	current = state.stand;	
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