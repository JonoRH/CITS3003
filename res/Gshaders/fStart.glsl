varying vec4 color;
varying vec2 texCoord;  // The third coordinate is always 0.0 and is discarded
uniform float texScale;
uniform sampler2D texture;

// PART I. Light Object 2
uniform vec4 LightPosition2;
uniform vec3 LightColor2;
uniform float LightBrightness2;

void main()
{
    gl_FragColor = color * texture2D( texture, texCoord * texScale );
}
