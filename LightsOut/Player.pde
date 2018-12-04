class Player {
  
  // global variables
  float positionX, positionY, velocityX, velocityY, speed, w, h, left, right, top, bottom, comboCounter;
  boolean aPressed, dPressed, qPressed, ePressed, upPressed, downPressed, leftPressed, rightPressed,wPressed,sPressed;
  int health;

  ArrayList<String> playerInput = new ArrayList<String>();
  ArrayList<PImage> playerInputButtons = new ArrayList<PImage>();
  
  PImage texture;
  PImage upArrow = loadImage("data/sprites/up-arrow.png");
  PImage downArrow = loadImage("data/sprites/down-arrow.png");
  PImage leftArrow = loadImage("data/sprites/left-arrow.png");
  PImage rightArrow = loadImage("data/sprites/right-arrow.png");
  PImage comboBackground = loadImage("data/sprites/combo-background.png");
  
  AudioController playerDamageSound;

  Player() {
    aPressed = false;
    dPressed = false;
    qPressed = false;
    ePressed = false;
    health = 100;
    speed = 5;
    w = 60;
    h = 110;
    positionX = width/2;
    positionY = groundHeight - h;
    left = positionX - (w/2);
    right = positionX + (w/2);
    top = positionY - (h/2);
    bottom = positionY + (h/2);
  }

  //displaying player
  void display() {
    image(texture, positionX, positionY);
    this.drawButtons();
  }
  
  void update() {
    //this.collision();
    //this.collisionMove();
    this.display();
    this.movement();
    this.border();
    this.counter();
    positionX += velocityX;
    positionY += velocityY;
    velocityX *= 0.4;
    if (playerInput.size() > 10) {
      clearInput();
    }
  }

  // player movement
  void movement() {
    if (aPressed) {
      velocityX -=  speed;
    }
    if (dPressed) {
      velocityX += speed;
    }  
    //dash
    if (ePressed) {
    }
    if (qPressed) {
    }
  }

  //stops player
  void border() {
    if (positionX < 0) {
      positionX = positionX + speed;
    }
     else if(positionX > width - w){
      positionX = positionX - speed;
    }
  }
  
  //  Player takes damage
  void takeDamage(int damage) {
     playerDamageSound = new AudioController(lightsOut, "audio/steve.mp3");
     playerDamageSound.play();
    health -= damage;
    // death / save score to file
    if (health <= 0) {
      state = 8;
      background.stop();
      background.changeSource(lightsOut, "audio/death_screen.mp3");
      background.loop();
    }
  }
  
  //  Counter for player input
  void counter() {
    comboCounter += (float) 1/60;
    if (comboCounter >= 0.5) {
      playerInput.clear();  //  Clears the input array if the user didnt press a combo button after 0.5 seconds
      playerInputButtons.clear();  //  Clears the input array if the user didnt press a combo button after 0.5 seconds
      //  replaces the green combo icons with black ones
      for (int i = 0; i < enemyList.size(); i++) {
        for (int j = 0; j < enemyList.get(i).enemyCombo.size(); j++) {
          if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).upArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).upArrow);
          } 
          else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).downArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).downArrow);
          } 
          else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).leftArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).leftArrow);
          } 
          else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).rightArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).rightArrow);
          }
        } 
      }
    }
  }
  
  void clearInput() {
      playerInput.clear();  //  Clears the input array if the user didnt press a combo button after 0.5 seconds
      playerInputButtons.clear();  //  Clears the input array if the user didnt press a combo button after 0.5 seconds
      for (int i = 0; i < enemyList.size(); i++) {
        for (int j = 0; j < enemyList.get(i).enemyCombo.size(); j++) {
          if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).upArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).upArrow);
          } 
          else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).downArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).downArrow);
          } 
          else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).leftArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).leftArrow);
          } 
          else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).rightArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).rightArrow);
          }
        } 
      }
  }

  void drawButtons() {
    float debugPos = 10;
    image(comboBackground, 0, height - 36);
    for (int i = 0; i < playerInputButtons.size(); i++) {
      if (i < 15) {
        image(playerInputButtons.get(i), debugPos, height - 26);
        debugPos += 20;
      }
    }
  }

  void checkCombo() {
    for (int i = 0; i < enemyList.size(); i++) {
      //  resets result if combo doesn't match player input
      enemyList.get(i).result = 0;
      if (enemyList.get(i).checkRange()) {
        //  loops through all enemies 
        for (int j = 0; j < enemyList.get(i).enemyCombo.size(); j++) {
          //  checks if index is in range of array
          if (playerInput.size() > j && enemyList.get(i).enemyCombo.size() > j) {
            //  checks if player input matches enemy combo
            if (enemyList.get(i).enemyCombo.get(j) == playerInput.get(j)) {
              enemyList.get(i).result++;
              // checks if the entered combo is correct
              if (enemyList.get(i).result == playerInput.size()) {
                //  if statements below replace the black combo icons with green ones if entered correctly by the player
                if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).upArrow) {
                  enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).upArrowCorrect);
                } 
                else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).downArrow) {
                  enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).downArrowCorrect);
                } 
                else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).leftArrow) {
                  enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).leftArrowCorrect);
                } 
                else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).rightArrow) {
                  enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).rightArrowCorrect);
                }
              } 
            }
          }
          //  checks if the correct input by the player has the same length as the enemy combo
          if (enemyList.get(i).result == enemyList.get(i).enemyCombo.size()) {
            enemyList.get(i).takeDamage();
            clearInput();
          }
        }
      }
    }
  }
  
}
