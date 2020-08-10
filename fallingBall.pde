float rad=60;
float yvel=0, yacc=1; 
float y0=2*rad, x0=300;
float y=y0;
int flag=-1;
float x=301;
float plotxgap=1;

PGraphics plot;
PGraphics ball;
PGraphics outlines;
PGraphics text;

void setup()
{
  size(600,500); 
  
  plot = createGraphics(width,height);
  ball = createGraphics(width,height);
  outlines = createGraphics(width,height);
  text = createGraphics(width,height);
  
}
void draw()
{ 
  if(y>=460) flag=-1*flag; 
  else yvel+=flag*yacc;
  y+=flag*yvel;
  
  text.beginDraw();
  text.background(230); text.fill(0,30,255); text.textSize(40); text.text("Y=",10,40); text.text(y,60,40); 
  text.endDraw();
  image(text,0,0);
  
  outlines.beginDraw();
  outlines.strokeWeight(3);
  outlines.line(0,60,width,60);
  outlines.line(300,0,300,60);
  outlines.strokeWeight(1);
  outlines.endDraw();
  image(outlines, 0, 0);
      
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
