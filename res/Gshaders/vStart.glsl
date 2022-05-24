attribute vec3 vPosition;
attribute vec3 vNormal;
attribute vec2 vTexCoord;

varying vec2 texCoord;

varying vec3 fN; //normal's eye  coordinates
varying vec3 fV; //Vertex's eye coordinates
varying vec3 fL; //Vector to the light from the vertex

uniform mat4 ModelView;
uniform mat4 Projection;
uniform vec4 LightPosition;

void main()
{

    fN = (ModelView*vec4(vNormal,0.0)).xyz;
    fV= (ModelView *vec4(vPosition,1.0)).xyz;
    fL = LightPosition.xyz - fV;
    gl_Position = Projection*ModelView*vec4(vPosition,1.0);
    texCoord = vTexCoord;

}
