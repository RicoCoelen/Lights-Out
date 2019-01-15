class Enemy {
  
  // vars
  PImage sprite;
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
  int reward;
  int life;
  
  Boolean enemyLooksLeft;
  
  Animation smallEnemyRight = new Animation("sprites/smallenemy/smallenemy_right_", 1);
  Animation smallEnemyPunchRight = new Animation("sprites/smallenemy/smallenemy_punchright_", 5);
  Animation smallEnemyLeft = new Animation("sprites/smallenemy/smallenemy_left_", 1);
  Animation smallEnemyPunchLeft = new Animation("sprites/smallenemy/smallenemy_punchleft_", 5);
  
  Animation mediumEnemyRight = new Animation("sprites/mediumenemy/mediumenemy_right_", 1);
  Animation mediumEnemyPunchRight = new Animation("sprites/mediumenemy/mediumenemy_punchright_", 5);
  Animation mediumEnemyLeft = new Animation("sprites/mediumenemy/mediumenemy_left_", 1);
  Animation mediumEnemyPunchLeft = new Animation("sprites/mediumenemy/mediumenemy_punchleft_", 5);

  ArrayList<String> enemyCombo = new ArrayList<String>();
  ArrayList<PImage> enemyComboButtons = new ArrayList<PImage>();
  
  AudioController enemyDeathSound = new AudioController(lightsOut, "audio/oof.mp3");

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
        life = (int) random(1, 20);
        reward = 100;
        damage = 5;
        h = 65;
        w = 26;
        dcw = 200;
        ds = 0.8;
        sprite = loadImage("data/sprites/Scout.png");
        comboGenerator(2, 4);  //  Generate combo between 2 and 4 buttons
      break;
      
      // medium enemy
      case 2:
         health = (int) random(2, 4);
         life = (int) random(1, 15);
         reward = 200;
         damage = 20;
         h = 78;
         w = 26;
         dcw = 300;
         ds = 0.5;
         sprite = loadImage("data/sprites/Soldier.png");
         comboGenerator(4, 7);  //  Generate combo between 4 and 7 buttons
      break;
      
      // heavy enemy
      case 3:
         health = (int) random(2, 4);
         life = 1;
         damage = 40;
         reward = 500;
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
         life = (int) random(1, 100);
         reward = 10;
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
         life = 1;
         damage = 40;
         reward = 1000;
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
        enemyLooksLeft = true;
      }
      if (player.positionX < x) {
        //change vx in the near future default speed for every enemy is always -1
        vx = -1;
        cw = dcw * -1;
        cx = x;
        enemyLooksLeft = false;
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
    
    // temp draw animation based on enemytype
    switch(enemyType) {
      // light enemy
      case 1:
      if(!collisionPlayer()) {
        if (enemyLooksLeft == true) {
          smallEnemyRight.display(x, y);
        }
        else {
          smallEnemyLeft.display(x, y);
        }   
      }
      else {
          if (enemyLooksLeft == true) {
            smallEnemyPunchRight.display(x, y);
          }
          else {
            smallEnemyPunchLeft.display(x, y);
          } 
      }
      break;
      
      // medium enemy
      case 2:
      if(!collisionPlayer()) {
        if (enemyLooksLeft == true) {
          mediumEnemyRight.display(x, y);
        }
        else {
          mediumEnemyLeft.display(x, y);
        }   
      }
      else {
          if (enemyLooksLeft == true) {
            mediumEnemyPunchRight.display(x, y);
          }
          else {
            mediumEnemyPunchLeft.display(x, y);
          } 
      }
      break;
      
      
      default:
        image(sprite, x, y);
      break;
    }
    
    // draw buttons
    this.drawButtons();
    
    // animates score counter when enemy dies
    scoreAnimation();
  }
  
  // collision with player
  boolean collisionPlayer(){ 
    if(x + w >= player.positionX &&
      x <= player.positionX + player.w){
      vx *= 0;
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
       // check whick way damage is given do the proper animation
       if (enemyLooksLeft == true) {
         smallEnemyPunchLeft.display(x, y);
       }
       else {
         smallEnemyPunchRight.display(x, y);
       }
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
      int buttonChoice = (int) random(1, 5);
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
         score += 10;
         if (health > 0) {
           comboGenerator(4, 7);  //  Generate combo between 4 and 7 buttons
         }
      break;
      
      // heavy enemy
      case 3:
         score += 50;
         if (health > 0) {
           comboGenerator(7, 10);  //  Generate combo between 7 and 10 buttons
         }
      break;
      case 5:
         score += 75;
         if (health > 0) {
           comboGenerator(7, 10);  //  Generate combo between 10 and 15 buttons
         }
      break;
    }
  }
  
  void kill() {
    enemyDeathSound.setVolume(-20);
    enemyDeathSound.play();
    switch (enemyType) {
      case 1:
        score += reward;
        break;
      case 2:
        score += reward;
        break;
      case 3:
        score += reward;
        break;
      case 4:
        score += reward;
        break;
      case 5:
        score += reward;
        break;
    }
    enemyList.remove(enemyList.indexOf(this));  //  Gets current index of object in array and removes itop();
    
  }
  
  void scoreAnimation() {
    if (displayScore < score) {
      displayScore++;
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
