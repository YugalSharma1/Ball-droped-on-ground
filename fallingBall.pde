float m=1, rad=60;
float yvel=0, yacc=1; //vel unit: pixel/frame, acc unit: vel/frame
float y0=2*rad, x0=300;
float y=y0;
float eloss=1; //energy loss factor
int flag=-1;
String s="";
float x=301;
void setup()
{
  size(600,500); 
  textSize(40);
  strokeWeight(3);
  line(0,60,width,60);
  line(300,0,300,60);
  strokeWeight(1);

}
void draw()
{ 
  
  //background(102);
  if(mousePressed==true)
    if(looping) noLoop();
    else loop();
  if(y>=460) flag=-1*flag;  // ground surface is at about y=460 pixel 
  else yvel+=flag*yacc;
  y+=flag*yvel;
  if (yvel==0)
    {fill(0,30,255); text("Y=",10,40); text(y,60,40);}
  fill(0,255,30);
  line(x,(y-120)*60/340,x+3,(y-yvel-120)*60/340); x+=3;
  fill(255,0,40);
  ellipse(x0,y,rad,rad);
  

  
  
  
}
