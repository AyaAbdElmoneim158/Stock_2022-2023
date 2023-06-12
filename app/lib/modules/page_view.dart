import 'package:app/modules/table_test.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';

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

class TestPageView extends StatelessWidget {
  const TestPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red.withOpacity(0.3),
          height: 300,
          child: PageView(reverse: true, children: [
            Center(
                child: Row(
              children: [
                Text("page1"),
              ],
            )),
            Center(
                child: HorizontalDataTable(
              leftHandSideColumnWidth: 100,
              rightHandSideColumnWidth: 600,
              tableHeight: 110,
              isFixedHeader: true,
              // isFixedFooter: true,
              //! *************************************************************
              headerWidgets: l2
                  .map((e) => Container(
                        width: 150,
                        height: 56,
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(e,
                            // DateFormat.yMMMEd().format(e),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ))
                  .toList(),
              // .insert(0, 'Date'),
              // _getTitleWidget(),
              // footerWidgets: _getTitleWidget(),
              leftSideItemBuilder: (context, index) => Container(
                width: 100,
                height: 52,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: const Text("Predection"),
              ),
              rightSideItemBuilder: (context, index) => SizedBox(
                width: 600,
                height: 52,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3, //appCubit.days.length,
                  itemBuilder: (context, index) => Container(
                      width: 150,
                      height: 56,
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Align(child: Text("Col.$index }"))),
                ),
              ),

              //! *************************************************************
// data
              itemCount: 1, //widget.user.userInfo.length,

              rowSeparatorWidget: const Divider(
                color: Colors.black38,
                height: 1.0,
                thickness: 0.0,
              ),
              leftHandSideColBackgroundColor: Color.fromARGB(255, 144, 52, 52),
              rightHandSideColBackgroundColor:
                  Color.fromARGB(90, 255, 255, 255),
              // itemExtent: 55,
            ))
          ]),
        ),
      ),
    );
  }
}
