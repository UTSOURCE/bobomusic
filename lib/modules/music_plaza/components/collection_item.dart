import "package:bobomusic/utils/color.dart";
import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";

class CollectionItem extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String author;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const CollectionItem({super.key, required this.imageUrl, required this.name, required this.author, this.onTap, this.onLongPress});

  @override
  State<CollectionItem> createState() => CollectionItemViewState();
}

class CollectionItemViewState extends State<CollectionItem> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = (screenSize.width - 52) / 2;

    return Container(
      width: width,
      height: width + 24,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: ColorPallette.colorMix(context, 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        onLongPress: () {
          if (widget.onLongPress != null) {
            widget.onLongPress!();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)), // 设置足够大的圆角半径
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl,
                width: width,
                height: width - 26,
                fit: BoxFit.cover,
              )
            ),
            Container(
              width: width,
              padding: const EdgeInsets.only(top: 6, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, maxLines: 1, style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis)),
                  const SizedBox(height: 2),
                  Text("by ${widget.author}", maxLines: 1, style: const TextStyle(fontSize: 10, color: Colors.grey, overflow: TextOverflow.ellipsis))
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}