<<<<<<< Updated upstream
class Player{
  
  // global variables
  float positionX,positionY,speed,w,h,left,right,top,bottom,comboCounter;
  int health;
  boolean aPressed,dPressed,upPressed,downPressed,leftPressed,rightPressed;
  
=======
class Player {
  // global variables
  float positionX, positionY, velocityX, velocityY, speed, w, h, left, right, top, bottom, comboCounter;
  boolean aPressed, dPressed, qPressed, ePressed, upPressed, downPressed, leftPressed, rightPressed;
>>>>>>> Stashed changes
  ArrayList<String> playerInput = new ArrayList<String>();
  ArrayList<PImage> playerInputButtons = new ArrayList<PImage>();
  
  PImage texture;
  PImage upArrow = loadImage("assets/sprites/up-arrow.png");
  PImage downArrow = loadImage("assets/sprites/down-arrow.png");
  PImage leftArrow = loadImage("assets/sprites/left-arrow.png");
  PImage rightArrow = loadImage("assets/sprites/right-arrow.png");
<<<<<<< Updated upstream
  
=======



>>>>>>> Stashed changes
  Player() {
    aPressed = false;
    dPressed = false;
    qPressed = false;
    ePressed = false;
    positionX = width/2;
    positionY = 295;
    health = 5;
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
<<<<<<< Updated upstream
    this.drawButtons();
  }
  
  void update() {
    this.collision();
    this.collisionMove();
    this.display();
    this.movement();
    this.border();
    this.counter();
=======
    positionX += velocityX;
    positionY += velocityY;
    velocityX *= 0.7;
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
    }
     else if(positionX > width - w){
      positionX = positionX - speed;
    }
  }
  
  //check collision
  boolean collision(){
    if(e1.x + e1.w + e1.vx > player.positionX &&
       e1.x + e1.vx < player.positionX + player.w){
       e1.vx = 0;
      return true;
     }
     else{
      return false;
     }
  }
  
  // move object if collision is false
  void collisionMove(){
    if(collision()){
    }
    else{
      e1.vx =+ -1;
    }
  }  
=======
      print(positionX);
    } else if (positionX > 580) {
      positionX = positionX - speed;
      print(positionX);
    }
  }
>>>>>>> Stashed changes

  //  Counter for player input
  void counter() {
    comboCounter += (float) 1/60;
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
    if (comboCounter >= 0.5) {
      playerInput.clear();  //  Clears the input array if the user didnt press a combo button after 0.5 seconds
      playerInputButtons.clear();  //  Clears the input array if the user didnt press a combo button after 0.5 seconds
    }
  }

  void drawButtons() {
    float debugPos = 0;
    for (int i = 0; i < playerInputButtons.size(); i++) {
      image(playerInputButtons.get(i), debugPos, 30);
      debugPos += 20;
    }
  }
}
