public class Button{
  int buttonX;
  int buttonY;
  String label;
  public Button(int x, int y, String s){
    buttonX = x;
    butoonY = y;
    label = s;
  }
   void display() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textSize(64);
 
    if ( mouseX > buttonX - w/2 && mouseX < buttonX + w/2 &&
         mouseY > buttonY - h/2 && mouseY < buttonY + h/2) {       
      fill(220);
    } else {
      fill(255);
    }
 
    stroke(0);
    rect(buttonX, buttonY, w, h);
 
    fill(0);
    text(label, buttonX, buttonY);
  }
}
