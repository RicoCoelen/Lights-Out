class Player{
  // global variables
  float positionX,positionY,speed,w,h,left,right,top,bottom;
  boolean aPressed,dPressed;
  SmallEnemy e1;

  
  Player(){
    e1 = new SmallEnemy();
    e1.draw();
    aPressed = false;
    dPressed = false;
    positionX = width/2;
    positionY = height - 55;
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
    rect(positionX,positionY,w,h);
  }
  //collision
  void collision(){
    if( mouseX > left && mouseX < right){
      if(mouseY > top && mouseY < bottom){
      }
    }
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
}
