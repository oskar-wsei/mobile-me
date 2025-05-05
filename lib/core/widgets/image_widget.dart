import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String source;
  final BorderRadiusGeometry? borderRadius;

  const ImageWidget({super.key, required this.source, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: source,
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: borderRadius ?? _defaultBorderRadius,
          child: Image.network(
            source,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return Container(
                decoration: BoxDecoration(color: Colors.grey[900]),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double iconSize = constraints.maxWidth * 0.5;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.panorama,
                          size: iconSize,
                          color: Colors.grey[800], // Optional: add a color
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: LinearProgressIndicator(
                            value: _calculateLoadingProgress(loadingProgress),
                            minHeight: 4,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  double? _calculateLoadingProgress(ImageChunkEvent event) {
    final expectedTotalBytes = event.expectedTotalBytes;
    if (expectedTotalBytes == null) return null;
    return event.cumulativeBytesLoaded / expectedTotalBytes;
  }
}

final _defaultBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(12),
  topRight: Radius.circular(12),
);
