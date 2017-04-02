import processing.pdf.*;
FlowField field;
Vehicle[] vehicles;

void setup() {
  background(255);
  size(displayWidth, displayHeight);
  field = new FlowField(10);
  field.display();
  vehicles = new Vehicle[1000];
  for (int i=0; i<vehicles.length; i++) {
    vehicles[i] = new Vehicle();
  }
  beginRecord(PDF, "everything.pdf");
}

void draw() {
  //background(255);

  for (int i=0; i<vehicles.length; i++) {
    vehicles[i].display();
    vehicles[i].follow(field);
    vehicles[i].update();
    vehicles[i].checkEdges();
  }
}  

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}