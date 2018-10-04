class Player{
  // global variables
  float positionX;
  float positionY;
  float speed;
  boolean aPressed;
  boolean dPressed;
  
  Player(){
    aPressed = false;
    dPressed = false;
    positionX = width/2;
    positionY = height - 55;
    speed = 5;
  }
  //displaying player
  void display(){
    rect(positionX,positionY,30,55);
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
}
