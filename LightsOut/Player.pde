class Player {
  
  // global variables
  float positionX, positionY, velocityX, velocityY, speed, w, h, left, right, top, bottom, comboCounter;
  boolean aPressed, dPressed, qPressed, ePressed, upPressed, downPressed, leftPressed, rightPressed;
  int health;

  ArrayList<String> playerInput = new ArrayList<String>();
  ArrayList<PImage> playerInputButtons = new ArrayList<PImage>();
  
  PImage texture;
  PImage upArrow = loadImage("assets/sprites/up-arrow.png");
  PImage downArrow = loadImage("assets/sprites/down-arrow.png");
  PImage leftArrow = loadImage("assets/sprites/left-arrow.png");
  PImage rightArrow = loadImage("assets/sprites/right-arrow.png");

  Player() {
    aPressed = false;
    dPressed = false;
    qPressed = false;
    ePressed = false;
    positionX = width/2;
    positionY = 295;
    health = 100;
    speed = 5;
    w = 60;
    h = 110;
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
    health -= damage;
    if (health <= 0) {
      state = 9;
    }
  }
  
  //  Counter for player input
  void counter() {
    comboCounter += (float) 1/60;
    if (comboCounter >= 0.5) {
      playerInput.clear();  //  Clears the input array if the user didnt press a combo button after 0.5 seconds
      playerInputButtons.clear();  //  Clears the input array if the user didnt press a combo button after 0.5 seconds
    }
  }

  void drawButtons() {
    float debugPos = 0;
    for (int i = 0; i < playerInputButtons.size(); i++) {
      image(playerInputButtons.get(i), debugPos, 50);
      debugPos += 20;
    }
  }
}
