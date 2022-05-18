#include "colors.inc" 
#include "textures.inc" 
#include "golds.inc"

/*camera {
        location <0, 20, 50>
        look_at <0, 0, 0>
       }              
       
light_source { <20, 10, 20> color White }  
light_source { <20, 20, -20> color White } 

plane {
    <0, 1, 0>, 0
    texture {
        pigment {
        color Red
        }
    }
}   */ 
 
#declare obj1 = difference {
  
    sphere {
        <0,21,0>,18 
        pigment{color White}
    }  

    box {  
        <26,16,26>,
        <-26,47,-26>
        pigment{color White}
    } 
}  

#declare parteSuperior = difference {   

    object {obj1}

    sphere {
        <0,21,0>,17   
        pigment{color White}
    }
} 

#declare parteInferior = sor {
    6,
    <0,0>,
    <6.5,0>,
    <9,0.01>,  
    <8.75, 4.65>,
    <10.75, 7.5 >,
    <9, -7> 
    open   
    pigment{color White}
}   

#declare cuenco = union {
    
    object {parteInferior}
    object {parteSuperior}   
    torus {
        16.75, 0.55              // major and minor radius
        translate <0,16,0>      // so we can see it from the top
        pigment { White }
    }
}
