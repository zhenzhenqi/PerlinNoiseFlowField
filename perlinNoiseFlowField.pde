FlowField field;
//Vehicle[] vehicles;

void setup(){
  size(800, 600);
  field = new FlowField();
  //vehicles = new Vehicle[30];
}

void draw(){
  background(255);
  field.display();
}  