import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(
  BuildContext context,
  String? url,
) async {
  if (url == null || url.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Link not available')),
    );
    return;
  }

  final Uri uri = Uri.parse(url);

  try {
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      throw Exception('Launch failed');
    }
  } catch (e) {
    CustomSnackBar(context);
  }
}

void CustomSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Cannot open link')),
  );
}
