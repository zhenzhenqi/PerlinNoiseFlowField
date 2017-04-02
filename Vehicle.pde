class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  FlowField field;
  float force;
  float maxspeed = 4;
  float maxforce = 0.1;
  
  Vehicle() {
    location = new PVector(width, random(height)); 
    velocity = new PVector(random(-30, 30), random(-30, 30));
    acceleration = new PVector(0, 0);
    force = 0;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(255, 0, 0, 100);
    ellipse(location.x, location.y, 1, 1);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }


  void follow(FlowField flow) {
    PVector desired = flow.lookup(location);
    desired.mult(maxspeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
    void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}