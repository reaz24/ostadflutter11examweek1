// Interface for movement behavior
abstract class Movable {
  void move();
}

// a) Abstract class with encapsulation and validation
abstract class Vehicle implements Movable {
  // Private field with late initialization to save memory if unused
  late int _speed;

  // Getter with runtime access check
  int get speed {
    if (!isSpeedInitialized) {
      throw StateError('Speed has not been initialized.');
    }
    return _speed;
  }

  // Setter with validation logic
  set speed(int value) {
    if (value < 0) {
      throw ArgumentError('Speed must be positive.');
    }
    _speed = value;
    _speedInitialized = true;
  }

  bool _speedInitialized = false;

  // Internal check
  bool get isSpeedInitialized => _speedInitialized;
}

// b) Subclass Car with overridden behavior
class Car extends Vehicle {
  final String model;

  Car(this.model);

  @override
  void move() {
    // High-performance output for monitoring/logging purposes
    print('[INFO] 🚗 Car "$model" is moving at $speed km/h');
  }
}

// c) Controller for managing logic (like a service layer)
class VehicleController {
  final Vehicle _vehicle;

  VehicleController(this._vehicle);

  void initializeAndMove(int speed) {
    try {
      _vehicle.speed = speed;
      _vehicle.move();
    } catch (e, stackTrace) {
      print('[ERROR] ${e.toString()}');
      print('[STACK TRACE] $stackTrace');
    }
  }
}

// d) Main function
void main() {
  // Using dependency injection
  final myCar = Car('Tesla Model 3');
  final controller = VehicleController(myCar);

  // Use controller to abstract direct interaction
  controller.initializeAndMove(120);
}
