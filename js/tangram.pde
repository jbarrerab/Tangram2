int x[];
int y[];
color c[];
int r[];
int i;
int seleccion;

void setup(){
  size(1000,1000);
  x = new int[7];
  y = new int[7];
  c = new color[7];
  r = new int[7];
for(i=0;i<7;i++){
  
    x[i]=int(random(0,1000));//posiciones de figuras al azar
    y[i]=int(random(0,1000)); 
    r[i]=int(random(0,10));//rotacion de figuras al azar
    
    if( x[i] < 0){//evitar que las figuras salgan de la pantalla
     x[i]=int(random(500,500));
    }
    if(x[i] > width){
    x[i]=int(random(500,500));
    }
    
    if(y[i] < 0){
       y[i]=int(random(500,500));
    }
    if(y[i] > height ){
      y[i]=int(random(500,500));
     
    }
}
}
void draw(){
  
 background(100, 200, 300, 400);
    c[0]=color(100, 20, 300);
    c[1]=color(200, 200, 500, 550);
    c[2]=color(2000, 100, 100, 500);
    c[3]=color(200, 10, 10, 500);
    c[4]=color(200, 100, 10, 5000);
    c[5]=color(200, 100, 1000, 2000);
    c[6]=color(20, 100, 10, 5000);
   
    
  for(i=0;i<7;i++){
    pushMatrix();
    translate(x[i],y[i]);
    rotate(r[i]*PI/4);
    fill(c[i]);
  
    switch(i){
      
      case 0:
        triangle(50, 50, 175, 175, 300, 50);//1
     
        break;
      case 1: 
      
        triangle(50, 50, 50, 300, 175, 175);//2
        break;
      case 2:
        triangle(237.5, 112.5, 300, 50, 300, 175);//3
        
        break;
      case 3:
        triangle(175, 300, 300, 175, 300, 300);//4
        break;
      case 4: 
        triangle(175, 175, 237.5, 237.5, 112.5, 237.5);//5
        break;
      case 5:
        quad(175, 175, 237.5, 112.5, 300, 175, 237.5, 237.5);//6
        break;
      case 6: 
        quad(50, 300, 112.5, 237.5, 237.5, 237.5, 175, 300);//7
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