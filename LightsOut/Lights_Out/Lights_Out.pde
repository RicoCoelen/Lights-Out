//global variables
Player player;

void setup(){
  size(640,480);
  player = new Player();
  
}

void draw(){
  background(0);
  // calling classes
  player.display();
  player.movement();
}

void keyPressed(){
  //checking if pressed key is true
  if(key == 'a'){
    player.aPressed = true;
  }
  else if(key == 'd'){
    player.dPressed = true;
  }
}

void keyReleased(){
  //checking if pressed key is false
  if(key == 'a'){
    player.aPressed = false;
  }
  else if(key == 'd'){
    player.dPressed = false;
  }
}
