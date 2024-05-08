import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/blocs/profile/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/profile/event.dart';
import 'package:sourcerers_forge/domains/blocs/profile/state.dart';
import 'package:sourcerers_forge/models/profile_model.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_textfield.dart';
import 'package:sourcerers_forge/presentation/profile_screen/provider/profile_provider.dart';

@RoutePage()
class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<ProfileBloc>().add(LoadProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ProfileProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Данные',
          style: AppText.heading,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
        if (state is LoadedProfileState) {
          read.updateData(state.profiledata);
        }
      }, builder: (context, state) {
        if (state is LoadingProfileState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'фамилия:',
                      style: AppText.heading,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                      hintText: 'Иванов',
                      controller: read.lastnameController,
                      validator: (value) => read.validateFIO(value, false),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Имя:',
                      style: AppText.heading,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                      hintText: 'Иван',
                      controller: read.nameController,
                      validator: (value) => read.validateFIO(value, true),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Отчество:',
                      style: AppText.heading,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                      hintText: 'Иванович',
                      controller: read.patronymicController,
                      validator: (value) => read.validateFIO(value, false),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Номер телефона:',
                      style: AppText.heading,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                      controller: read.contactController,
                      hintText: '+7 (777) 777-77-77',
                      formattes: [read.maskFormatter],
                      textInputType: TextInputType.phone,
                      validator: (value) => read.validatePhoneNumber(value),
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                  ]),
            ),
          ),
        );
      }),
      bottomSheet: Container(
        color: AppColors.background,
        height: 120.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
          child: CustomButton(
            ontap: () {
              if (_formkey.currentState!.validate()) {
                context.read<ProfileBloc>().add(UpdateProfileEvent(
                    profileModel: ProfileModel(
                        contact: read.contactController.text,
                        name: read.nameController.text,
                        patronymic: read.patronymicController.text,
                        surname: read.lastnameController.text)));
              }
            },
            title: 'Сохранить',
            width: 175,
          ),
        ),
      ),
    );
  }
}
