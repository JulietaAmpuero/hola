float objetivoX;
int objetivoY;
int velocidadObjetivo;
int jugadorX;
int jugadorY;
int aciertos;
boolean gameOver;
boolean gameStart;
int distanciaY;
float distanciaX;

//nombre de jugador, guardar archivo, dificultades, clases
void setup(){
fullScreen();
objetivoX = random(width);
objetivoY = 0;
jugadorX = width/2;
jugadorY = height-50;
aciertos= 0;
velocidadObjetivo = 3;
gameOver = false;
gameStart = false;
};

void draw(){
  distanciaY = jugadorY - objetivoY;
  distanciaX = jugadorX - objetivoX;
  
  if(!gameStart){
   background(#F5DC1B);
   textSize(20);
   fill(0);
   text("Desea empezar a jugar? Presione enter",50, 250);
  }
  else if(gameStart){
   background(177,127,37);
   fill(255);
   ellipse(jugadorX, jugadorY, 50, 50);
   ellipse(objetivoX, objetivoY, 50, 50);
   textSize(40);
   fill(255);
   text(aciertos,width/16, height/15);
   objetivoY += velocidadObjetivo;
  }

  
  if(distanciaY < 50 && abs(distanciaX) < 50) {
   aciertos++;
   objetivoX = random(width);
   objetivoY = 0;
  }
    
  if(aciertos == 3){
   background(#061871);
   fill(255);
   textSize(24);
   text("Has ganado!!\nEscape para cerrar" , 160, 200);
   gameOver = true;
   }
   
  else if(objetivoY >= height){
   aciertos--;
   objetivoX = random(width);
   objetivoY = 0;
  }
   
  jugadorX = constrain(jugadorX, 0, width);
  
  
}

void keyPressed(){
  if(keyCode == ENTER && gameStart == false){
    gameStart = true;
  }
  if(keyCode == LEFT){
  jugadorX -= 10;
  }
  else if(keyCode == RIGHT){
   jugadorX += 10;
  }
  
}
