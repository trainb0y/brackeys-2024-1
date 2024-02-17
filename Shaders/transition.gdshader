shader_type canvas_item;

uniform float circle_size : hint_range(0,1) = 0.5f;
uniform vec2 player_position;

void fragment(){
	if (distance(player_position, UV) < circle_size){
		COLOR.a = 0.0;
	}
}