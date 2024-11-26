// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ImageProductComponent extends StatelessWidget {
  late String linkFtp;
  ImageProductComponent({super.key, required this.linkFtp});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox.fromSize(
        size: const Size(200, 120),
        child: Image.network(
          linkFtp,
          fit: BoxFit.cover,
        ),
      )
    );
  }
}
