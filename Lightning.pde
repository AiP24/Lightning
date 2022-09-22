int startx = 0;
int starty = 0;
int endx;
int endy;
int finalX;
int finalY;
int WIDTH = 500;
int HEIGHT = 500;
boolean shoot = false;
void setup()
{
  size(500,500);
}
void draw()
{
  background(8,0,52);
  int sw = (int)(Math.random()*5+3);
  strokeWeight(((shoot)? sw+10 : 5));
  int randCol = (int)(Math.random() * 56);
  
  //finalX = (int)(HEIGHT*tan(atan((float)mouseX/mouseY)));
  //finalY = (int)(WIDTH/tan(atan((float)mouseX/mouseY)));
  if ((float)mouseX/mouseY < (float)mouseY/mouseX) {
    finalY = 500;
    finalX = (int)(WIDTH/((float)mouseY/mouseX));
  } else {
    finalY = (int)(((float)mouseY/mouseX)*HEIGHT);
    finalX = 500;
  }
  //System.out.println(finalX);
  //System.out.println(finalY);
  //System.out.println();
  stroke(255,0,0);
  line(0,0,mouseX,mouseY);
  if (shoot) fill(255,255,0); else fill(255,255,255);
  ellipse(0,0,WIDTH*.1,WIDTH*.1);
  //ellipse(finalX,finalY,100,100);
  strokeWeight(sw);
  stroke(200+randCol,200+randCol,0);
  for (int bolt = 0; bolt < 5; bolt++) {
    startx = 0;
    starty = 0;
    endx = 0;
    endy = 0;
    float reps = (float) Math.random() * 20 + 10;
    if (shoot){
      for (int i=0;i < reps; i++) {
        endx += Math.random()*((finalX-endx*.9)/4);
        endy += Math.random()*((finalY-endy*.9)/4);
        line(startx,starty,endx,endy);
        startx = endx;
        starty = endy;
      }
    }
  }
  noStroke();
  if (shoot) {
    fill(255,80,0);
  }
  else {
    fill(150,150,150);
  }
  ellipse(mouseX,mouseY,100,100);
}
void mousePressed()
{
  shoot = true;
}
void mouseReleased(){
  shoot = !shoot;
}
