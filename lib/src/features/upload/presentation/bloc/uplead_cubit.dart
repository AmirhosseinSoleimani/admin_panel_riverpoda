import 'dart:io';
import 'dart:typed_data';
import 'package:admin_panel/src/features/upload/domain/entity/all_content_entity.dart';
import 'package:admin_panel/src/features/upload/domain/repository/all_content_repository.dart';
import 'package:admin_panel/src/features/upload/domain/repository/update_content_repository.dart';
import 'package:admin_panel/src/features/upload/domain/repository/upload_video_repository.dart';
import 'package:admin_panel/src/features/upload/presentation/bloc/upload_state.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadCubit extends Cubit<UploadState> {

  final GetAllContentRepository getAllContentRepository;
  final PutContentRepository putContentRepository;
  UploadRepository uploadRepository;

  UploadCubit(this.getAllContentRepository, this.putContentRepository, this.uploadRepository) : super(const UploadState.idle());



  static String url = '';
  static String title = '';
  static String description = '';
  static String id = '';


  TextEditingController videoTitle = TextEditingController();
  TextEditingController videoDescription = TextEditingController();


  List<AllContentEntity> listAllContents = [];

  Future getAllContent() async{
    listAllContents.clear();
    emit(const UploadState.loading());
    final result = await getAllContentRepository.getAllContent();
    result.whenOrNull(
      success: (data) {
        for(var i in data) {
          listAllContents.add(i);
        }
        emit(const UploadState.success());
      },
      failure: (error) {
        emit(UploadState.error(errorMessage: error ?? ''));
      },
    );
  }

  Future updateContent(String title, String description) async{
    emit(const UploadState.updateContentLoading());
    final result = await putContentRepository.updateContent(title: title, description: description, id: id);
    result.whenOrNull(
      success: (data) {
        getAllContent();
      },
      failure: (error) {
        emit(UploadState.error(errorMessage: error ?? ''));
      },
    );
  }

  Uint8List? videoPath;
  bool videoUploaded = false;

  bool imageUploaded = false;
  Uint8List? imageBytes;

  Future<void> pickVideo() async {
    emit(const UploadState.pickedVideoLoading(0));
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if (result != null) {
      videoUploaded = true;
      videoPath = result.files.single.bytes;
      emit(const UploadState.pickedVideoSuccess());
    }
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      imageUploaded = true;
      imageBytes = result.files.single.bytes;
    }
  }


  Future<void> uploadVideo() async {
    if (videoPath != null && imageBytes != null) {
      String fileName = 'video.mp4';
      String imageName = 'image.jpg';
      FormData formData = FormData.fromMap({
        "title": videoTitle.text,
        "description": videoDescription.text,
        "author_id": 1,
        "author_name": "soroush",
        "category_id": 2,
        "video": MultipartFile.fromBytes(videoPath!, filename: fileName),
        "image": MultipartFile.fromBytes(imageBytes!, filename: imageName),
      });
      emit(const UploadState.uploadVideoLoading(0));
      final result = await uploadRepository.uploadVideo(
          formData: formData,
          onSendProgress: (int sent, int total) {
            double progress = sent / total;
            emit(UploadState.uploadVideoLoading(progress));
          });
      result.whenOrNull(
        success: (data) {
          emit(const UploadState.uploadVideoSuccess());
        },
        failure: (error) {
          emit(UploadState.error(errorMessage: error ?? ''));
        },
      );
    }
  }
}