class Player{
  // global variables
  float positionX,positionY,speed,w,h,left,right,top,bottom,dashCounter;
  boolean aPressed,dPressed,qPressed,ePressed,bPressed;
  PImage texture;

  
  Player(){
    aPressed = false;
    dPressed = false;
    qPressed = false;
    ePressed = false;
    bPressed = false;
    positionX = width/2;
    positionY = height - 110;
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
    // player dodge
    if(qPressed){
       positionX = positionX - speed - 15;
    }
    if(ePressed){
       positionX = positionX + speed + 15;
    }
    // player block
    if(bPressed){
       rect(1,1,100,100); 
    }
  }
  //stops player
  void border(){
    if(positionX < 0){
      positionX = positionX + speed;
      print(positionX); 
    }
     else if(positionX > width-(w*2)){
      positionX = positionX - speed;
      print(positionX); 
    }
  }
  
  void dashCounter() {
    dashCounter += (float) 1/60;
    
    if (dashCounter >= 0.2){
      qPressed = false;
      ePressed = false;
      dashCounter = 0;
    }
  }
  
}
