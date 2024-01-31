// Enhanced Enums
// YT: https://www.youtube.com/@MaxonFlutter/
// Courses: https://www.atomsbox.com/
// Enums are a special type of class that represents a group of constants (unchangeable variables, like final variables).
// enum Fruit { apple, banana, orange }

mixin VitaminCContent {
  bool get hasHighVitaminC;
}

// Enhanced Enums can have properties and methods.
enum Fruit with VitaminCContent {
  apple('Red', false),
  banana('Yellow', false),
  orange('Orange', true);

  final String color;
  final bool hasHighVitaminC;

  const Fruit(
    this.color,
    this.hasHighVitaminC,
  );

  String describeColor() => 'The color of this fruit is $color.';
}

// Enhanced Enums can have constructors and generic types.
enum Box<T> {
  small<int>(10),
  medium<double>(15.5),
  large<String>('20');

  final T dimension;

  const Box(this.dimension);
}
