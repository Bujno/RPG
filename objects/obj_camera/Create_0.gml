/// @description Insert description here
// You can write your code in this editor

view_enabled = true;
view_set_visible(0,true);

camera = camera_create_view(0,0,480, 320, 0, id, 480, 320, 480, 320);
view_set_camera(0,camera);
