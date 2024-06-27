import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatefulWidget {
  const FavoriteIconWidget({super.key, required this.isFavorite});
  final bool isFavorite; // Remove 'final' keyword to make it non-final

  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
      icon: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: const Color(0xffA23045),
      ),
    );
  }
}
