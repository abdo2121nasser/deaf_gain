part of 'image_cubit.dart';

@immutable
sealed class ImageState {
  final File? image;
  const ImageState({this.image});
}

final class ImageInitial extends ImageState {
  const ImageInitial({required image}) : super(image: null);
}

final class PickImageFromGallerySuccessState extends ImageState {
  const PickImageFromGallerySuccessState({required File image})
      : super(image: image);
}

final class PickImageErrorState extends ImageState {
  final String error;
  PickImageErrorState({required this.error}) : super(image: null) {
    debugPrint(error);
  }
}

// final class SetDetectedImageState extends ImageState {
//   SetDetectedImageState({required super.image});
// }
//
final class UploadImageLoadingState extends ImageState {
  const UploadImageLoadingState({required super.image});
}

final class UploadImageSuccessState extends ImageState {
  final String imageLink;

  const UploadImageSuccessState(
      {required this.imageLink, required super.image});
}

final class UploadImageErrorState extends ImageState {
  final String error;
  UploadImageErrorState({required this.error}) : super(image: null) {
    debugPrint(error);
  }
}

final class DownloadImageLoadingState extends ImageState {
  const DownloadImageLoadingState({required super.image});
}

final class DownloadImageSuccessState extends ImageState {
  const DownloadImageSuccessState({required super.image});
}

final class DownloadImageErrorState extends ImageState {
  final String error;
  DownloadImageErrorState({required this.error}) : super(image: null) {
    debugPrint(error);
  }
}

final class DeleteImageLoadingState extends ImageState {
  const DeleteImageLoadingState();
}

final class DeleteImageSuccessState extends ImageState {
  const DeleteImageSuccessState();
}

final class DeleteImageErrorState extends ImageState {
  final String error;
  DeleteImageErrorState({required this.error}) : super(image: null) {
    debugPrint(error);
  }
}
