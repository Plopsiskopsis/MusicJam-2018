shader_type spatial;
render_mode blend_mix,depth_draw_always,cull_back,diffuse_burley,specular_schlick_ggx;
uniform vec4 albedo : hint_color;
uniform sampler2D texture_albedo : hint_albedo;
uniform float specular;
uniform float metallic;
uniform float distance_fade_min;
uniform float distance_fade_max;
uniform float roughness : hint_range(0,1);
uniform float point_size : hint_range(0,128);
uniform sampler2D texture_metallic : hint_white;
uniform vec4 metallic_texture_channel;
uniform sampler2D texture_roughness : hint_white;
uniform vec4 roughness_texture_channel;
uniform sampler2D texture_emission : hint_black_albedo;
uniform vec4 emission : hint_color;
uniform float emission_energy;
uniform sampler2D texture_refraction;
uniform float refraction : hint_range(-16,16);
uniform vec4 refraction_texture_channel;
uniform vec3 uv1_scale;
uniform vec3 uv1_offset;
uniform vec3 uv2_scale;
uniform vec3 uv2_offset;


void vertex() {
	UV=UV*uv1_scale.xy+uv1_offset.xy;
}




void fragment() {
	vec2 base_uv = UV;
	vec4 albedo_tex = texture(texture_albedo,base_uv);
	ALBEDO = albedo.rgb * albedo_tex.rgb;
	float metallic_tex = dot(texture(texture_metallic,base_uv),metallic_texture_channel);
	METALLIC = metallic_tex * metallic;
	float roughness_tex = dot(texture(texture_roughness,base_uv),roughness_texture_channel);
	ROUGHNESS = roughness_tex * roughness;
	SPECULAR = specular;
	vec3 emission_tex = texture(texture_emission,base_uv).rgb;
	EMISSION = (emission.rgb+emission_tex)*emission_energy;
	vec3 ref_normal = NORMAL;
	vec2 ref_ofs = SCREEN_UV - ref_normal.xy * dot(texture(texture_refraction,base_uv),refraction_texture_channel) * refraction;
	float ref_amount = 1.0 - albedo.a * albedo_tex.a;
	EMISSION += textureLod(SCREEN_TEXTURE,ref_ofs,ROUGHNESS * 8.0).rgb * ref_amount;
	ALBEDO *= 1.0 - ref_amount;
	ALPHA = 1.0;
	ALPHA*=clamp(smoothstep(distance_fade_min,distance_fade_max,-VERTEX.z),0.0,1.0);
	ALBEDO = vec3(1.0, fract(TIME), 0.0);

}
