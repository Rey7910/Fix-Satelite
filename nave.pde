public class nave extends cosmo{

 public int gasolina;
 public boolean disparo1 = false; 
 public boolean disparo2=false;
 public boolean campo=false;
 
 public nave(int _x,int _y,int _d, int _a, int _vida, boolean _muerte){
   x=_x;
   y=_y;
   d=_d;
   a=_a;
   muerte=_muerte;
   vida=_vida;
 }
 public void display(){
  image(nave,x,y,d,a);
  if(vida<=0){
     muerte=true;
  }
 }
 public void derecha(){
    if(x<=923){ 
       x+=4;
    }
 }
 public void izquierda(){
   if(x>=175){ 
       x-=4;
   }   
 }
 public void abajo(){
   if(y<=450){
      y+=4;
    }
 }
 public void arriba(){
   if(y>=360){ 
       y-=4;
    }
 }
 public void colision(){
 ////---------- COLISION CON METEORITOS----------////
    for(int i=x-50;i<x+d+10;i++){
        for(int j=y-70;j<y+a;j++){
          if(a1.x==i && a1.y==j){
            a1.contacto=true;
          }
          if(b1.x==i && b1.y==j){
            b1.contacto=true;
          }
          if(c1.x==i && c1.y==j){
            c1.contacto=true;
          }
        }
      }
//// -------- COLISION CON FUEGO -----------------////
      for(int i=x-5;i<x+d+10;i++){
        for(int j=y-70;j<y+a;j++){
          if(f1.x+15==i && f1.y-50==j){
             f1.contacto=true;
          }
          if(f2.x+15==i && f2.y-50==j){
             f2.contacto=true;
          }
        }
      }
   }
  }   
  
  
  
