import android.os.Bundle;
import android.view.WindowManager;
import android.view.View;

void onCreate(Bundle bundle) {
  super.onCreate(bundle);
  getActivity().getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
}
///////////////// above code keeps screen from going to sleep. ////////////////////////////////////////////

GameBoard gb; // Define GameBoard class variable.
PFont titleFont; // Same for the font used in the title.

void setup() {
  frameRate(10);
  // Setup the screen, the fonts and assign a gameboard object to
  // the gb var.
  fullScreen();
  orientation(PORTRAIT);
  titleFont = createFont("Arial", 64 * displayDensity);
  textAlign(CENTER, CENTER);
  //println("Creating a new GameBoard");
  gb = new GameBoard();
  
  
}

void draw() {
  // Draw the gameboard and the title 
  // to the screen
  gb.display();
  //println("Displayed After");
  fill(255, 255, 0);
  textFont(titleFont);
  text("SimonSez", width/2, 100);
}

void touchStarted() {
  /**
    * This function overrides the touchStarted() function of 
    * Processing. 
    * This function checks to see what "quadrant" the mouse is in
    * to determine which box was clicked on. 
    * Better way to do this? Hell if I know, 
    * but for now this will work.
  **/

  // 0, top left
  if (mouseX <= width/2 && mouseY <= height/2) {
    // if returns true, then this is box number 0. 
    
    gb.touch(0);
    //gb.playSeq();
  }
  // 1 top right
  if (mouseX >= width/2 && mouseY <= height/2) {

    // ditto,
    gb.touch(1);
  }
  // 2, bottom left
  if (mouseX <= width/2 && mouseY >= height/2) {
    // ditto,
    gb.touch(2);
  }
  // 3, bottom right
  if (mouseX >= width/2 && mouseY >= height/2) {
    // and ditto.
    gb.touch(3);
  }
}
