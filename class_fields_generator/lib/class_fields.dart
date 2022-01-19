import 'package:build/build.dart';
import 'package:class_fields/src/class_fields_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder classFieldsBuilder(BuilderOptions options) {
  return SharedPartBuilder(
    [const FieldsGenerator()],
    'class_fields',
  );
}
