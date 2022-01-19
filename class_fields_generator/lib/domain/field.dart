// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:class_fields_annotation/class_fields_annotation.dart';
import 'package:source_gen/source_gen.dart';

class Field {
  const Field({
    required this.name,
    required String? key,
  }) : key = key ?? name;

  factory Field.fromElement(FieldElement element) {
    String? checkForKey(Iterable<ElementAnnotation> annotations) {
      if (annotations.isEmpty) {
        return null;
      }

      String? getName(ElementAnnotation element, String field) {
        final reader = ConstantReader(element.computeConstantValue());

        final result = reader.peek(field)?.literalValue as String?;

        return result;
      }

      for (final annotation in annotations) {
        if (annotation.astName == 'JsonKey') {
          return getName(annotation, 'name');
        } else if (annotation.astName == '$Field') {
          return getName(annotation, 'key');
        }
      }
    }

    return Field(
      name: element.name,
      key: checkForKey(element.metadata),
    );
  }

  final String name;
  final String key;
}

extension on ElementAnnotation {
  String get astName {
    if (element == null) {
      throw ArgumentError.notNull('element');
    }

    if (this is! ElementAnnotationImpl) {
      return element!.displayName;
    }

    return (this as ElementAnnotationImpl).annotationAst.name.name;
  }
}
