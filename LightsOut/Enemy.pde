class Enemy {
  
  // vars
  PImage sprite = loadImage("assets/sprites/smallenemy.gif");
  PImage upArrow = loadImage("assets/sprites/up-arrow.png");
  PImage downArrow = loadImage("assets/sprites/down-arrow.png");
  PImage leftArrow = loadImage("assets/sprites/left-arrow.png");
  PImage rightArrow = loadImage("assets/sprites/right-arrow.png");

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

  ArrayList<String> enemyCombo = new ArrayList<String>();
  ArrayList<PImage> enemyComboButtons = new ArrayList<PImage>();

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
        h = 10;
        w = 5;
        dcw = 50;
        ds = 0.8;
        sprite = loadImage("assets/sprites/Scout.png");
        comboGenerator(2, 4);
        // 2 - 4

      break;
      // medium enemy
      case 2:
         h = 10;
         w = 5;
         dcw = 80;
         ds = 0.5;
         sprite = loadImage("assets/sprites/Soldier.png");
         comboGenerator(4, 7);

      break;
      // heavy enemy
      case 3:
         h = 10;
         w = 5;
         dcw = 100;
         ds = 0.3;
         sprite = loadImage("assets/sprites/Heavy.png");
         comboGenerator(7, 10);

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
    
    // death mechanic
    if (checkRange()) {
        print("in range");
      if (comboCorrect(player.playerInput, enemyCombo)) {
        enemyCombo.clear();
        enemyComboButtons.clear();
        comboGenerator(2, 4);
        println("death----- yeet");
      }
    }
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
    if ((player.positionX >= cx && player.positionX <= cx + cw) || (player.positionX + w >= cx && player.positionX + w <= cx + cw) || 
        (player.positionX >= cx + cw && player.positionX <= cx) || (player.positionX + w >= cx + cw && player.positionX + w <= cx))  {
      return true;
    }
    else {
      return false;
    }
  }

  
  Boolean checkCollision(){
    boolean collision = false;
    // check if x and y are in range of width and height
    if ((player.positionX >= x && player.positionX <= x + w) || (player.positionX + player.w >= x && player.positionX + player.w <= x + w))  {
      if ((player.positionY >= y && player.positionY <= y + h) || (player.positionY + player.h >= x && player.positionY + player.h <= y + h))  {
        return true;
      }
    }
    return collision;
  }

  
  void comboGenerator(float min, float max) {
    int comboAmount = Math.round(random(min, max));
    for(int i = 0; i < comboAmount; i++) {
      int buttonChoice = (int) random(1, 4);
      switch (buttonChoice) {
        case 1:
          enemyCombo.add("UP");
          enemyComboButtons.add(upArrow);
          break;
        case 2:
          enemyCombo.add("DOWN");
          enemyComboButtons.add(downArrow);
          break;
        case 3:
          enemyCombo.add("LEFT");
          enemyComboButtons.add(leftArrow);
          break;
        case 4:
          enemyCombo.add("RIGHT");
          enemyComboButtons.add(rightArrow);
          break;
      }
    }
    print(enemyCombo);
  }
  
  boolean comboCorrect(ArrayList<String> player, ArrayList<String> enemy) {
    
    int result = 0;
    if(player.size() == enemy.size()) {
      // check array list
      for(int i = 0; i < enemy.size(); i++) {
        if (player.get(i) == enemy.get(i)) {
        result++;
        }
      }  
    }
    // check if correct
    if(result == enemyCombo.size()) {
      return true;
    }
    return false;
  }
  
  void drawButtons() {
    float debugPos = x;
    if (checkRange())  {
      for(int i = 0; i < enemyComboButtons.size(); i++) {
        image(enemyComboButtons.get(i), debugPos, y - 33);
        debugPos += 20;
      }
    }
  }
}
