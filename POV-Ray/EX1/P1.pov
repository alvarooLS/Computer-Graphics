#include "colors.inc" 
#include "textures.inc" 
#include "golds.inc"  
#include "glass.inc"

#include "P1-bambu.pov" 
#include "P1-cuenco.pov" 
#include "P1-cenicero.pov" 
#include "P1-bola.pov"

plane {
    <0, 1, 0>, 0
    texture {
        pigment {
        color White
        }
    }
} 

camera {
    location <70,110,-175> 
    right 1*x 
    look_at <0,25,0>
} 

light_source { <-0, 200, 200> color White }  
light_source { <-0, 200, -200> color White }

object {ambientador}   

object {
    cuenco 
    scale <1.5,1.5,1.5> 
    translate <50,0,-50>
}

object {
    figura
    scale <5,5,5>
    translate <-40,0,70>
}

object {
    bola  
    scale <4.5,4.5,4.5>  
    translate <-20,22.5,-40>
}