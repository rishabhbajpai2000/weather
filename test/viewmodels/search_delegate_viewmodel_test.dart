import 'package:flutter_test/flutter_test.dart';
import 'package:weather/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SearchDelegateViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
