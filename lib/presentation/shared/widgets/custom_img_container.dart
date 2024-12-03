import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType {
  svg,
  others
}

class CustomImgContainer extends StatefulWidget {
  final double width;
  final double? height;
  final String? imageUrl;
  const CustomImgContainer({
    super.key,
    this.width = 25,
    this.height,
    this.imageUrl
  });

  @override
  State<CustomImgContainer> createState() => _CustomImgContainerState();
}


class _CustomImgContainerState extends State<CustomImgContainer> {

  ImageType currentImage = ImageType.svg;

  ImageType getImgaTypeByUrl(String imageUrl){
    final String imageExtension = imageUrl.split('.').last;

    if(imageExtension.toLowerCase().contains('svg')){
      return ImageType.svg;
    }
    return ImageType.others;
  }

  @override
  void initState() {
    currentImage = getImgaTypeByUrl(widget.imageUrl!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: currentImage == ImageType.svg 
      ? SvgPicture.network(widget.imageUrl!, width: widget.width,)
      : Image.network(widget.imageUrl!, width: widget.width,),
    );
  }
}