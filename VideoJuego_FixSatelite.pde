PImage nave,espacio,misil,ovni,meteorito,explosion,implosion,fuego,z,panel,x,puzzle,escudo,marco,salud,campo,T1,T2,click,q,cuadrado,tetromino,L,S,linea,T3,T4,T5;
int con=0;
boolean armas=true,tetris=false;
nave n;
misil m1;
misil m2;
meteorito a1,b1,c1;
ovni r,t;
fuego f1,f2;
void setup(){
  size(1200,600);
  textSize(45);
  cuadrado = loadImage("cuadrado.png");
  tetromino = loadImage("Tetromino.png");
  L = loadImage("L.png");
  S = loadImage("S.png");
  linea = loadImage("Linea.png");
  T1= loadImage("Tecla1.png");
  T2= loadImage("Tecla2.png");
  T3= loadImage("Tecla3.png");
  T4= loadImage("Tecla4.png");
  T5= loadImage("Tecla5.png");
  q= loadImage("q.png");
  click = loadImage("Click.png");
  salud = loadImage("230-salud.png");
  panel=loadImage("panel.png");
  nave = loadImage("nave.png");
  espacio = loadImage("espacio.jpg");
  misil = loadImage("misil.png");
  ovni = loadImage("ovni.png");
  campo = loadImage("campo.png");
  meteorito = loadImage("meteorito.png");
  explosion = loadImage("explosion.png");
  implosion = loadImage("implosion.png");
  fuego = loadImage("fuego.png");
  puzzle = loadImage("puzzle.png");
  z = loadImage("z.png");
  x= loadImage("x.png");
  escudo = loadImage("escudo.png");
  marco = loadImage("marco.png");
  n = new nave(600,420,100,74,100,false);
  m1 = new misil(n.x,n.y-30,20,43,true,false);
  m2 = new misil(n.x+20,n.y-30,20,43,false,true);
  r = new ovni(400,200,30,30,8,true,false,false);
  t = new ovni(900,240,30,30,8,false,true,false);
  f1= new fuego(r.x,r.y,30,37,true,false);
  f2= new fuego(t.x,t.y,30,37,false,true);
  a1= new meteorito(300,50,60,90,false);
  b1= new meteorito(600,50,60,90,false);
  c1= new meteorito(800,50,60,90,false);
}

void draw(){ 
  comandos();
  controlador();
  meteoritos();
  ovnis();
  nave();
}
void controlador(){
  image(panel,1025,200,175,250);
  if(armas && !tetris){
    image(marco,1088,330,100,70);
  }
  if(!armas && tetris){
    image(marco,1088,265,100,70);
  }
  image(z,1045,280,40,40);
  image(x,1045,345,40,40);
  image(puzzle,1092,271,90,60);
  image(escudo,1115,345,50,50);
}
void nave(){
 
  if(!n.muerte){
    if(!armas){
     n.campo=false;
    }
    if(n.campo==true){
    image(campo,n.x-10,n.y-30,120,120);
    }
    n.display();
    n.colision();
  
  if(n.disparo1==true){
    m1.disparo();
    
  }else{
    m1.contacto=false;
    m1.x=n.x;
    m1.y=n.y-30;
  }
  if(n.disparo2==true){
   m2.disparo();
  }else{
    m2.contacto=false;
    m2.x=n.x+80;
    m2.y=n.y-30;
  }
 }
}
void meteoritos(){
  if(!a1.muerte){
    a1.caer();
  }else{
    a1.muerte=false;
    a1.x=(int)random(280)+175;
    a1.y=30; 
  }
  if(!b1.muerte){
    b1.caer();
  }else{
    b1.muerte=false;
    b1.x=(int)random(280)+455;
    b1.y=30;
  }
  if(!c1.muerte){
    c1.caer();
  }else{
    c1.muerte=false;
    c1.x=(int)random(280)+680;
    c1.y=30;
  }

}
void ovnis(){
  if(!r.muerte){
   r.display();
   r.colision();
   r.disparar();
   r.mover();
  }
  if(!t.muerte){
   t.display();
   t.disparar();
   t.colision();
   t.mover();
  }
  if(r.disparo){
    f1.disparo();
  }else{
    f1.contacto=false;
    f1.x=r.x;
    f1.y=r.y;
  }
  if(t.disparo){
    f2.disparo();
  }else{
    f2.contacto=false;
    f2.x=t.x;
    f2.y=t.y;
  }
}
void espacio(){
 image(espacio,172,30,857,510);
}
void keyPressed(){
  if(keyCode==49){ // TECLA 1
    if(armas && !n.campo){
      n.disparo1=true;
    }else{
    
    }
  }
  if(keyCode==50){ // TECLA 2
    if(armas && !n.campo){
      n.disparo2=true;
    }else{
    
    }
  }
  if(keyCode==50){ // TECLA 3
    if(!armas){
     
    }
  }
  if(keyCode==50){ // TECLA 4
    if(!armas){
      
    }
  }
  if(keyCode==50){ // TECLA 5
    if(!armas){
      
    }
  }
  if(keyCode == 81){ //TECLA Q
      if(armas && !n.campo){
        n.campo=true;
      }else if(armas && n.campo){
        n.campo=false;
      }
   }
  if(keyCode==90){ // TECLA Z
     armas=false;
     tetris=true;
   }
   if(keyCode==88){ //TECLA X
     armas=true;
     tetris=false;
   }
   if(keyCode==68){ //TECLA D
      n.derecha();
   }
   if(keyCode==65){ // TECLA A
      n.izquierda();
   }
   if(keyCode==87){ //TECLA W
     n.arriba();
   }
   if(keyCode==83){ // TECLA S
     n.abajo();
   }
}
void mouseClicked(){
  if(mouseX>172 && mouseX<1029 && mouseY>30 && mouseY<540){   
      if(armas && !n.campo){
          n.disparo1 = true;
          n.disparo2 = true;
      }
  }
}
void comandos(){
  izquierda();
  derecha();
  arriba();
  abajo();
  espacio();
}
void izquierda(){
  fill(40,40,40);
  rect(0,0,width/7,height);
}
void derecha(){
  fill(40,40,40);
  rect(width-(width/7),0,width/7,height);
  if(armas){
    image(misil,10,100,30,60); image(T1,60,100,50,50); image(T2,100,100,50,50);
    image(misil,10,260,30,60); image(misil,30,260,30,60); image(click,80,260,50,50);
    image(campo,10,400,80,80); fill(255,0,255);rect(110,420,50,50);image(q,110,420,50,50);
  }else{
    image(linea,10,100,70,40); image(T1,100,100,50,50);
    image(tetromino,7,160,70,50); image(T2,100,170,50,50);
    image(cuadrado,15,240,50,50); image(T3,100,240,50,50);
    image(L,25,300,50,60); image(T4,100,310,50,50);
    image(S,25,370,50,60);image(T5,100,380,50,50);
  }
}
void arriba(){
  fill(40,40,40);
  rect(0,0,width,30);
}
void abajo(){
  fill(40,40,40);
  rect(0,height-60,width,60);
  fill(255,255,255);
  rect(320,height-50,700,43);
  text(n.vida+" %",180,height-10);
  image(salud,90,height-55,60,50);
  if(n.vida<=100 && n.vida>75){
     fill(0,143,57);
  }
  if(n.vida<=75 && n.vida>50){
     fill(57,255,20);
  }
  if(n.vida<=50 && n.vida>30){
     fill(255,255,0);
  }
  if(n.vida<=30 && n.vida>0){
     fill(255,0,0);
  }
  if(n.vida>0){
  rect(320,height-50,n.vida*7,43);
  }
}
