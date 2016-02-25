private double fractionLength = .8; 
private int smallestBranch = 5; 
private double branchAngle = 0.2;  
private float rotation = 0;
public void setup() 
{   
	size(800,800);
	frameRate(60);   
} 
public void draw() 
{   
	background(0);
	stroke(255, 75, 0);
	fill(255, 75, 0);
	ellipse(100, 100, 150, 150);
	noFill();
	stroke(0,255,0);
	pushMatrix();
	translate(400, 400);
	rotate(rotation);
    ellipse(0, 0, 300, 300);
	line(0, -150, 0, -230);   
	drawBranches(0, -230, 255, 0, 50, 3*Math.PI/2); 
	popMatrix();
	rotation += Math.PI/420;
} 
public void drawBranches(int x,int y, int green, int blue, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  stroke(0, green, blue);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if(branchLength > smallestBranch)
  {
  	drawBranches(endX1, endY1,  green - 15, blue + 15, branchLength, angle1 + Math.random()*(Math.PI/6));
  	drawBranches(endX2, endY2, green - 15, blue + 15, branchLength, angle2 - Math.random()*(Math.PI/6));
  }
} 
