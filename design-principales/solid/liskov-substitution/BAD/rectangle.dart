// LSP: Liskov Substitution Principle
// Liskov Substitution Principle states that objects of a superclass
// shall be replaceable with objects of its subclasses without breaking the application.

// BAD EXAMPLE
class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  double getArea() {
    return width * height;
  }

  set setWidth(double width) {
    this.width = width;
  }

  set setHeight(double height) {
    this.height = height;
  }
}

class Square extends Rectangle {
  Square(double side) : super(side, side);

  @override
  double getArea() {
    return width * width;
  }
}

void main() {
  Rectangle square = Square(10);
  square.setWidth = 5;
  square.setHeight = 10;
  print(square.getArea()); // output: 100
}


// This violates the Liskov Substitution Principle 
// The Square class is not a proper substitute for the Rectangle class.
// The Square class should not extend the Rectangle class because it does not behave like a rectangle.
