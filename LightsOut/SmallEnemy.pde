class SmallEnemy {
  
  // vars
  float x, y, vx, vy;
  int h = 100;
  int w = 60;

  /*
  Function to instantiate the enemy
  */
  SmallEnemy() {
    // position
    x = 500;
    y = height - 100;
    // velocity
    vx = -0.5;
    vy = 0;
  }

  /*
  Function to update the movement of the enemy
  */
  void update() {
    // movement
    x += vx;
    y += vy;
  }

  /*
  Function to draw the  on the screen
  */
  void draw() {
    // draw body
    rect(x, y, w, h);
    stroke(1);
    line(x-40, height-1, x+100, height-1);
    line(x-40, height, x-40, height-20); 
    line(x+100, height ,x+100, height-20);
  }
}
