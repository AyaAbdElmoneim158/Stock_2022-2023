import 'package:flutter/material.dart';
import 'package:app/shared/styles/size_config.dart';
import 'package:skeletons/skeletons.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(color: Colors.white),
          child: SkeletonItem(
              child: Column(
            children: [
              const SizedBox(height: 12),
              SkeletonAvatar(
                style: SkeletonAvatarStyle(
                  width: double.infinity,
                  minHeight: MediaQuery.of(context).size.height / 8,
                  maxHeight: MediaQuery.of(context).size.height / 3,
                ),
              ),
              // SkeletonParagraph(
              //   style: SkeletonParagraphStyle(
              //       lines: 1,
              //       spacing: 6,
              //       lineStyle: SkeletonLineStyle(
              //         // randomLength: true,
              //         height: 10,
              //         borderRadius: BorderRadius.circular(8),
              //         minLength: MediaQuery.of(context).size.width / 2,
              //       )),
              // ),
              // const SizedBox(height: 12),
            ],
          )),
        ),
      ),
    ));
  }
}
