// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/modules/Design/Details/componets_details.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class DesignDetails extends StatelessWidget {
  const DesignDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: detailsAppBar(context),
      body: const DetailsBody(),
    );
  }
}
