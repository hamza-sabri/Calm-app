class ImagePicker {
  final pathRoot = 'lib';
  final imagesFile = 'images';

  String imageChooserJPG(String imageName) {
    return '$pathRoot/$imagesFile/$imageName.jpg';
  }

  String imageChooserGIF(String imageName) {
    return '$pathRoot/$imagesFile/$imageName.gif';
  }

  String imageChooserPNG(String imageName) {
    return '$pathRoot/$imagesFile/$imageName.png';
  }
}
