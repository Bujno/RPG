/// @description Insert description here
// You can write your code in this editor

enum state{
	stand,
	walk,
	run,
	attack
}

// Inicjalizacja poruszania się
sped = 3;
vsp = 0;
hsp = 0;

// Inicjalizacja walki (alarm)
timer = 0

// Inicjalizacja stanu
current = state.stand;