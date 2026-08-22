import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:file_picker/file_picker.dart';

class SalesMerchantWebviewScreen extends StatefulWidget {
  final String url;

  const SalesMerchantWebviewScreen({super.key, required this.url});

  @override
  State<SalesMerchantWebviewScreen> createState() =>
      _SalesMerchantWebviewScreenState();
}

class _SalesMerchantWebviewScreenState
    extends State<SalesMerchantWebviewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      );

    if (_controller.platform is AndroidWebViewController) {
      (_controller.platform as AndroidWebViewController).setOnShowFileSelector((
        FileSelectorParams params,
      ) async {
        try {
          final result = await FilePicker.pickFiles(
            allowMultiple: params.mode == FileSelectorMode.openMultiple,
          );
          if (result != null && result.files.isNotEmpty) {
            return result.files
                .where((e) => e.identifier != null || e.path != null)
                .map((e) => e.identifier ?? Uri.file(e.path!).toString())
                .toList();
          }
        } catch (e) {
          debugPrint('File picker error: $e');
        }
        return [];
      });
    }

    _controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Merchant'), centerTitle: true),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
