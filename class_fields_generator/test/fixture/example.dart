import 'package:class_fields_annotation/class_fields_annotation.dart';

@fields
class Example {
  const Example({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}
