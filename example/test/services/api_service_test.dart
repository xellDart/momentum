import 'package:example/src/data/index.dart';
import 'package:example/src/services/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:momentum/momentum.dart';

void main() {
  test('<ApiService> test', () async {
    var tester = MomentumTester(
      Momentum(controllers: [], services: [ApiService()]),
    );
    await tester.init();

    var api = tester.service<ApiService>();
    expect(api != null, true);
    expect(api, isInstanceOf<ApiService>());

    var response = await api.getTodoList();
    expect(response.list.isNotEmpty, true);
    expect(response.list.length, 200);

    // test http error
    TodoList errorResult = TodoList(list: const []);
    try {
      errorResult = await api.getTodoList(timeout: 1);
    } catch (e) {}
    expect(errorResult.list, const []);
  });
}
