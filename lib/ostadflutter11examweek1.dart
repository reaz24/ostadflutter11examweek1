
abstract class Vehicle {

  late int _speed ;


  int get speed => _speed;


  set speed(int speed) {
    if (speed < 0) {
      throw ArgumentError('Speed cannot be negative');
    }
    _speed = speed;
  }


  void move();
}


class Car extends Vehicle {
  @override
  void move() {

    print('The car is moving at ${speed} km/h');
  }
}


void main() {
  final car = Car();

  try {
    car.speed = 100;
    car.move();
  } catch (e) {
    print('Error: $e');
  }
}
