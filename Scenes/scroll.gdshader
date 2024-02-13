shader_type canvas_item;
render_mode unshaded;

void fragment() {
    vec2 uv = vec2(UV.x + TIME, UV.y);
    COLOR = texture(TEXTURE, uv);
}