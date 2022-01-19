// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:class_fields_annotation/src/class_fields_annotation.dart' as a;
import 'package:source_gen/source_gen.dart';

class Field {
  const Field({
    required this.name,
    required String? key,
  }) : key = key ?? name;

  factory Field.fromElement(FieldElement element) {
    final name = element.name;

    const fieldAnnotationChecker = TypeChecker.fromRuntime(a.Field);
    final fieldAnnotation = fieldAnnotationChecker.firstAnnotationOf(element);

    String? key;
    if (fieldAnnotation != null) {
      final reader = ConstantReader(fieldAnnotation);
      key = reader.read('key').literalValue as String?;
    }

    return Field(
      name: name,
      key: key,
    );
  }

  final String name;
  final String key;
}
