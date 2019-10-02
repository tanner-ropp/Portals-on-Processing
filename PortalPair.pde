class PortalPair
{
  boolean blueAiming, orangeAiming, blueFired, orangeFired;
 
  /* trying out vectors */
  PVector bluePos, orangePos, previewPos;
  PVector blueDir, orangeDir, previewDir;
  
  void display()
  {
    if (blueFired)
    {
      fill(0, 255, 255);
      if (blueDir.x == 0)
        rect(bluePos.x, bluePos.y, 100, 10);
      else if (blueDir.y == 0)
        rect(bluePos.x, bluePos.y, 10, 100);
    }
    
    if (orangeFired)
    {
      fill(255, 128, 0);
      if (orangeDir.x == 0)
        rect(orangePos.x, orangePos.y, 100, 10);
      else if (orangeDir.y == 0)
        rect(orangePos.x, orangePos.y, 10, 100);
    }
  }
  
  void preview() // diplays preview of portal at aimed position
  {
    float angle = atan2(mouseY - height/2, mouseX - width/2);
    
    if (blueAiming)
      fill(153, 255, 255);
    else if (orangeAiming)
      fill(255, 204, 153);
      
    if (angle > PI/4 && angle <= 3*PI/4)
    {
      previewPos.set(constrain(mouseX, 50, width - 50), height - 5);
      previewDir.set(0, -1);
      rect(previewPos.x, previewPos.y, 100, 10); 
    }
    else if (angle > 3*PI/4 || angle <= -3*PI/4)
    {
      previewPos.set(5, constrain(mouseY, 50, height - 50));
      previewDir.set(1, 0);
      rect(previewPos.x, previewPos.y, 10, 100); 
    }
    else if (angle > -3*PI/4 && angle <= -PI/4)
    {
      previewPos.set(constrain(mouseX, 50, width - 50), 5);
      previewDir.set(0, 1);
      rect(previewPos.x, previewPos.y, 100, 10); 
    }
    else if (angle > -PI/4 && angle <= PI/4)
    {
      previewPos.set(width - 5, constrain(mouseY, 50, height - 50));
      previewDir.set(-1, 0);
      rect(previewPos.x, previewPos.y, 10, 100); 
    }
  }
  
  void firePortal()
  {    
    if (blueAiming)
    {
      blueAiming = false;
      bluePos.set(previewPos);
      blueDir.set(previewDir);
      blueFired = true;
    }
    else if (orangeAiming)
    {
      orangeAiming = false;
      orangePos.set(previewPos);
      orangeDir.set(previewDir);
      orangeFired = true;
    }
  }
  
  boolean inBlueRange(PVector pos)
  {
    if (pos.x < bluePos.x + 50 && pos.x > bluePos.x - 50 && pos.y < bluePos.y + 50 && pos.y > bluePos.y - 50)
      return true;
    else
      return false;
  }
  
  boolean inOrangeRange(PVector pos)
  {
    if (pos.x < orangePos.x + 50 && pos.x > orangePos.x - 50 && pos.y < orangePos.y + 50 && pos.y > orangePos.y - 50)
      return true;
    else
      return false;
  }
  
  PortalPair()
  {
    blueAiming = false;
    blueFired = false; // change this to false later
    orangeAiming = false;
    orangeFired = false; // change this to false later
    
    orangePos = new PVector();
    bluePos = new PVector();
    previewPos = new PVector();
    
    orangeDir = new PVector();
    blueDir = new PVector();
    previewDir = new PVector();
  }
}
