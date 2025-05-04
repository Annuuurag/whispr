import 'dart:ffi';

class AssetsImage {
  static const iconsPath = "assets/Icons";
  static const imagesPath = "assets/Images";

  static const DefaultProfileUrl =
      "https://firebasestorage.googleapis.com/v0/b/whispr-8af87.firebasestorage.app/o/boy_pic.png?alt=media&token=f9e118e7-1982-4170-8285-bb8d8cd65d6b";

  //SVG icons
  static const appIconSVG = "$iconsPath/app.svg";
  static const connectSVG = "$iconsPath/connect.svg";
  static const plugSVG = "$iconsPath/plug.svg";

  static const profileVideoCall = "$iconsPath/videoCall.svg";

  static const profileAudioCall = "$iconsPath/call.svg";

  //static const chatGallerySvg = "$iconsPath/gallery.svg";

  //static const chatMicSvg = "$iconsPath/mic.svg";

  // png images
  static const boyPic = "$imagesPath/boy_pic.png";
  static const girlPic = "$imagesPath/girl_pic.png";

  static const chatStatusSvg = "$iconsPath/chat_status.svg";
  static const chatSendSvg = "$iconsPath/send.svg";
  static const chatGallerySvg = "$iconsPath/gallery.svg";
  static const chatMicSvg = "$iconsPath/mic.svg";
}
