shader_type spatial;
render_mode specular_disabled;

uniform sampler2D albedo_texture: filter_nearest, repeat_enable;
uniform vec3 albedo_color: source_color = vec3(1.0);
uniform vec2 uv_scale = vec2(1.0, 1.0);
instance uniform float instance_uv_scale = 1.0;

void fragment() {
	vec2 uv = UV * uv_scale * instance_uv_scale;
	vec3 albedo = texture(albedo_texture, uv).rgb;
	albedo *= albedo_color;
	ALBEDO = albedo;
}

