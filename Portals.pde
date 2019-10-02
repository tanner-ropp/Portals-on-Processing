Ball b;
PortalPair p;
int sx,sy;
float trajx, trajy;
boolean ballAiming = false;

void setup()
{
  size(600,600);
  b = new Ball(width/2, height/2);
  p = new PortalPair();
  rectMode(CENTER);
}

void draw()
{
  background(0);
  b.display();
  b.move(p);
  p.display();
  
  if (p.orangeAiming || p.blueAiming)
    p.preview();
  
  if (ballAiming)
  {
    strokeWeight(3);
    trajx = sx-mouseX;
    trajy = sy-mouseY;
    stroke(255, 0, 0);
    // line(width/2, height/2 , width/2+trajx, height/2 +trajy);
    
    /* DAHSED LINE ATTEMPT */
    for (int i = 0; i < 10; i++)
    {
      line((width/2) + i*(trajx/9), (height/2) + i*(trajy/9), (width/2) + (i+0.2)*(trajx/9), (height/2) + (i+0.2)*(trajy/9));
    }
    strokeWeight(1);
  }
}

void keyPressed()
{
  if (key == '1')
  {
    p.orangeAiming = true; // SHOULD THESE BE MADE FALSE IF ANOTHER KEY IS PRESSED?
  }
  else if (key == '2')
  {
    p.blueAiming = true;
  }
}

void keyReleased()
{
  if (key == '1')
  {
    p.orangeAiming = false; // SHOULD THESE BE MADE FALSE IF ANOTHER KEY IS PRESSED?
  }
  else if (key == '2')
  {
    p.blueAiming = false;
  }
}

void mousePressed()
{
  if (p.blueAiming || p.orangeAiming)
  {
    p.firePortal();
  }
  else
  {
    ballAiming = true;
    sx = mouseX;
    sy = mouseY;
    b.reset();
  }
}

void mouseReleased()
{
  b.launch(trajx/10,trajy/10);
  ballAiming = false;
}
