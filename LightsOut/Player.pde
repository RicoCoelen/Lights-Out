class Player{
  // global variables
  float positionX,positionY,speed,w,h,left,right,top,bottom;
  boolean aPressed,dPressed;
  PImage texture;

  
  Player(){
    aPressed = false;
    dPressed = false;
    positionX = width/2;
    positionY = height - 110;
    speed = 5;
    w = 60;
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
     else if(positionX > width - w){
      positionX = positionX - speed;
      print(positionX); 
    }
  }
  
  //check collision
  boolean collision(){
    if(e1.x + e1.w + e1.vx > player.positionX &&
       e1.x + e1.vx < player.positionX + player.w){
       e1.vx = 0;
         print("Collision");
      return true;
       }
     else{
      return false;
     }
  }
  
  // move object if collision is false
  void collisionMove(){
    if(collision()){
      print("test");
    }
    else{
      e1.vx =+ -1;
    }
  }  
}
