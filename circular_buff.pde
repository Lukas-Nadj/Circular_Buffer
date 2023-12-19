

circ_buff voltage = new circ_buff(10, 0);


void setup(){
  size(400, 400);
  ellipseMode(CENTER);
}

void draw(){
  background(#D9D9D9);
   for(int i = 0;i<voltage.length;i++){
     if(i>0){
       line((i+1)*width/voltage.length-30, height-((int)voltage.get(i)*10), (i)*width/voltage.length-30, height-((int)voltage.get(i-1)*10));
     }
     ellipse((i+1)*width/voltage.length-30, height-((int)voltage.get(i)*10), 5, 5);
     
   }
}


void mousePressed(){
  voltage.add((int)(width-mouseY)/10);
}
