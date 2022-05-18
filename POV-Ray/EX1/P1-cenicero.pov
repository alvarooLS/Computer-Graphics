#include "colors.inc" 
#include "textures.inc" 
#include "glass.inc"


/*camera {
        location <5, 30, -30>
        look_at <0, 0, 0>
       }              
       
light_source { <20, 20, -20> color White } 

plane {
    <0, 1, 0>, 0
    texture {
        pigment {
        color White
        }
    }
} */  

#declare columnasMini = prism { 

    linear_sweep  // También puede configurarse para que tome forma de pirámide conic_sweep
    linear_spline  // Tipo de función para unir los puntos ( quadratic_spline, cubic_spline… ojo puntos de control) 
    0, // Base
    11, // Altura
    5, // Puntos de la base  
    <3, -5>, <5,-5>, <4,-6.5>, <2.1,-6.5>,<3,-5>
    pigment { White transmit 0.6}
	texture {Glass3} 
}       

#declare columnasMedianas = prism { 

    linear_sweep  // También puede configurarse para que tome forma de pirámide conic_sweep
    linear_spline  // Tipo de función para unir los puntos ( quadratic_spline, cubic_spline… ojo puntos de control) 
    0, // Base
    13, // Altura
    5, // Puntos de la base  
    <-3,-5>, <3, -5>, <1.2,-8>, <-1.2,-8>, <-3,-5>
    pigment { White transmit 0.6}
	texture {Glass3} 
}   

#declare columnasAltas = prism {  

    linear_sweep  // También puede configurarse para que tome forma de pirámide conic_sweep
    linear_spline  // Tipo de función para unir los puntos ( quadratic_spline, cubic_spline… ojo puntos de control) 
    0, // Base
    15, // Altura
    5, // Puntos de la base  
    <-3,-5>, <3, -5>, <1.2,-8>, <-1.2,-8>, <-3,-5>
    pigment { White transmit 0.6}
	texture {Glass3} 
}

#declare triangulosBase = prism {
    
    linear_sweep  // También puede configurarse para que tome forma de pirámide conic_sweep
    linear_spline  // Tipo de función para unir los puntos ( quadratic_spline, cubic_spline… ojo puntos de control) 
    0, // Base
    1, // Altura
    4, // Puntos de la base  
    <-3, -5>, <3,-5>, <0,0>, <-3,-5>
    pigment {White transmit 0.6}
	texture {Glass3}  
}

#declare obj1 = merge {
                       
    object {columnasAltas}
    object {columnasMini}
    object {triangulosBase}                      
}  

#declare obj2 = merge {   

    object {columnasMedianas}
    object {columnasMini}
    object {triangulosBase} 
}  

#declare figura = merge {
    #local it = 0;
    #for (it, 0, 5, 1)   
        #if (mod(it,2) = 0)
            object {obj2 rotate <0,60*it,0>}
        #else object {obj1 rotate <0,60*it,0>}
        #end  
    #end    
}
 