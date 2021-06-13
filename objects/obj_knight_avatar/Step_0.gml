var space = keyboard_check(vk_space);
var escape = keyboard_check(vk_escape);

// Kod sprawia, że przy poruszaniu dochodzi do zmiany sprite z animacją 
// obiektu playera, dzięki czemu mamy odpowiednie animacje ruchu.
if (space || escape) {
	if (space) {
		global.sword = true;
	}
	room_goto(rm_world);
}

