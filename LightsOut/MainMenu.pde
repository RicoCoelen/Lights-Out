class MainMenu{

final int stateMenu = 0;
final int stateStartGame = 1;

int state = stateMenu;
int textX = 100;


void draw() {
  switch (state){
  case stateMenu:
    showMenu();
    break;
  
  case stateStartGame:
    handleStateStartGame();
    break;
    
    
  default:
    println("Unknown state(in draw)"
      + state
      + "+++++++++++++++++++");
      exit();
      break;
  }
  
}

void keyPressed(){
  switch(state){
   case stateMenu:
     keyPressedForStateMenu();
     break;
   
   case stateStartGame:
     keyPressedForStateStartGame();
     break;
     
     
   default:
     println("unknown state (in keypreddes)"
     + state
     + "+++++++++++++++++++++");
     exit();
     break;
   }
}

void keyPressedForStateMenu(){
  switch(key){
   case'1':
     state =stateStartGame;
     break;
     
      
   case'x':
   case'X':
    exit();
    break;
   
   default:
     break;  
  }
}

void keyPressedForStateStartGame(){
  switch(key){
    case'b':
    case'B':
      state = stateMenu;
      break;
  }
}


void showMenu(){
  background (240,255,240);
  fill(0);
  textSize(40);
  text("Lights out", textX, 100);
  
  textSize(30);
  text("press 1 to start game", textX, 200);
  text("press x to exit", textX, 300);
  }

void handleStateStartGame(){
  background (240,255,240);
  fill(0);
  
}
}
