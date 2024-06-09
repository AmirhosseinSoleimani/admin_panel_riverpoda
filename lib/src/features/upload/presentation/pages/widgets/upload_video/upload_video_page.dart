import 'package:admin_panel/src/di/di_setup.dart';
import 'package:admin_panel/src/features/features.dart';
import 'package:admin_panel/src/features/upload/presentation/bloc/uplead_cubit.dart';
import 'package:admin_panel/src/features/upload/presentation/bloc/upload_state.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ui_kits.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class UploadVideoPage extends StatefulWidget {
  const UploadVideoPage({super.key});

  @override
  State<UploadVideoPage> createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {

  bool imageUploaded = false;

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (BuildContext context) {
        var bloc = getIt<UploadCubit>();
        return bloc;
      },
      child: BlocConsumer<UploadCubit, UploadState>(
        listener: (BuildContext context, UploadState state) {
          state.whenOrNull(uploadVideoSuccess: () {
            context.go(UploadPage.uploadPageName);
          });
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  BlocBuilder<UploadCubit, UploadState>(
                    builder: (BuildContext context, state) {
                      return state.whenOrNull(
                        pickedVideoLoading: (progress) {
                          return Expanded(
                            child: InkWell(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppSize.s2,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                                    borderRadius:
                                    BorderRadius.circular(AppSize.s12)),
                                child: const Center(
                                  child: ACLoading(),
                                ),
                              ),
                            ),
                          );
                        },
                        pickedVideoSuccess: () {
                          return Expanded(
                            child: InkWell(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppSize.s2,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                                    borderRadius:
                                    BorderRadius.circular(AppSize.s12)),
                                child: const Center(child: Icon(Icons.check, color: Colors.green,)
                                  // VideoPlayerScreen(videoBytes: context.read<UploadCubit>().videoPath!,),
                                ),
                              ),
                            ),
                          );
                        },
                      ) ?? Expanded(
                        child: InkWell(
                          onTap: () =>
                              context.read<UploadCubit>().pickVideo(),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: AppSize.s2,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary),
                                borderRadius:
                                BorderRadius.circular(AppSize.s12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(IconManager.uploadFill,
                                    size: AppSize.s42,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary),
                                Text(
                                  textLocalization.selectVideo,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Space.h16,
                  imageUploaded ?
                  Expanded(
                    child: InkWell(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: AppSize.s2,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondary),
                            borderRadius:
                            BorderRadius.circular(AppSize.s12)),
                        child: Image.memory(
                          context.read<UploadCubit>().imageBytes!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ) : Expanded(
                    child: InkWell(
                      onTap: () async{
                        FilePickerResult? result = await FilePicker.platform.pickFiles(
                          type: FileType.image,
                        );
                        if (result != null) {
                          imageUploaded = true;
                          context.read<UploadCubit>().imageBytes = result.files.single.bytes;
                          setState(() {});
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: AppSize.s2,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondary),
                            borderRadius:
                            BorderRadius.circular(AppSize.s12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(IconManager.uploadFill,
                                size: AppSize.s42,
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiary),
                            Text(
                              textLocalization.addPhoto,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              textLocalization.acceptedFormatesImage,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Space.h16,
                  ACTextFormField(
                      controller: context.read<UploadCubit>().videoTitle,
                      hintText: textLocalization.title),
                  Space.h16,
                  ACTextFormField(
                    controller: context.read<UploadCubit>().videoDescription,
                    hintText: textLocalization.description,
                    maxLines: 6,
                  ),
                  Space.h16,
                  BlocBuilder<UploadCubit, UploadState>(
                    builder: (BuildContext context, UploadState state) {
                      return state.whenOrNull(
                            uploadVideoLoading: (progress) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: AppPadding.p8,
                                        horizontal: AppPadding.p16),
                                    child: Column(
                                      children: [
                                        CircularProgressIndicator(
                                          value: progress,
                                        ),
                                        Space.h4,
                                        Text(
                                            '${(progress * 100).toStringAsFixed(0)}%'),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ) ??
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: ACElevatedButton(
                              onTap: () {
                                context.read<UploadCubit>().uploadVideo();
                              },
                              title: textLocalization.upload,
                            ),
                          );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
