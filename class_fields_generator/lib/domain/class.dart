import 'package:analyzer/dart/element/element.dart';
import 'package:class_fields/domain/field.dart';

class Class {
  const Class({
    required this.name,
    required this.fields,
  });

  factory Class.fromElement(ClassElement element) {
    return Class(name: '', fields: []);
  }

  final String name;
  final Iterable<Field> fields;
}
