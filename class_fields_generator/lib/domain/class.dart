import 'package:analyzer/dart/element/element.dart';
import 'package:class_fields/domain/field.dart';

class Class {
  const Class({
    required this.name,
    required this.fields,
  });

  factory Class.fromElement(ClassElement element) {
    final name = element.name;

    Iterable<Field> fields() sync* {
      for (final fieldElement in element.fields) {
        if (fieldElement.isSynthetic || fieldElement.isStatic) {
          continue;
        }

        yield Field.fromElement(fieldElement);
      }
    }

    return Class(
      name: name,
      fields: fields(),
    );
  }

  final String name;
  final Iterable<Field> fields;
}
