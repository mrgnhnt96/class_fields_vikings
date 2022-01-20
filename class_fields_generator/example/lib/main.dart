import 'package:class_fields_annotation/class_fields_annotation.dart';

part 'main.g.dart';

@fields
class Example {
  const Example({
    required String name,
    required this.code,
    required this.description,
    required this.date,
    required this.price,
  }) : _name = name;

  final String _name;
  final int code;
  final String description;
  final DateTime date;
  final double price;

  static const fields = _$ExampleClassFields();
}
