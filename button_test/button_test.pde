int[] button = new int[5];
int col=0;


void setup(){
size(640,480);
button[0]=220;
button[1]=190;
button[2]=200;
button[3]=50;
button[4]=0;
}

void draw(){
  background(155);
  fill(col);
  rect(button[0],button[1],button[2],button[3]);
  
  if (button[4]==1){
    rect(100,100,30,30);
  }
  
  if((mouseY<(button[1]+button[3]))&&(mouseY>(button[1]))){
  if((mouseX<(button[0]+button[2]))&&(mouseX>(button[0]))){
    col=150;
  }
  }
  
}


void mousePressed(){
  button[4]=0;
  if((mouseY<(button[1]+button[3]))&&(mouseY>(button[1]))){
  if((mouseX<(button[0]+button[2]))&&(mouseX>(button[0]))){
    button[4]=1;
    col=20;
  }
  }
}
