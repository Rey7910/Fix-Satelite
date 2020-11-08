public class meteorito extends cosmo{
  public boolean contacto = false;
  public meteorito(int _x, int _y, int _d, int _a, boolean _muerte){
     x=_x;
     y=_y;
     d=_d;
     a=_a;
     muerte= _muerte;
  }
  public void display(){
     image(meteorito,x,y,d,a);
  }
  public void caer(){
    display();
    y+=3;
    if(y>=450){
        muerte=true;
     }  
     if(contacto){
       muerte=true;
       contacto=false;
       image(explosion,x-50,y-30,200,180);  
       if(!n.campo){
         n.vida-=1; // DAÑO METEORITO
       }
     }
  }
 
}
