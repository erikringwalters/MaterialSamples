shader_type spatial;

uniform sampler2D myTexture;

void fragment() {
    // Access the UV coordinates
    vec2 uv = FRAGCOORD.xy / VIEWPORT_SIZE.xy;

    // Sample a texture using the UV coordinates
    vec4 textureColor = texture(myTexture, uv);

    // Do something with the texture color, for example, output it
    ALBEDO = textureColor.xyz;
}