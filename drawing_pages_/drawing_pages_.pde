int canvasWidth = 800;
int canvasHeight = 800;

int buttonY = 600;

int buttonWidth = 150;
int buttonHeight = 75;

int buttonspace = 30;

int yesButtonX = canvasWidth/2 - (buttonWidth + buttonspace);
int noButtonX = canvasWidth/2 + buttonspace;

int textWidth = 400;
int textHeight = 350;
int textX = canvasWidth/2 - textWidth/2;
int textY = 80;

int textboxWidth = 450;
int textboxHeight = 300;
int textboxX = canvasWidth/2 - textboxWidth/2;
int textboxY = 50;


void setup ()
{
  size(800, 800);
  rect(yesButtonX, buttonY, buttonWidth, buttonHeight);
  rect(noButtonX, buttonY, buttonWidth, buttonHeight);
}

void draw ()
{
  
}

boolean mouseYes()
{
  if( (mouseX > yesButtonX) && (mouseX < yesButtonX + buttonWidth) && (mouseY > buttonY) && (mouseY < buttonY + buttonHeight) )
  {
    return true;  
  }
  return false;
}

boolean mouseNo()
{
  if( (mouseX > yesButtonX) && (mouseX < yesButtonX + buttonWidth) && (mouseY > buttonY) && (mouseY < buttonY + buttonHeight) )
  {
    return true;  
  }
  return false;
}

void mouseClicked()
{
  if (mouseYes())
  {
     print("clicked!");
     rect(textboxX, textboxY, textboxWidth, textboxHeight);
     fill(0,0,255);
     String s = "yes choice 1";
     text(s, textX, textY, textWidth, textHeight);  // Text wraps within text box
  }
  else 
  {
    print("outside");
    fill(0,0,0,0);
    rect(0, 0, 50, 50);
    rect(textboxX, textboxY, textboxWidth, textboxHeight);
    fill(0,0,255);
    String n = "no choice 1";
    text(n, textX, textY, textWidth, textHeight);  // Text wraps within text box
  }
}
