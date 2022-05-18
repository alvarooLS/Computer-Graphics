#include "colors.inc" 
#include "stones.inc"
#include "textures.inc" 
#include "rand.inc"

/*camera {
    location <5, -15, -15>
    look_at <0.0, 0.0, 0.0>
}
background { color Grey }

light_source{ <1, -10, -10> White} */


#declare bola = union {
    sphere {
        <0, 0, 0>, 5
        texture { 
            pigment { color Red transmit 0.3 } 
            finish {phong 1}
        }
    }     
                    
    #declare RandomSeed = seed(777);   
    #declare bubbles = 300;
    #local Cntr = 1;
     
    #while ( Cntr <= bubbles )
        #local pos_sphere = VRand_In_Sphere(RandomSeed)*4.75;
    	object{ 
    	    sphere {<0, 0, 0>, 0.25*rand(RandomSeed) } 
    	    translate pos_sphere
    	    pigment { color White }
    	 	finish {phong 1}
    	} 
    	#local Cntr = Cntr + 1; 
    #end 
}
