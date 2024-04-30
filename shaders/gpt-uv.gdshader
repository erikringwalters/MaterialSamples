shader_type spatial;

uniform sampler2D myTexture; // Define a texture uniform variable
uniform mat4 model_matrix;  // Model matrix to transform object-space coordinates
uniform vec3 object_position;
uniform vec2 uv_scale_factor;

void fragment() {
    // Access the object-space coordinates from a custom attribute
    vec3 objectCoord = object_position; // Replace with your attribute name

    // Transform object-space coordinates to world space
    vec4 worldCoord = model_matrix * vec4(objectCoord, 1.0);

    // Calculate UV coordinates based on world coordinates (you may need to adjust the scale)
    vec2 uv = worldCoord.xy * uv_scale_factor;

    // Sample the texture using the UV coordinates and the uniform variable
    vec4 textureColor = texture(myTexture, uv);

    // Do something with the texture color, for example, output it
    ALBEDO = textureColor.rgb;
}
