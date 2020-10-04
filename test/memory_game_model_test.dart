import 'package:flutter_test/flutter_test.dart';

import '../lib/memory_game_model.dart';

void main() {
  MemoryGameModel c;
  setUp(() {
    c = MemoryGameModel();
  });
  group('MemoryModel', () {
    test("open", () {
      expect(c is MemoryGameModel, true);
    });
  });
}
