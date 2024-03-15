class Rectangle {
  double width;
  double height;
  Rectangle(this.width, this.height);
  double getArea() {
    return width * height;
  }
}

class Circle {
  double radius;
  Circle(this.radius);
  double getArea() {
    return radius * radius * 3.14;
  }
}

// BAD example OF OPEN/CLOSED PRINCIPLE
// This class is not closed for modification
// because if we add a new shape we need to modify this class
class AreaCalculator {
  double calculateArea(List shapes) {
    double area = 0;
    for (var shape in shapes) {
      if (shape is Rectangle) {
        area = shape.getArea();
      } else if (shape is Circle) {
        area = shape.getArea();
      }
    }
    return area;
  }
}

// case new shape

class Triangle {
  double base;
  double height;
  Triangle(this.base, this.height);
  double getArea() {
    return base * height / 2;
  }
}
