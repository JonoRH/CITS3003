varying vec2 texCoord;  // The third coordinate is always 0.0 and is discarded
uniform float texScale;
uniform sampler2D texture;

varying vec3 fN; //normal's eye  coordinates
varying vec3 fV; //Vertex's eye coordinates
varying vec3 fL; //Vector to the light from the vertex

uniform vec3 AmbientProduct, DiffuseProduct, SpecularProduct;
uniform mat4 ModelView;
uniform vec4 LightPosition;
uniform float Shininess;

void main()
{
    vec3 N = normalize(fN);   
    vec3 V = normalize(-fV); 
    vec3 L = normalize(fL);

    vec3 H = normalize(L + V);
    vec3 ambient = AmbientProduct;

    float Kd = max(dot(L,N), 0.0);
    vec3 diffuse = Kd* DiffuseProduct;

    float Ks = pow(max(dot(N,H), 0.0), Shininess);
    vec3 specular = Ks *SpecularProduct;

      if (dot(L, N) < 0.0 ) {
	specular = vec3(0.0, 0.0, 0.0);
    } 

    float distance = length(fL);
    float a = 1.0;
    float b = 0.8;
    float c = 0.9;
    float attenuation = 1.0/(a + b*distance + c * distance * distance);
    vec3 globalAmbient = vec3(0.1, 0.1, 0.1);
    gl_FragColor.rgb = globalAmbient + (ambient + diffuse + specular) * attenuation;
    gl_FragColor.a = 1.0;
    gl_FragColor = gl_FragColor * texture2D( texture, texCoord * texScale );

    // Initialize the vertex position attri
}