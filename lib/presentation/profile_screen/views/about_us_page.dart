import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'О нас',
          style: AppText.heading,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                'Наш сайт: ',
                style: AppText.title.copyWith(fontSize: 16.sp),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => _launchUrl('http://95.165.64.208:3333/'),
                child: Text('Открыть в браузере',
                    style:
                        AppText.title.copyWith(color: AppColors.activeColor)),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Тех.поддержка: ',
            style: AppText.heading.copyWith(fontSize: 18.sp),
          ),
          Row(
            children: [
              const Text('Номер: '),
              const Spacer(),
              TextButton(
                onPressed: () => _launchDialer('+79222221133'),
                child: Text('+79222221133',
                    style:
                        AppText.title.copyWith(color: AppColors.activeColor)),
              )
            ],
          ),
          Row(
            children: [
              const Text('Почта: '),
              const Spacer(),
              TextButton(
                onPressed: () => _launchEmailClient('forgesorcerers@gmail.com'),
                child: Text('forgesorcerers@gmail.com',
                    style:
                        AppText.title.copyWith(color: AppColors.activeColor)),
              )
            ],
          )
        ]),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw 'Could not launch $urlString';
    }
  }

  Future<void> _launchDialer(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (!await launchUrl(phoneUri)) {
      throw 'Could not launch $phoneUri';
    }
  }

  Future<void> _launchEmailClient(String emailAddress) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
    if (!await launchUrl(emailUri)) {
      throw 'Could not launch $emailUri';
    }
  }
}
