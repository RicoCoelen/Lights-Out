class Player{
  // global variables
  float positionX,positionY,speed,w,h,left,right,top,bottom,comboCounter;
  boolean aPressed,dPressed,upPressed,downPressed,leftPressed,rightPressed;
  ArrayList<String> playerInput = new ArrayList<String>();
  ArrayList<PImage> playerInputButtons = new ArrayList<PImage>();
  PImage texture;
  PImage upArrow = loadImage("assets/sprites/up-arrow.png");
  PImage downArrow = loadImage("assets/sprites/down-arrow.png");
  PImage leftArrow = loadImage("assets/sprites/left-arrow.png");
  PImage rightArrow = loadImage("assets/sprites/right-arrow.png");

  
  Player(){
    aPressed = false;
    dPressed = false;
    positionX = width/2;
    positionY = height - 200;
    speed = 5;
    w = 30;
    h = 75;
    left = positionX - (w/2);
    right = positionX + (w/2);
    top = positionY - (h/2);
    bottom = positionY + (h/2);
    
  }
  
  //displaying player
  void display(){
    image(texture, positionX, positionY);
  }
  
  // player movement
  void movement(){
    if(aPressed){
      positionX = positionX - speed;
    }
    if(dPressed){
        positionX = positionX + speed;
    }   
  }
  
  //stops player
  void border(){
    if(positionX < 0){
      positionX = positionX + speed;
      print(positionX); 
    }
     else if(positionX > 610){
      positionX = positionX - speed;
      print(positionX); 
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
    for(int i = 0; i < playerInputButtons.size(); i++) {
      image(playerInputButtons.get(i), debugPos, 30);
      debugPos += 20;
    }
  }
}
