//Little time and not much creativity. This turned out not like I intended, but I decided to go with this example anyway. 
//I have used all the instances that were mentioned in the assignment. 
//Looks mesmerizing, multiple lines creates an illusion that colors are mixing and I kind of like that. 


//Global variables
color[] modern = {#E5DBD1, #403C33, #DC572A, #0094B2, #F3D03E};
color[] palette = modern;
float counter = 0;

//Create setup code block
void setup(){
 //maximum window size for this assignment
 size(500, 500);
 //select the first color from the selected palette
}

 
float space=0; 
 
void draw()
{
  while(space < 4000){
    //ellipses with no fill and different strokes
    noFill();
    stroke(palette[int(random(1,5))]);
    strokeWeight(random(1,2));
    //generates random elipses from the canvas center
    float w = space + random(-100,100);
    float h = space + random(-100,100);
    ellipse (250,250, w, h);
     
    space= space+0.1;// makes each consecutive ellipse generally larger than the last.
  }
}
