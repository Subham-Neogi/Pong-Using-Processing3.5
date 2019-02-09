class Paddle
{
  float y;
  float x;
  float h=10;
  float w=3;
  int ht;
  String side="right";
  float speedup=0,speeddown=0;
  Paddle(int wh,int wb,String sd )
  {this.y=wh*0.45;
  this.side=sd;
    this.x=side=="right"?wb*0.03:wb*0.938;
    this.ht=wh;
    this.h=wh*0.03;
    this.w=wb*0.1;
  }
  void make()
  { 
    rect(x,y,h,w);
    
  }
  void moveup()
  { 
    if (y>ht*(h/ht))
    { 
      y=y+(speedup--%8); 
    }
    else
    speedup=0;
      
  }
  void movedown()
  {if(y+3.5*h<ht-ht*(h/ht))
    y+=(speeddown++%8);
    else
    speeddown=0;
  }
}
