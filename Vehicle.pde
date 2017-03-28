class Vehicle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  FlowField field;
  float force;

  Vehicle() {
    position = new PVector(random(width), random(height)); 
    velocity = PVector.random2D();
    acceleration = new PVector(0, 0);
    force = 0;
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    fill(255);
    ellipse(position.x, position.y, 1, 1);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void getFlowField(FlowField _field) {
    field = _field;
  }

  void follow() {
    int x = floor(position.x / 10);
    int y = floor(position.y / 10);
    force = field.noiseField[x*field.rows+y];
    //applyForce(cos(force), sin(force));
  }
}