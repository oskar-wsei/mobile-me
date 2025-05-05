import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_me/core/widgets/image_widget.dart';

class ImageCarouselWidget extends StatefulWidget {
  final List<String> images;
  final bool slideIndicators;

  const ImageCarouselWidget({
    super.key,
    required this.images,
    this.slideIndicators = true,
  });

  @override
  State<ImageCarouselWidget> createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            for (final imageUrl in widget.images)
              Builder(
                builder: (BuildContext context) {
                  return ProductImageWidget(imageUrl: imageUrl);
                },
              ),
          ],
          options: CarouselOptions(
            height: 350,
            enableInfiniteScroll: false,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        if (widget.slideIndicators && widget.images.length > 1) ...[
          SizedBox(height: 5),
          CarouselIndicator(
            currentIndex: _currentIndex,
            imagesCount: widget.images.length,
          ),
        ],
      ],
    );
  }
}

class CarouselIndicator extends StatelessWidget {
  final int imagesCount;
  final int currentIndex;
  const CarouselIndicator({
    super.key,
    required this.imagesCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imagesCount; i++)
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  currentIndex == i
                      ? Colors.indigoAccent
                      : Colors.grey.withAlpha(100),
            ),
          ),
      ],
    );
  }
}

class ProductImageWidget extends StatelessWidget {
  final String imageUrl;
  const ProductImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ImageWidget(source: imageUrl),
        ),
      ),
    );
  }
}
