import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_text_styles.dart';
import '../bloc/home_bloc.dart';

import '../bloc/home_state.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 70,
    ); if (picked == null) return null;
    return File(picked.path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Main', style: AppTextStyles.screenTitle),
              Row(
                children: [



                ],
              ),
            ],
          ),

          SizedBox(height: 40.h),

          Expanded(
            child: Center(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeInitial) {
                    return const Text("Сделайте фото товара");
                  }
      
                  if (state is HomeLoading) {
                    return const CircularProgressIndicator();
                  }
      
                  if (state is HomeSuccess) {

                    return Text(
                      "Результат: ${state.productName}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
      
                  if (state is HomeError) {
                    return Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    );
                  }
      
                  return const SizedBox();
                },
              ),
            ),
          ),
      
          // 💥 FAB заменяем обычной кнопкой внутри вкладки
          Padding(
            padding: const EdgeInsets.only(bottom: 124.0),
            child: FloatingActionButton(
              onPressed: () async {
                final file = await pickImage();
                if (file == null) return;

              },
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
    );
  }
}
