import processing.sound.*;
 SoundFile right;
 SoundFile left;
 SoundFile missed;
 SoundFile wall;
 SoundFile win;

float speedd=1,speedu=1;
float speed=0;
float x=0,y=0;
boolean w=false,s=false,i=false,k=false;
Paddle p1,p2;
Ball b;


void setup()
{  
  size(500,500);
  background(0);
  frameRate(60);
  p1=new Paddle(height,width,"right");
   p2=new Paddle(height,width,"left");
   x=random(4*(width/6),5*(width/6));
   y=height/2;
   b=new Ball(x,y,height,width);
   PFont mono;
   mono = createFont("andalemo.ttf",32,false);
   textFont(mono);
  right=new SoundFile(this,"/data/rightblip.wav");
  left=new SoundFile(this,"/data/leftblip.wav");
  missed=new SoundFile(this,"/data/missed.wav");
  wall=new SoundFile(this,"/data/wall.wav");
  win=new SoundFile(this,"/data/win.wav");
}

void draw()
{ 
 cursor(CROSS);
 clear();
 if(millis()<5000)
 {text("UP:W",width/3-80,height/4);
  text("DOWN:S",width/3-100,3*(height/4));
  text("UP:I",2*(width/3),height/4);
  text("DOWN:K",2*(width/3)-20,3*(height/4));
 }
  p1.make();
  p2.make();
  b.make();
  text(b.points1,width/4,35);
  text(b.points2,3*(width/4),35);
   if(b.points1==10)
   { text("Player 1 Wins!",width/3-50,height/2);noLoop();win.play();
   }
   else if(b.points2==10)
   {
   text("Player 2 Wins!",width/3-50,height/2);noLoop();win.play();
   }
   else{
     stroke(255);
   strokeWeight(3);
  line(width/2,0,width/2,height);}
  
  
  if(w){
    p1.moveup();
    
  }
  if(s){
  
    p1.movedown();
    }
    if(i){
    p2.moveup();
    
  }
  if(k){
  
    p2.movedown();
    }
    boolean t1=b.collide(p1);
    if (t1) right.play();
    boolean t2=b.collide(p2);
    if (t2) left.play();
    boolean t3=b.move();
    if (t3) wall.play();
    boolean t4=b.reset();
    if (t4) missed.play();
    /*if (!keyPressed)
    speed=0;*/
}
  
  void keyPressed()
  {  
    if (key=='w')
      {w=true;s=false;}
     if (key=='s')
      {s=true;w=false;}
      
     if (key=='i')
      {i=true; k=false;}
    else if (key=='k')
      {k=true;i=false;}
     
  }
  
  void keyReleased()
  {
   if (key=='w')
      w=false;
    if (key=='s')
      s=false;
     if (key=='i')
      i=false;
      if (key=='k')
      k=false;
  }
  
