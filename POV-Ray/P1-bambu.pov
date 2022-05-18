#include "colors.inc" 
#include "textures.inc" 
#include "golds.inc"  
#include "glass.inc"     
#include "woods.inc"
  
 
//ABAJO
/*camera {
        location <22.5,8,-20>
        look_at <22.5,8,15>
       }   */
       
//ARRIBA       
/*camera {
        location <40.5,45,15>
        look_at <22.5,39,15>
       } */ 
       
//CRUCE
/*camera {
        location <0,20,15>
        look_at <22.5,20,15>
       }*/  

//PLANTA       
/*camera {
        location <22.5,75,15>
        look_at <22.5,39,15>
       }  */
       
//GENERAL
/*
camera {
        location <50,100,-120>
        look_at <22.5,39,15>
       }  
       
light_source { <20, 200, 100> color White }
light_source { <20, 200, -100> color White } 

plane {
    <0, 1, 0>, 0
    texture {
        pigment {
        color White
        }
    }
}  
*/ 
 
#declare caja = difference {      

    box {
        <0,0,0>,
        <45,40,30>
        pigment {color Blue}  
        texture {T_Wood1}
    }   


    cylinder {
        <22.5,20,-10>,
        <22.5,20,40>,
        14
        pigment {color Blue} 
        texture {T_Wood1}
    } 

    cylinder {
        <22.5,45,15>,
        <22.5,25,15>,
        7
        pigment {color Blue} 
        texture {T_Wood1}  
    }
}       
  
#declare cristalDentro = lathe {
	linear_spline
	6,
	<0,0>, <11.5,0>, <11.5,26>, <6,26>, <6,31>, <5,31>
	pigment{color White transmit 0.9 }  
	texture {Glass}
	translate <22.5,8,15>
}    

                
#declare bambu1 = cylinder {
    <30,8.25,8>
    <-2,100,20>
    0.6
    pigment {color Green}
}      

#declare bambu2 = cylinder {
    <18,8.15,17>
    <42.5,100,18>
    0.6
    pigment {color Green}
}  

#declare bambu3 = cylinder {
    <25,8.2,8>
    <16,100,42>
    0.6
    pigment {color Green}
}  

#declare ambientador = union {

    object {caja}   
    object {cristalDentro}
    object {bambu1}
    object {bambu2}
    object {bambu3}  
}

//object {ambientador}