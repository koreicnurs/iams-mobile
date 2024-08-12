import 'dart:io';

import 'package:flutter/material.dart';

class ImageStatus extends StatelessWidget {
  final String imageUrl;
  final String fallbackUrl;

  const ImageStatus({super.key, required this.imageUrl, required this.fallbackUrl});

  Future<bool> _imageExists(String url) async {
    try {
      final uri = Uri.parse(url);
      final request = await HttpClient().getUrl(uri);
      final response = await request.close();
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _imageExists(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || !snapshot.hasData || !snapshot.data!) {
          return Image.network(
            fallbackUrl,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          );
        } else {
          return Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          );
        }
      },
    );
  }
}