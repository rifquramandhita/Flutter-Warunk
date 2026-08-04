import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:file_picker/file_picker.dart';

class MerchantChatWebViewScreen extends StatefulWidget {
  final String? chatUrl;
  const MerchantChatWebViewScreen({super.key, this.chatUrl});

  @override
  State<MerchantChatWebViewScreen> createState() =>
      _MerchantChatWebViewScreenState();
}

class _MerchantChatWebViewScreenState extends State<MerchantChatWebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  String? _token;

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
      (_controller.platform as AndroidWebViewController)
          .setOnShowFileSelector((FileSelectorParams params) async {
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

    _initWebview();
  }

  Future<void> _initWebview() async {
    final token = await SharedPreferencesHelper.getString(PREF_AUTH);
    setState(() {
      _token = token;
    });

    if (token != null) {
      final cleanToken = token.replaceAll('Bearer ', '').trim();
      final encodedToken = Uri.encodeComponent(cleanToken);
      final url = widget.chatUrl != null
          ? widget.chatUrl!
          : 'https://warunk.dewalabs.com/webview/auto-login?url=%2Fwebview%2Fchats&bearer=$encodedToken';
      _controller.loadRequest(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chats'), centerTitle: true),
      body: _token == null
          ? const Center(child: Text('Authentication failed. Token not found.'))
          : SafeArea(
              child: Stack(
                children: [
                  WebViewWidget(controller: _controller),
                  if (_isLoading)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
    );
  }
}
