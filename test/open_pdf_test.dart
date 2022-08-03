import 'package:flutter_test/flutter_test.dart';
import 'package:open_pdf/open_pdf.dart';
import 'package:open_pdf/open_pdf_platform_interface.dart';
import 'package:open_pdf/open_pdf_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOpenPdfPlatform with MockPlatformInterfaceMixin implements OpenPdfPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final OpenPdfPlatform initialPlatform = OpenPdfPlatform.instance;
  OpenPdf openPdfPlugin = OpenPdf();
  MockOpenPdfPlatform fakePlatform = MockOpenPdfPlatform();
  OpenPdfPlatform.instance = fakePlatform;
  test('$MethodChannelOpenPdf is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOpenPdf>());
  });

  test('getPlatformVersion', () async {
    expect(await openPdfPlugin.getPlatformVersion(), '42');
  });
}
