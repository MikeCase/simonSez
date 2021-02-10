/*
  0, top left
    (mouseX <= width/2 && mouseY <= height/2)
  1, top right
    (mouseX >= width/2 && mouseY <= height/2)
  2, bottom left
    (mouseX <= width/2 && mouseY >= height/2)
  3, bottom right
    (mouseX >= width/2 && mouseY >= height/2)

*/


class GameBoard {
  ArrayList<GameBlock> gBlocks = new ArrayList<GameBlock>();

  GameBlock gb;

  GameBoard() {
    int halfW = width/2;
    int halfH = height/2;
    int fullW = width;
    int fullH = height;
    color RED = color(255, 0, 0);
    color GREEN = color(0, 255, 0);
    color BLUE = color(0, 0, 255);
    color YELLOW = color(255, 255, 0);

    // Generate the blocks. 
    gBlocks.add(new GameBlock(0, 0, halfW, halfH, BLUE, 0));
    gBlocks.add(new GameBlock(halfW, 0, fullW, halfH, RED, 1));
    gBlocks.add(new GameBlock(0, halfH, halfW, fullH, GREEN, 2));
    gBlocks.add(new GameBlock(halfW, halfH, fullW, fullH, YELLOW, 3));
    //println(gBlocks.size()-1);
/*
    set counter, then loop through each block in the array list and 
    set it's box number, I suppose I could add it to the constructor... duh.. 
    int cntr = 0;
    for (GameBlock gb : gBlocks) {
      gb = gBlocks.get(cntr);
      gb.setBlockNumber(cntr);
      println("!"+gb.getBlockNumber());
      cntr++;
    }
*/
  }
// May be a stupid way of doing this, but I needed
// to pass the touch event along to the block itself.
  void touched(int value){
    gb = gBlocks.get(value);
    gb.touched();
  }

  void playSeq() {
    
  }

  void display() {
    for (GameBlock gb : gBlocks) {
      gb.displayBlock();
    }
  }
}
