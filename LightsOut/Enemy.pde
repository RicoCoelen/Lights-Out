class Enemy {
  
  // vars
  PImage sprite;
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
    
    // vertical velocity
    vy = 0;
    
    // check which type
    switch(enemyType) {
      // light enemy
      case 1:
        h = 100;
        w = 60;
        dcw = 300;
        ds = 0.5;
        sprite = loadImage("assets/sprites/smallenemy.gif");
      break;
      // medium enemy
      case 2:
         h = 140;
         w = 100;
         dcw = 400;
         ds = 0.3;
      break;
      // heavy enemy
      case 3:
         h = 160;
         w = 120;
         dcw = 500;
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
    
    fill(255);
    // draw collision box
    rect(cx, y, cw, h);
    
    // draw combo block if in range // magic numbers for positioning above enemy character
    if (checkRange())  {
      rect(x - 20, y - 40, w + 40, 30);
    }
    
    // enemy block view
    if (sprite == null) {
      rect(x, y, w, h);
    }
    else {
      image(sprite, x, y);
    }
  }
  
  Boolean checkRange(){
    // set true if in range of enemy // long ass if statement
    if ((player.positionX >= cx && player.positionX <= cx + cw) || (player.positionX + w >= cx && player.positionX + w <= cx + cw) || (player.positionX >= cx + cw && player.positionX <= cx) || (player.positionX + w >= cx + cw && player.positionX + w <= cx))  {
      return true;
    }
    else {
      return false;
    }
  }
}