import android.os.Bundle;
import android.view.WindowManager;
import android.view.View;

void onCreate(Bundle bundle) {
  super.onCreate(bundle);
  getActivity().getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
}
///////////////// above code keeps screen from going to sleep. ////////////////////////////////////////////

GameBoard gb;
PFont titleFont;

void setup() {
  fullScreen();

  titleFont = createFont("Arial", 64 * displayDensity);
  textAlign(CENTER, CENTER);
  //println("Creating a new GameBoard");
  gb = new GameBoard();
}

void draw() {
  gb.display();
  
  //println("Displayed After");
  fill(255, 255, 0);
  textFont(titleFont);
  text("SimonSez", width/2, 100);
}

void touchStarted() {
  // 0, top left
  if (mouseX <= width/2 && mouseY <= height/2) {
    gb.touched(0);
  }
  // 1 top right
  if (mouseX >= width/2 && mouseY <= height/2) {
    gb.touched(1);
  }
  // 2, bottom left
  if (mouseX <= width/2 && mouseY >= height/2) {
    gb.touched(2);
  }
  // 3, bottom right
  if (mouseX >= width/2 && mouseY >= height/2) {
    gb.touched(3);
  }
}
