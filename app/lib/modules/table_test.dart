//***************************************************************
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

List l1 = [
  '43.712117094885734',
  "43.71214569060417",
  "43.71215677091467",
  '43.71216106432947',
  '43.712162727948076',
  '43.71216337256943',
  '43.71216362234824'
];
List l2 = [
  "2023-06-11 11:43:40.534",
  "2023-06-12 11:43:40.534",
  "2023-06-13 11:43:40.534",
  "2023-06-14 11:43:40.534",
  "2023-06-15 11:43:40.534",
  "2023-06-16 11:43:40.534",
  "2023-06-17 11:43:40.534"
];

class TableTest extends StatelessWidget {
  TableTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..fetchPridictionData(ramz: 'abuk'),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final appCubit = AppCubit.get(context);
            // var predictions = appCubit.data;
            // var dates = appCubit.days;

            // debugPrint(appCubit.data.toString());
            // debugPrint(appCubit.days.toString());

            return ConditionalBuilder(
              condition: true, //predictions.isNotEmpty && dates.isNotEmpty,
              builder: (context) => SingleChildScrollView(
                child: Row(
                  children: [
                    const FixedColumnWidget(),
                    // ScrollableColumnWidget(
                    //     dates: dates, predictions: predictions),
                  ],
                ),
              ),
              fallback: (context) => Container(
                  color: Colors.white,
                  child: Center(
                      child: Center(child: Image.asset('assets/ripple.gif')))),
            );
          }),
    );
  }
}

//~> FixedColumnWidget ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class FixedColumnWidget extends StatelessWidget {
  const FixedColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 10,
      headingRowColor: MaterialStateProperty.all(ksecondaryColor),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
      columns: [
// ! Date -------------------------------------------------------------
        DataColumn(
            label: Text(
          'Date',
          style: Theme.of(context).textTheme.titleLarge,
        )),
      ],
// ! Prediction -------------------------------------------------------------
      rows: [
        DataRow(
          cells: [
            DataCell(Text(
              'Prediction',
              style: Theme.of(context).textTheme.titleLarge,
            )),
          ],
        )
      ],
    );
  }
}

//~> ScrollableColumnWidget ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ScrollableColumnWidget extends StatelessWidget {
  List<DateTime> dates;
  List<dynamic> predictions;
  ScrollableColumnWidget(
      {super.key, required this.dates, required this.predictions});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(ksecondaryColor),
          columnSpacing: 40,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
// ! list of dates -------------------------------------------------------------

          columns: dates
              .map((e) => DataColumn(
                      label: Text(
                    DateFormat.yMMMEd().format(e),
                    // e.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  )))
              .toList(),

// ! list of Prediction -------------------------------------------------------------

          rows: [
            DataRow(
                cells: predictions
                    .map((e) => DataCell(Directionality(
                          textDirection: ui.TextDirection.ltr,
                          child: Text(
                            // toStringAsFixed(3)
                            e.toStringAsFixed(3).toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )))
                    .toList())
          ],
        ),
      ),
    );
  }
}
