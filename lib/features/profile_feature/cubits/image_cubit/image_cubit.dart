import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(const ImageInitial(image: null));
  static ImageCubit get(context) => BlocProvider.of(context);

  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        emit(PickImageFromGallerySuccessState(image: File(image.path)));
      }
    } catch (error) {
      emit(PickImageErrorState(error: error.toString()));
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        emit(PickImageFromGallerySuccessState(image: File(image.path)));
      }
    } catch (error) {
      emit(PickImageErrorState(error: error.toString()));
    }
  }







}
