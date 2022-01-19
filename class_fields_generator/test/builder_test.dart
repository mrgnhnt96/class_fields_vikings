import 'package:class_fields/class_fields.dart';
import 'package:generator_test/generator_test.dart';
import 'package:test/test.dart';

void main() {
  test('successfully generates', () async {
    final generator = SuccessGenerator.fromBuilder(
      'example',
      classFieldsBuilder,
      compareWithFixture: false,
    );

    await generator.test();
  });
}
