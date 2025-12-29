import 'package:flutter/cupertino.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.network("https://picsum.photos/id/852/400/320"),
    );
  }
}
