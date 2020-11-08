public class ovni extends cosmo{
  public boolean der, iz, disparo=false;
  public ovni(int _x, int _y, int _d, int _a, int _vida,boolean _der, boolean _iz,boolean _muerte){
    x=_x;
    y=_y;
    d=_d;
    a= _a;
    vida=_vida;
    der=_der;
    iz= _iz;
    muerte=_muerte;
    
  }
  public void display(){
    image(ovni,x,y,60,60);
    if(vida<8){
    fill(41,49,51);
    rect(x,y-13,60,13);
    }
    if(vida<=7 && vida>5){
      fill(57,255,20);
      rect(x,y-13,45,13);
    }
    if(vida<=5 && vida>3){
      fill(229,190,1);
      rect(x,y-13,30,13);
    }
    if(vida<=3 && vida>0){
     fill(255,0,0);
     rect(x,y-13,15,13);
    }
    if(vida==0){
      muerte=true;
      image(implosion,x-50,y-50,200,200);
    }
  }
  public void mover(){
    if(der){
       if(x<=950){
         x+=5;
       }else{
         der=false;
         iz=true;
       }
    }
    if(iz){
       if(x>=170){
         x-=5;
       }else{
         der=true;
         iz=false;
       }
    }
  }
  public void disparar(){
   for(int i=n.x;i<n.x+n.d;i++){
     if(x==i){
       disparo=true;
       break;
     }
   }   
  }
  
  public void colision(){
     for(int i=x-d/2;i<=x+d+m1.d;i++){
       for(int j=y;j<y+a;j++){
             if(m1.x==i && m1.y==j){
               m1.contacto=true;
               vida--;
             }else if(m2.x==i && m2.y==j){
               m2.contacto=true;
               vida--;
             }
       }
     }
  }
}
