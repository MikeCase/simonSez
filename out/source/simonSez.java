import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import android.os.Bundle; 
import android.view.WindowManager; 
import android.view.View; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class simonSez extends PApplet {





public void onCreate(Bundle bundle) {
  super.onCreate(bundle);
  getActivity().getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
}
///////////////// above code keeps screen from going to sleep. ////////////////////////////////////////////

GameBoard gb;
PFont titleFont;

public void setup() {
  
  
  titleFont = createFont("Arial", 64 * displayDensity);
  textAlign(CENTER, CENTER);
  //println("Creating a new GameBoard");
  gb = new GameBoard();
  
}

public void draw() {
  gb.display();
  frameRate(1);
  gb.playSeq();
  frameRate(60);
  //println("Displayed After");
  fill(255, 255, 0);
  textFont(titleFont);
  text("SimonSez", width/2, 100);
}

public void touchStarted() {
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
class GameBlock {

  int MAXVALUES = 3;
  int blockColor;
  int savedColor;
  int blockNum;
  int startx;
  int starty;
  int endx;
  int endy;
  PFont blockFont;

  GameBlock(int x, int y, int x2, int y2, int cvalue, int bNum) {

    startx = x;
    starty = y;
    endx = x2;
    endy = y2;
    blockNum = bNum;
    blockColor = cvalue;
    savedColor = cvalue;
    blockFont = createFont("Arial", 20 * displayDensity);
    textAlign(CENTER, CENTER);
  }


  //updating our block model.
  public void setBlockNumber(int value) {
    blockNum = value;
  }

  public void setBlockColor(int value) {
    blockColor = value;
  }


  // getting our current values.
  public int getBlockNumber() {
    return blockNum;
  }

  public int getBlockColor() {
    return blockColor;
  }

  public void touched() {
    //println(blockNum);
    if (blockColor == savedColor) {
      setBlockColor(color(255));
    }
  }

  // display our blocks. 
  public void displayBlock() {

    fill(blockColor);
    rect(startx, starty, endx, endy);
    fill(0);
    textFont(blockFont);
    text( blockNum, startx+100*displayDensity, starty+200*displayDensity);
    if (blockColor != savedColor) {
      setBlockColor(savedColor);
    }
  }
}
/*
  0, top left
    (mouseX <= halfW && mouseY <= halfH)
  1, top right
    (mouseX >= halfW && mouseY <= halfH)
  2, bottom left
    (mouseX <= halfW && mouseY >= halfH)
  3, bottom right
    (mouseX >= halfW && mouseY >= halfH)
*/


class GameBoard {
  ArrayList<GameBlock> gBlocks = new ArrayList<GameBlock>();

  GameBlock gb;

  GameBoard() {
    int halfW = width/2;
    int halfH = height/2;
    int fullW = width;
    int fullH = height;
    int RED = color(255, 0, 0);
    int GREEN = color(0, 255, 0);
    int BLUE = color(0, 0, 255);
    int YELLOW = color(255, 255, 0);

    // Generate the blocks. 
    gBlocks.add(new GameBlock(0, 0, halfW, halfH, BLUE, 0));
    gBlocks.add(new GameBlock(halfW, 0, fullW, halfH, RED, 1));
    gBlocks.add(new GameBlock(0, halfH, halfW, fullH, GREEN, 2));
    gBlocks.add(new GameBlock(halfW, halfH, fullW, fullH, YELLOW, 3));

  }
// May be a stupid way of doing this, but I needed
// to pass the touch event along to the block itself.
  public void touched(int value){
    gb = gBlocks.get(value);
    gb.touched();
  }

  public void playSeq() {
    /*
      Generate a play sequence. 
      Expand the sequence by 1 each round.
      
    */
    int[] seq = {0,1,2,3,3,2,1,0};
    for ( int s : seq){
      this.touched(s);
    }
    
    
    
    
  }

  public void display() {
    for (GameBlock gb : gBlocks) {
      gb.displayBlock();
    }
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "simonSez" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
