float distanciaX, distanciaY;
boolean gameOver, gameStart;
int aciertos;
import processing.core.PImage;

public class Objeto {
    float x, y;
    PImage imagen;
    int diametro;
    int velocidad;
     Objeto(){
    }
 
   void setObjeto(int diametro,float x, float y, int velocidad) {
        
        this.diametro = diametro;
        this.x = x;
        this.y = y;
        this.velocidad = velocidad;
        ellipse(x, y, diametro, diametro);
    }
    void drawObjeto(String nombreImagen){
     imagen = loadImage(nombreImagen);
     ellipse(x, y, diametro, diametro);
     image(imagen,x,y,diametro,diametro);
    }
};

Objeto Jugador, Objetivo;


//nombre de jugador, guardar archivo, dificultades, clases

void setup(){
fullScreen();
gameOver = false;
gameStart = false;
aciertos = 0;
Jugador = new Objeto();
Objetivo = new Objeto();
Jugador.setObjeto(50,width/2,height-50,10);
Objetivo.setObjeto(50,random(width),0,5);
};

void draw(){
  distanciaY = Jugador.y - Objetivo.y;
  distanciaX = Jugador.x - Objetivo.x;
  
  if(!gameStart){
   background(#F5DC1B);
   textSize(20);
   fill(0);
   text("Desea empezar a jugar? Presione enter",50, 250);
  }
  else if(gameStart){
   background(#11109D);
   fill(#11109D);
   
   Jugador.drawObjeto("imagenes/perro.png");
   Objetivo.drawObjeto("imagenes/hueso.png");
   
   textSize(40);
   fill(255);
   text(aciertos,width/16, height/15);
   Objetivo.y += Objetivo.velocidad;
  }

  
  if(distanciaY < Jugador.diametro && abs(distanciaX) < Jugador.diametro) {
   aciertos++;
   Objetivo.x = random(width);
   Objetivo.y = 0;
  }
    
  /*if(aciertos == 3){
   background(#061871);
   fill(255);
   textSize(24);
   text("Has ganado!!\nEscape para cerrar" , 160, 200);
   gameOver = true;
   }*/
   
  else if(Objetivo.y >= height){
   aciertos--;
   Objetivo.x = random(width);
   Objetivo.y = 0;
  }
   
  Jugador.x = constrain(Jugador.x, 0, width);
  
  
}

void keyPressed(){
  if(keyCode == ENTER && gameStart == false){
    gameStart = true;
  }
  if(keyCode == LEFT){
  Jugador.x -= Jugador.velocidad;
  }
  else if(keyCode == RIGHT){
  Jugador.x += Jugador.velocidad;
  }
  
}
