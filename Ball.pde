class Ball
{
  PVector pos, vel; // position and velocity
  
  void display()
  {
    fill(255);
    stroke(255);
    ellipse(pos.x, pos.y, 20, 20);
  }
  
  void move(PortalPair _p) // TODO::::::check against portal positions, but make the portal moveable first!!!!
  {
    if (!_p.inBlueRange(pos) && !_p.inOrangeRange(pos)) // doesnt bounce off when portal is hit (MAYBE IT SHOULD IF ONLY ONE PORTAL HAS BEEN FIRED?????)
    {
      if (pos.x > width-10 || pos.x < 10)
        vel.x *= -1;
      if (pos.y > height-10 || pos.y < 10)
        vel.y *= -1;
    }
    else // this will actually check if portal has been hit
    {
      
    }
     
    pos.add(vel);
  }
  
  void launch(float vx, float vy)
  {
    vel.set(vx, vy);
  }
  
  void reset()
  {
    pos.set(width/2, height/2);
    vel.set(0, 0);
  }
  
  Ball(float x, float y)
  {
    pos = new PVector(x, y);
    vel = new PVector(0,0);
  }
}
