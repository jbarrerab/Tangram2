int x[];
int y[];
color c[];
int r[];
int i;
int seleccion;

void setup(){
  
  size(900,900);
  x = new int[7];
  y = new int[7];
  c = new color[7];
  r = new int[7];

}
void draw(){
  
 background(100, 200, 250, 400);
 
    fill(50);
  rect( 400,300, 210, 210);
  
    textSize(70); 
    fill(50,50,150);
    text("Tangram", 350, 250);
   
    textSize(25); 
    fill(50);
    text("Instrucciones de juego:", 10, 30);
    textSize(15); 
    text("- Todas las figuras se encuentran posicionadas en la parte izquierda de la pantalla.", 10, 50);
    textSize(18); 
    text("Trasladar Figura", 10, 70);
    textSize(15); 
    text("- Ubique el mouse encima de la figura que desea trasladar.", 10, 90);
    text("- Mantenga presionado el clic izquierdo y traslade la figura a la posición que desee.", 10, 110);
    textSize(18); 
    text("Rotar Figura", 10, 130);
    textSize(15); 
    text("- Ubique el mouse encima de la figura que desea rotar.", 10, 150);
    text("- Con cada presión del clic derecho la figura rotará.", 10, 170);
    
    c[0]=color(100, 20, 300);
    c[1]=color(200, 200, 500);
    c[2]=color(2000, 100, 100, 500);
    c[3]=color(200, 10, 10, 500);
    c[4]=color(200, 100, 10, 5000);
    c[5]=color(200, 100, 1000, 2000);
    c[6]=color(20, 100, 10, 5000);
   
    
  for(i=0;i<7;i++){
    pushMatrix();
    translate(100,300);
    translate(x[i],y[i]);
    rotate(r[i]*PI/4);
    fill(c[i]);
    strokeWeight(3);
    
    switch(i){
      
      case 0:
        triangle(0, 0, 100, 0, 50, 50);//1
        break;
      case 1: 
        triangle(0, 0, 100, 0, 50, 50);//2
        break;
      case 2:
        triangle(0, 0, 200, 0, 100, 100);//3
        break;
      case 3:
        triangle(0, 0, 200, 0, 100, 100);//4
        break;
      case 4: 
        triangle(0, 0, 150, 0, 75, 75);//5
        break;
      case 5:
        rect(0, 0, 72, 72);//6
        break;
      case 6: 
        quad(50, 0, 150, 0, 100, 50, 0, 50);//7
        break;
    }  
    popMatrix();
  }
  if( mousePressed )
    if(seleccion != -1 ){
    x[seleccion] += mouseX-pmouseX;
    y[seleccion] += mouseY-pmouseY;
  } 
}

void mousePressed(){
  if(mouseButton == LEFT){//movimiento clik izq
    color colorM = get(mouseX,mouseY);
    for( int i=0;i<7;i++){
      if( c[i] == colorM ){
       seleccion = i;
      }
    }   
  }
}
void mouseClicked(){
  if( mouseButton == RIGHT ){//rota con clik der
    color colorM = get(mouseX,mouseY);
    for(int i=0;i<7;i++){
      if( c[i] == colorM ){
       r[i]=r[i]+1;
      }   
    }   
  }
}
