import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewPage extends StatefulWidget {
  final String url;
  final VoidCallback? onPaymentSuccess;
  const PaymentWebViewPage({
    super.key,
    required this.url,
    this.onPaymentSuccess,
  });

  @override
  State<PaymentWebViewPage> createState() => _PaymentWebViewPageState();
}

class _PaymentWebViewPageState extends State<PaymentWebViewPage> {
  late final WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() => isLoading = true);
            _checkPaymentSuccess(url);
          },
          onPageFinished: (String url) {
            setState(() => isLoading = false);
            _checkPaymentSuccess(url);
          },
          onNavigationRequest: (NavigationRequest request) {
            _checkPaymentSuccess(request.url);
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  void _checkPaymentSuccess(String url) {
    final lowerUrl = url.toLowerCase();
    if (lowerUrl.contains('success') ||
        lowerUrl.contains('completed') ||
        lowerUrl.contains('approved') ||
        lowerUrl.contains('payment-success') ||
        lowerUrl.contains('payment_success')) {
      if (widget.onPaymentSuccess != null) {
        widget.onPaymentSuccess!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
