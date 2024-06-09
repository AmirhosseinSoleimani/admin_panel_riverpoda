
import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_state.freezed.dart';

@freezed
class UploadState with _$UploadState {

  const factory UploadState.idle() = UploadStateIdle;

  const factory UploadState.error({required String errorMessage}) = UploadStateError;

  const factory UploadState.success() = UploadStateSuccess;

  const factory UploadState.loading() = UploadStateLoading;

  const factory UploadState.addContentSuccess() = UploadStateAddContentSuccess;

  const factory UploadState.addContentLoading() = UploadStateAddContentLoading;

  const factory UploadState.deleteContentSuccess() = UploadStateDeleteContentSuccess;

  const factory UploadState.deleteContentLoading() = UploadStateDeleteContentLoading;
  //
  const factory UploadState.updateContentSuccess() = UploadStateUpdateContentSuccess;

  const factory UploadState.updateContentLoading() = UploadStateUpdateContentLoading;

  const factory UploadState.pickedVideoSuccess() = UploadStatePickedVideoSuccess;

  const factory UploadState.pickedVideoLoading(double progress) = UploadStatePickedVideoLoading;

  const factory UploadState.pickedImageSuccess() = UploadStatePickedImageSuccesss;

  const factory UploadState.pickedImageLoading(double progress) = UploadStatePickedImageLoading;


  const factory UploadState.uploadVideoSuccess() = UploadStateUploadVideoSuccess;

  const factory UploadState.uploadVideoLoading(double progress) = UploadStateUploadVideoLoading;

}