import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatefulWidget {
  FavoriteIconWidget({super.key, required this.isFavorite});
  bool isFavorite;

  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.isFavorite = !widget.isFavorite;
        });
      },
      icon: Icon(
        widget.isFavorite ? Icons.favorite : Icons.favorite_border,
        color: const Color(0xffA23045),
      ),
    );
  }
}
