public class fuego extends cosmo{
  public boolean contacto = false,iz,der;
  public fuego(int _x, int _y, int _d, int _a, boolean _iz, boolean _der){
    x=_x;
    y=_y;
    d=_d;
    a=_a;
    iz=_iz;
    der=_der;
  }
  public void display(){
    image(fuego,x,y,d,a);
  }
  public void disparo(){
     display();
     y+=4; 
     if(y>500){
       if(iz){
          x=r.x;
          y=r.y;
          r.disparo=false;
       }else{
          x=t.x;
          y=t.y;
          t.disparo=false;
       }
       
     }
     if(contacto==true){
        if(iz){ 
         r.disparo=false; 
         if(!n.campo){
              n.vida--;
         }
        }else{
         t.disparo=false; 
         if(!n.campo){
              n.vida--;
         }
        }
        image(explosion,x-50,y,100,96);  
     }
  }


}
