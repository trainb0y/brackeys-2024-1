shader_type canvas_item;
render_mode unshaded;

void fragment() {
    vec2 uv = vec2(UV.x + (TIME / 1.5), UV.y);
    COLOR = texture(TEXTURE, uv);
}