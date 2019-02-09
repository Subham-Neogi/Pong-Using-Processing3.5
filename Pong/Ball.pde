
 
   
class Ball
{ 
  float radius=7.5;
  float x;
  float y;
  float speedx,speedy;
  int ht,wd;
  int points1=0,points2=0;
  Ball(float xpos,float ypos,int wh,int wb)
  {x=xpos;speedx=random(-1,1)>0?1:-1;
  y=ypos;speedy=random(-1,1)>0?1:-1;
  ht=wh;wd=wb;points1=0;points2=0;

   
  }
  void make()
  {ellipse(x,y,radius,radius);
  }
  boolean move()
  { boolean t=false; 
    x+=speedx;
     if (y>ht-radius){
     speedy=-speedy;t=true;
    }
  else if (y < radius) {
    speedy=-speedy;t=true; 
  }
  y+=speedy;
   if (frameCount%1000==0)
   {speedx=(speedx/Math.abs(speedx))*(Math.abs(speedx)*1.45);
   speedy=(speedy/Math.abs(speedy))*(Math.abs(speedy)*1.45);
   }
   return t;
  }
  boolean collide(Paddle p)
  {
    if ((Math.abs(x-(p.x+p.h))<=radius || Math.abs(p.x-x)<=radius)  && (p.y<=y && y<=p.y+p.w))
    {speedx=-speedx;
    return true;
    }
    return false;
  }
  boolean reset()
  {  if (x-radius<=0 )
      {
        points2++;
        x=wd/2;y=ht/3;
        speedx=random(-1,1)>0?1:-1;
        speedy=random(-1,1)>0?1:-1;
        return true;
      }
      else if (x+radius>=wd)
      {  points1++; 
        x=wd/2;y=2*(ht/3);
       speedx=random(-1,1)>0?1:-1;
        speedy=random(-1,1)>0?1:-1;
        return true;
      }
      return false;
  }
}
