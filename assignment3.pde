//For this assingment I wanted to create something similar to sculptures of Angelika Arendt.
//My code was based on this example: http://www.openprocessing.org/sketch/60995

/*************************************
* MOUSE
* to start drawing circles: drag
*
* KEYS
* clear the screen: 'backspace'
* save a screenshot.jpg: 's' or 'S'
*
**************************************/




//Global Variables

color[] fillColors = {#44b4bf, #73cac6, #8dc67f, #1f8f61, #49b993, #61a47b, #f2e264};
color[] strokeColors= {#bc2632, #d56784, #e17b39, #d8454d, #ce5b96, #ef765b, #e94b4a, #76080b};
color[] fc = fillColors;
color[] sc = strokeColors;

int maxCount = 5000; //max count of the cirlces
int currentCount = 0;
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount]; //radius
int[] closestIndex = new int[maxCount]; //index
 
float minRadius = 20;
float maxRadius = 50;
 
// for mouse and arrow up/down interaction
float mouseRect = 30;
 
void setup() {
  size(800,600);
  background(255);
  smooth();
  cursor(ARROW);
}
 
 
 
void draw() { 
  if(mousePressed){
    background(255);
   
    // create a random position
    float newX = random(0+maxRadius,width-maxRadius);
    float newY = random(0+maxRadius,height-maxRadius);
    float newR = minRadius;
   
    // create a random position according to mouse position
   
    newX = random(mouseX-mouseRect/2,mouseX+mouseRect/2);
    newY = random(mouseY-mouseRect/2,mouseY+mouseRect/2);
    newR = 1;
    
   
    boolean intersection = false;
   
    // find out, if new circle intersects with one of the others
    for(int i=0; i < currentCount; i++) {
      float d = dist(newX,newY, x[i],y[i]);
      if (d < (newR + r[i])) {
        intersection = true;
        break;
      }
    }
   
    // no intersection = add a new circle
    if (intersection == false) {
      // get closest neighbour and closest possible radius
      float newRadius = width;
      for(int i=0; i < currentCount; i++) {
        float d = dist(newX,newY, x[i],y[i]);
        if (newRadius > d-r[i]) {
          newRadius = d-r[i];
          closestIndex[currentCount] = i;
        }
      }
   
      if (newRadius > maxRadius) newRadius = maxRadius;
       
      x[currentCount] = newX;
      y[currentCount] = newY;
      r[currentCount] = newRadius;
      currentCount++;
    }
   
    // draw circles
    for (int i=0 ; i < currentCount; i++) {
      stroke(sc[int(random(0,6))]);
      strokeWeight(random(5, 10));
      fill(fc[int(random(0,7))]);
      ellipse(x[i],y[i], r[i]*2,r[i]*2);
    }

    if (currentCount >= maxCount) noLoop();
  }
}
 
void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  if (key == BACKSPACE) background(255);
}
 
void keyPressed() {
  // mouseRect ctrls arrowkeys up/down
  if (keyCode == UP) mouseRect += 4;
  if (keyCode == DOWN) mouseRect -= 4;
}