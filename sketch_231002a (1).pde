float distanciaX, distanciaY;
boolean gameOver, gameStart;
int aciertos;
import processing.core.PImage;
int nivel;

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
     imageMode(CENTER);
     imagen = loadImage(nombreImagen);
     image(imagen,x,y,diametro,diametro);
    }
};

Objeto Jugador, Objetivo;


//nombre de jugador, guardar archivo

void setup(){
fullScreen();

gameOver = false;
gameStart = false;
aciertos = 0;

Jugador = new Objeto();
Objetivo = new Objeto();

Jugador.setObjeto(80, width/2, height-60, 20);

Objetivo.setObjeto(60, random(width), 0, 5);

int nivel = 0;

};

void draw(){
  distanciaY = Jugador.y - Objetivo.y;
  distanciaX = Jugador.x - Objetivo.x;
  
  if(!gameStart){
    
   background(#74DE9D);
   textSize(40);
   fill(0);
   textAlign(CENTER);
   text("PRESIONA ENTER PARA JUGAR",width/2, 250);
   
   textSize(40);
   fill(0);
   textAlign(CENTER);
   text("DIFICULTAD: ",width/2, 370);
   
   textSize(40);
   fill(0);
   textAlign(CENTER);
   text(Objetivo.velocidad,width/2 + 130, 430);
   
   if(nivel < 4){
   fill(0);
   rect(width/2 + 130, 330 , 50*nivel, 50);
   }
   else if(nivel >= 4){
   fill(#74DE9D);
    }
  }
  
  else if(gameStart){
    
   background(#AFCBF7);
   
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
  if(keyCode == UP && Objetivo.velocidad < 20 && nivel < 4){
    Objetivo.velocidad += 5;
    nivel++;
  }
  if(keyCode == DOWN && Objetivo.velocidad > 0 && nivel > 0){
    Objetivo.velocidad -= 5;
    nivel--;
  }
}
