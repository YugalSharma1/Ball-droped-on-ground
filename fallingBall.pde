float m=1, rad=60;
float yvel=0, yacc=1; //vel unit: pixel/frame, acc unit: vel/frame
float y0=2*rad, x0=300;
float y=y0, x=x0;
int flag=-1;
void setup()
{
  size(600,500); 
}
void draw()
{ 
  
  background(102);
  if(y>=460) flag=-1*flag;
  else yvel+=flag*yacc;
  y+=flag*yvel;
  fill(255,0,40);
  ellipse(x,y,rad,rad);
  

  
  
  
}
