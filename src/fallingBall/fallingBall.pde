float rad=60;
float yvel=0, yacc=1; 
float y0=2*rad, x0=300;
float y=y0;
float xplot=0;
float plotxgap=1;
float ymax=0;
float ymin=y0;
float damp=0.915;

PGraphics plot;
PGraphics ball;
PGraphics outlines;
PGraphics text;

void setup()
{
  size(600,500); 
  
  plot = createGraphics(300,60);
  ball = createGraphics(width,height);
  outlines = createGraphics(width,height);
  text = createGraphics(width,height);
  
}
void draw()
{ 
  if(y>=460) yvel=-damp*yvel; 
  else yvel+=yacc;
  y+=yvel;
  
  if(y<ymin) ymin=y;
  if(y>ymax) ymax=y;
  
  text.beginDraw();
  text.background(230); text.fill(0,30,255); text.textSize(40); text.text("Y=",10,40); text.text(int(y),60,40); 
  text.textSize(18); text.text("Max="+int(ymax),200,20); text.text("Min="+int(ymin),200,50);
  text.endDraw();
  image(text,0,0);
  
  outlines.beginDraw();
  outlines.strokeWeight(3);
  outlines.line(0,60,width,60);
  outlines.line(300,0,300,60);
  outlines.strokeWeight(1);
  outlines.endDraw();
  image(outlines, 0, 0);
  
  if(xplot<width){    
  plot.beginDraw();
  plot.strokeWeight(1);
  plot.stroke(0,30,255);
  plot.line(xplot,(y-120)*60/(471-120),xplot+plotxgap,(y-yvel-120)*60/(471-120)); xplot+=plotxgap;
  plot.endDraw();}
  image(plot,302,0);
  
  
  ball.beginDraw();
  ball.clear();
  ball.fill(255,0,40);
  ball.ellipse(x0,y,rad,rad);
  ball.endDraw();
  image(ball,0,0);
   
}
