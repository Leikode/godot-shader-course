shader_type canvas_item;

uniform float warp_amount : hint_range(0.0, 1.0) = 0.05; // 0 is flat, 1 is spherical

uniform float scanline_count : hint_range(0.0, 2000.0) = 150.0;
uniform float scanline_opacity : hint_range(0.0, 1.0) = 0.4;
uniform float scanline_speed : hint_range(-10.0, 10.0) = 0.0; // Set to > 0 for scrolling lines

uniform float vignette_strength : hint_range(0.0, 2.0) = 0.5;
uniform sampler2D screen_texture : hint_screen_texture;

void fragment() {

}