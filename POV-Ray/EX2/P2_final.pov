#include "textures.inc" 
#include "colors.inc"
#include "stones.inc"

camera {
location <35,15,-18> look_at <-2,3,5>
}

sky_sphere { pigment { color rgb Blue } } 
light_source {< 25, 25, -5> color rgb Yellow } 
light_source {< 25, 25,-5 > color rgb Orange }
//light_source {< 30, 25,-10 > color rgb White } 



//--------------------------------------------CIELO--------------------------------------------//


plane{<0,1,0>,1 hollow  // 
      
        texture{ pigment {color rgb<0.1,0.3,0.75>*0.7}
                 #if (version = 3.7 )  finish {emission 1 diffuse 0}
                 #else                 finish { ambient 1 diffuse 0}
                 #end 
               } // end texture 1

        texture{ pigment{ bozo turbulence 0.75
                          octaves 6  omega 0.7 lambda 2 
                          color_map {
                          [0.0  color rgb <0.95, 0.95, 0.95> ]
                          [0.05  color rgb <1, 1, 1>*1.25 ]
                          [0.15 color rgb <0.85, 0.85, 0.85> ]
                          [0.55 color rgbt <1, 1, 1, 1>*1 ]
                          [1.0 color rgbt <1, 1, 1, 1>*1 ]
                          } // end color_map 
                         translate< 3, 0,-1>
                         scale <0.3, 0.4, 0.2>*3
                        } // end pigment
                 #if (version = 3.7 )  finish {emission 1 diffuse 0}
                 #else                 finish { ambient 1 diffuse 0}
                 #end 
               } // end texture 2
       scale 10000
     }


//--------------------------------------------CESPED-------------------------------------------//
    
    
plane { <0,1,0>, 0 texture {pigment {Jade}}}
 
/*
plane {
    <0, 1, 0>, 0
    texture {
        pigment {
            gradient x       //this is the PATTERN_TYPE
            pigment_map {
                [0.3 wood scale 0.2]
                [0.3 Jade]    //this is a pigment identifier
                [0.6 Jade]
                [0.9 marble turbulence 1]
            }
        }
    }
} 
 */



//-----------------------------------------------TEMPLO------------------------------------------//

#declare cubo = box {
        <0,0,0>,
        <5,4,-5>
        texture {T_Stone11}
}

#declare cubo2 = box {
        <0,0,0>,
        <-5,4,-5>
        texture {T_Stone11}  
} 

#declare cubo3 = box {
        <0,0,0>,
        <5,4,5>
        texture {T_Stone11}  
}

#declare cubo4 = box {
        <0,0,0>,
        <-5,4,5>
        texture {T_Stone11}  
}

 


#declare aux1 = 10; 
#declare aux2 = 8; 
#macro myfractal1 (s, centro, centro2, it, recursividad)
	#if(it<recursividad)
	
	        object { cubo scale s translate centro translate centro2
	        }       
	               
		myfractal1 (s/2, centro + aux2/(pow(2,it))*y, 0, it + 1, recursividad)
		myfractal1 (s/2, centro + aux1/(pow(2,it))*-z, 0, it + 1, recursividad) 
		myfractal1 (s/2, centro + aux1/(pow(2,it))*x, 0, it + 1, recursividad)
	#end 
#end  


#macro myfractal2 (s, centro, centro2, it, recursividad)
	#if(it<recursividad)

	        object { cubo2 scale s translate centro translate centro2
	        }       
	                      
		myfractal2 (s/2, centro + aux2/(pow(2,it))*y, 0, it + 1, recursividad)
		myfractal2 (s/2, centro + aux1/(pow(2,it))*-z, 0, it + 1, recursividad)  
		myfractal2 (s/2, centro + aux1/(pow(2,it))*-x, 0, it + 1, recursividad)
	#end 
#end 

#macro myfractal3 (s, centro, centro2, it, recursividad)
	#if(it<recursividad)
	
	        object { cubo3 scale s translate centro translate centro2
	        }       
	                 
		myfractal3 (s/2, centro + aux2/(pow(2,it))*y, 0, it + 1, recursividad)
		myfractal3 (s/2, centro + aux1/(pow(2,it))*x, 0, it + 1, recursividad)
		myfractal3 (s/2, centro + aux1/(pow(2,it))*z, 0, it + 1, recursividad)  
	#end 
#end 

#macro myfractal4 (s, centro, centro2, it, recursividad)
	#if(it<recursividad) 
	    
	        object { cubo4 scale s translate centro translate centro2
	        }    
	                    
		myfractal4 (s/2, centro + aux2/(pow(2,it))*y, 0, it + 1, recursividad)
		myfractal4 (s/2, centro + aux1/(pow(2,it))*-x, 0, it + 1, recursividad)
		myfractal4 (s/2, centro + aux1/(pow(2,it))*z, 0, it + 1, recursividad)  
	#end 
#end

myfractal3 (1, 0, 0, 1, 7)
myfractal4 (1, 0, 0, 1, 7)
myfractal1 (1, 0, 0, 1, 7)
myfractal2 (1, 0, 0, 1, 7) 


                              
//-----------------------------------------------ARBOL---------------------------------------------//                    


#declare hojas = box {  
    <0,0,0>,
    <3,3,3>
    pigment {color Green}
}   

#declare fractal = hojas;
#declare iteration = 0;
#while (iteration<4)
	#declare fractal = 
		union {
			object {hojas}
			object { fractal scale 0.75 rotate <0,0,45> translate <0,3,0> }
			object { fractal scale 0.75 rotate <0,0,-45> translate <1.5,4.5,0> } 
		}
	#declare iteration= iteration + 1;
#end  

#declare tronco = box {
     <0,0,0>,
     <3,5,3>
     pigment {color Brown}
}    

#declare arbol = union {

    object {fractal translate <0,5,0>}
    object {tronco} 
    
}
  
  

object {arbol scale 1/5 rotate <0,-40,0> translate <15,0,-6>}
object {arbol scale 1/5 rotate <0,-50,0> translate <5,0,-12> }
object {arbol scale 1/5 rotate <0,-80,0> translate <9,0,-17> }
object {arbol scale 1/5 rotate <0,-50,0> translate <11,0,-10> }
object {arbol scale 1/5 rotate <0,-70,0> translate <16,0,-15> }
object {arbol scale 1/5 rotate <0,-50,0> translate <-5,0,20> }
object {arbol scale 1/5 rotate <0,-50,0> translate <15,0,10> }
object {arbol scale 1/5 rotate <0,-50,0> translate <8,0,12> }
object {arbol scale 1/5 rotate <0,-50,0> translate <5,0,17> }
object {arbol scale 1/5 rotate <0,-50,0> translate <19,0,5> }
object {arbol scale 1/5 rotate <0,-50,0> translate <25,0,3> }
object {arbol scale 1/5 rotate <0,-50,0> translate <15,0,3> }
object {arbol scale 1/5 rotate <0,-50,0> translate <-10,0,10> }
object {arbol scale 1/5 rotate <0,-50,0> translate <-25,0,5> } 
object {arbol scale 1/5 rotate <0,-50,0> translate <-15,0,-13> }
object {arbol scale 1/5 rotate <0,-50,0> translate <-18,0,-10> }
object {arbol scale 1/5 rotate <0,-50,0> translate <-18,0,-5> }
object {arbol scale 1/5 rotate <0,-50,0> translate <-8,0,-15> }
object {arbol scale 1/5 rotate <0,-50,0> translate <-8,0,-10> }
object {arbol scale 1/5 rotate <0,-50,0> translate <-18,0,-10> }
object {arbol scale 1/5 rotate <0,-50,0> translate <-18,0,10> } 
object {arbol scale 1/5 rotate <0,-50,0> translate <8,0,10> } 
object {arbol scale 1/5 rotate <0,-50,0> translate <22,0,-4> }


//--------------------------------------------SOL-----------------------------------------//


#declare ab = torus {
    5,0.1
    rotate <90,0,0> 
    pigment {color Yellow}
} 
  

#declare fractal = ab;
#declare iteration = 0;
#while (iteration<9)
	#declare fractal = 
		union {
			object {ab}  
			object { fractal rotate <0,20,0> } 
			object { fractal scale 0.75 }
			 
		}
	#declare iteration= iteration + 1;
#end    

object {fractal scale 1/3 translate <28,14,-8> }
    
    
