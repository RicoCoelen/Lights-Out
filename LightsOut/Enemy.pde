class Enemy {
  
  // vars
  float x;
  float y;
  float vx;
  float vy;
  float cw; // check width
  float cx; // collision block x
  float dcw; // default check width
  float ds; // default speed
  int h;
  int w;

  /*
  Function to instantiate the enemy
  */
  Enemy(float enemyX, float enemyY, int enemyType) {
    
    // set postion by parameters
    x = enemyX;
    y = enemyY;
    
    // velocity
    vy = 0;
    
    // check which type
    switch(enemyType) {
      case 1:
        h = 100;
        w = 60;
        dcw = 400;
        ds = 0.5;
      break;
      case 2:
         h = 140;
         w = 100;
         dcw = 600;
         ds = 0.3;
      break;
      case 3:
         h = 160;
         w = 120;
         dcw = 800;
         ds = 0.2;
      break;
    }
  }

  /*
  Function to update the movement of the enemy
  */
  void update() {
    // check if player is the right way
    if (player.positionX > x) {
      vx = ds;
      cw = dcw;
      cx = x + w;
    }
    if (player.positionX < x) {
      vx = ds * -1;
      cw = dcw * -1;
      cx = x;
    }   
    // movement
    x += vx;
    y += vy;
  }

  /*
  Function to draw the  on the screen
  */
  void draw() {
    // draw body
    fill(255);
    
    // collision block view
    rect(cx, y, cw, h);
    
    // draw combo block
    rect(x - 20, y - 40, w + 40, 30);
    
    //// enemy block view
    rect(x, y, w, h);
    
  }
}
