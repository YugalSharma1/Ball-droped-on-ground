float rad=60;
float yvel=0, yacc=1; //vel unit: pixel/frame, acc unit: vel/frame
float y0=2*rad, x0=300;
float y=y0;
int flag=-1;
float x=301;
float plotxgap=1;

PGraphics plot;
PGraphics ball;
PGraphics Outlines;

void setup()
{
  size(600,500); 
  
  plot = createGraphics(width,height);
  ball = createGraphics(width,height);
  Outlines = createGraphics(width,height);
  
  Outlines.beginDraw();
  Outlines.strokeWeight(3);
  Outlines.line(0,60,width,60);
  Outlines.line(300,0,300,60);
  Outlines.strokeWeight(1);
  Outlines.endDraw();
  
  image(Outlines, 0, 0);
}
void draw()
{ 
  if(y>=460) flag=-1*flag; 
  else yvel+=flag*yacc;
  y+=flag*yvel;
  
  if (yvel==0)
    {fill(0,30,255); textSize(40); text("Y=",10,40); text(y,60,40);}
    
  plot.beginDraw();
  plot.strokeWeight(1);
  plot.stroke(0,30,255);
  plot.line(x,(y-120)*60/340,x+plotxgap,(y-yvel-120)*60/340); x+=plotxgap;
  plot.endDraw();
  image(plot,0,0);
  
  ball.beginDraw();
  ball.fill(255,0,40);
  ball.ellipse(x0,y,rad,rad);
  ball.endDraw();
  image(ball,0,0);
   
}
