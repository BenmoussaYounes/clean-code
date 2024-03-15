abstract class Shape {
  double area();
}

class Rectangle implements Shape {
  double width;
  double height;
  Rectangle(this.width, this.height);
  @override
  double area() {
    return width * height;
  }
}

class Circle implements Shape {
  double radius;
  Circle(this.radius);
  @override
  double area() {
    return radius * radius * 3.14;
  }
}

// GOOD example OF OPEN/CLOSED PRINCIPLE
// This class is closed for modification
// because if we add a new shape we don't need to modify this class
class AreaCalculator {
  double calculateArea(List<Shape> shapes) {
    double area = 0;
    for (var shape in shapes) {
      area += shape.area();
    }
    return area;
  }
}
