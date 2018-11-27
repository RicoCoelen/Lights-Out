class Enemy {
  
  // vars
  PImage upArrow = loadImage("data/sprites/up-arrow.png");
  PImage downArrow = loadImage("data/sprites/down-arrow.png");
  PImage leftArrow = loadImage("data/sprites/left-arrow.png");
  PImage rightArrow = loadImage("data/sprites/right-arrow.png");
  PImage upArrowCorrect = loadImage("data/sprites/up-arrow-correct.png");
  PImage downArrowCorrect = loadImage("data/sprites/down-arrow-correct.png");
  PImage leftArrowCorrect = loadImage("data/sprites/left-arrow-correct.png");
  PImage rightArrowCorrect = loadImage("data/sprites/right-arrow-correct.png");

  float x;
  float y;
  float vx;
  float vy;
  float cw; // actual check range width
  float cx; // actual check range x position
  float dcw; // default check range width
  float ds; // default enemy speed
  float comboWidth;
  float damageCounter;
  int damage;
  int h;
  int w;
  int health;
  int enemyType;
  int result;

  ArrayList<String> enemyCombo = new ArrayList<String>();
  ArrayList<PImage> enemyComboButtons = new ArrayList<PImage>();

  /*
  Function to instantiate the enemy
  */
  Enemy(float enemyX, float enemyY, int enemyType) {
    
    // set type
    this.enemyType = enemyType;
    
    // vertical velocity
    vy = 0;
    // check which type
    switch(enemyType) {
      
      // light enemy
      case 1:
        health = (int) random(1, 2);
        damage = 5;
        h = 80;
        w = 26;
        dcw = 200;
        ds = 0.8;
        sprite = loadImage("data/sprites/Scout.png");
        comboGenerator(2, 4);  //  Generate combo between 2 and 4 buttons
      break;
      
      // medium enemy
      case 2:
         health = (int) random(2, 4);
         damage = 20;
         h = 160;
         w = 50;
         dcw = 300;
         ds = 0.5;
         sprite = loadImage("data/sprites/Soldier.png");
         comboGenerator(4, 7);  //  Generate combo between 4 and 7 buttons
      break;
      
      // heavy enemy
      case 3:
         health = (int) random(2, 4);
         damage = 40;
         h = 154;
         w = 50;
         dcw = 400;
         ds = 0.3;
         sprite = loadImage("data/sprites/Heavy.png");
         if (health > 0) {
           comboGenerator(7, 10);  //  Generate combo between 7 and 10 buttons
         }
      break;
      
      // mini enemy
      case 4:
         health = 1;
         damage = 2;
         h = 28;
         w = 30;
         dcw = 100;
         ds = 5;
         sprite = loadImage("data/sprites/Mini.png");
         if (health > 0) {
           comboGenerator(1, 1);  //  Generate combo of 1 button
         }
      break;
      
      // boss
      case 5:
         health = (int) random(3, 5);
         damage = 40;
         h = 154;
         w = 50;
         dcw = 400;
         ds = 0.3;
         sprite = loadImage("data/sprites/Boss.png");
         if (health > 0) {
           comboGenerator(7, 10);  //  Generate combo between 7 and 10 buttons
         }
      break;
    }
    
    // set postion by parameters
    x = enemyX;
    y = enemyY - h;
  }

  /*
  Function to update the movement of the enemy
  */
  void update() {
    
    //no collision
    if(!collisionPlayer()) {
      // check if player is the right way
      if (player.positionX >= w) {
        //change vx in the near future default speed for every enemy is always 1
        vx = 1;
        cw = dcw;
        cx = x + w;
      }
      if (player.positionX < x) {
        //change vx in the near future default speed for every enemy is always -1
        vx = -1;
        cw = dcw * -1;
        cx = x;
      }   
     
      // movement
      x += vx;
      y += vy;
    }
    
    //  Calls damage method
    giveDamage();
    if (health <= 0) { kill(); }
  }

  /*
  Function to draw the  on the screen
  */
  void draw() {
    
    // give white background
    fill(255, 255, 255, 150);
    
    // draw collision box
    //rect(cx, y, cw, h);
    
    // draw combo block if in range // magic numbers for positioning above enemy character
    if (checkRange())  {
      fill(255);
      rect(x - (20 + w), y - 40, comboWidth, 30);
    }
    
    // enemy block view
    if (sprite == null) {
      rect(x, y, w, h);
    }
    else {
      image(sprite, x, y);
    }
    
    // draw buttons
    this.drawButtons();
  }
  
  // collision with player
  boolean collisionPlayer(){ 
    if(x + w >= player.positionX &&
      x <= player.positionX + player.w){
      ds *= 0;
       return true;
    }
    else{
     return false;
    }
  } 
  
 void giveDamage(){
   if (collisionPlayer()) {
     damageCounter += (float) 1/60;
     if (damageCounter >= 2) {
       player.takeDamage(this.damage);
       damageCounter = 0;
     }
   } else {
     damageCounter = 2;
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
  }
  
  void takeDamage() {  
    health--;
    enemyCombo.clear();
    enemyComboButtons.clear();
    // check which type
    switch(enemyType) {
      // light enemy
      case 1:
        if (health > 0) {
          comboGenerator(2, 4);  //  Generate combo between 2 and 4 buttons
        }
      break;
      
      // medium enemy
      case 2:
         if (health > 0) {
           comboGenerator(4, 7);  //  Generate combo between 4 and 7 buttons
         }
      break;
      
      // heavy enemy
      case 3:
         if (health > 0) {
           comboGenerator(7, 10);  //  Generate combo between 7 and 10 buttons
         }
      break;
      case 5:
         if (health > 0) {
           comboGenerator(7, 10);  //  Generate combo between 10 and 15 buttons
         }
      break;
    }
  }
  
  void kill() {
    enemyList.remove(enemyList.indexOf(this));  //  Gets current index of object in array and removes it
    switch (enemyType) {
      case 1:
        score += 100;
        break;
      case 2:
        score += 200;
        break;
      case 3:
        score += 500;
        break;
      case 4:
        score += 10;
        break;
      case 5:
        score += 1000;
        break;
      
    }
  }
  
  void drawButtons() {
    float debugPos = x - w;
    if (checkRange())  {
      comboWidth = 0;
      for(int i = 0; i < enemyComboButtons.size(); i++) {
        image(enemyComboButtons.get(i), debugPos, y - 33);
        debugPos += 20;
        comboWidth += 20;
        if (i == enemyComboButtons.size() - 1){
        comboWidth += w;
        }
      }
      comboWidth += 20;
       
      //  draws enemy health, needs some styling...
      fill(255, 0, 0);
      text(health, debugPos, y - 15);
    }
  }
}
