import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_pdf/open_pdf_method_channel.dart';

void main() {
  MethodChannelOpenPdf platform = MethodChannelOpenPdf();
  const MethodChannel channel = MethodChannel('open_pdf');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });

  test('open', () async {
    expect(await platform.open(null), '43');
  });
}
