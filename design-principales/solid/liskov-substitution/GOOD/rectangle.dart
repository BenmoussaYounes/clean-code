// GOOD EXAMPLE

abstract class Shape {
  double getArea();
}

class Rectangle implements Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double getArea() {
    return width * height;
  }
}

class Square implements Shape {
  double side;

  Square(this.side);

  @override
  double getArea() {
    return side * side;
  }
}

void main() {
  List<Shape> shapes = [Rectangle(10, 20), Square(10)];

  for (Shape shape in shapes) {
    print(shape.getArea()); // output: 200 100
  }
}


// The Square class is now a proper substitute for the Rectangle class.
// The Liskov Substitution Principle is now satisfied.
