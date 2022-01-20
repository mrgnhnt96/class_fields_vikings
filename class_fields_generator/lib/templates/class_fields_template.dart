import 'package:class_fields/domain/class.dart';

class ClassFieldsTemplate {
  const ClassFieldsTemplate(this.subject);

  final Class subject;

  String generate() {
    final genName = '_\$${subject.name}ClassFields';
    final fields = subject.fields.map((field) {
      return "final ${field.name} = '${field.key}';";
    });

    return '''
class $genName {
  const $genName();

  ${fields.join('\n')}
}
''';
  }
}
