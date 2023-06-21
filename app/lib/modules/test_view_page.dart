// import 'package:app/models/sales_data_model.dart';
import 'package:app/models/sales_data_model.dart';
import 'package:app/modules/Navbar_pages/new_dash.dart';
import 'package:app/modules/test_chart.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class TestViewPage extends StatelessWidget {
  const TestViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DetailsChartDesign(),
      ),
    );
  }

// ToDo~> customStockCard >==========================================================<
  Padding customStockCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.firstColor.withOpacity(0.1),
              backgroundImage: const NetworkImage('stockAtSector.logo')),
          const SizedBox(width: 16),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('ACGC',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.textColor, fontWeight: FontWeight.w400)),
              Text('العربيه لخليج الاقطان',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.firstColor,
                      fontWeight: FontWeight.w500)),
            ]),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text("45.34",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400)),
                  Text(" EGP",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400))
                ],
              ),
              Text(
                "4.3",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400, color: AppColors.textColor),
              ),
            ],
          ),
          const SizedBox(width: 16),
          const Icon(
            Icons.bookmark,
            size: 30,
          )
        ],
      ),
    );
  }
}

// ToDo~> DetailsChartDesign >==========================================================<
class DetailsChartDesign extends StatefulWidget {
  const DetailsChartDesign({
    super.key,
  });

  @override
  State<DetailsChartDesign> createState() => _DetailsChartDesignState();
}

class _DetailsChartDesignState extends State<DetailsChartDesign> {
  @override
  Widget build(BuildContext context) {
    String price = '0 EGp'; // get from Api details
    String change1 = '0.01 EGp';
    String change2 = '4.4%';
    String date = 'Thu 09 Feb 090 Am';
    int currentIndex = 4;

    return Column(
      children: [
        const SizedBox(height: 23),

        // part up.........................
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.firstColor.withOpacity(0.1),
                      backgroundImage:
                          const NetworkImage('stockAtSector.logo')),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ACGC',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w400)),
                          Text('العربيه لخليج الاقطان',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: AppColors.firstColor,
                                      fontWeight: FontWeight.w500)),
                        ]),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("EGP ",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600)),
                  // toDo ~> change ... setState
                  Text(price,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600)),
                  // toDo ~> change ...setState
                  Text(date,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kTextColor,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text("EGP ",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500)),
                  // toDo ~> change ...setState
                  Text(
                    change1,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor),
                  ),
                  const SizedBox(width: 8),
                  Text("%",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w700)),
                  // toDo ~> change ...setState
                  Text(
                    change2,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        // chart part .........................
        Column(
          children: [
            chartWithLine2(
              groupsData: divideData,
              chartName: 'Divide',
              dataSourceLine: [
                SalesData('2000', 200),
                SalesData('2001', 21),
                SalesData('2002', 22),
                SalesData('2003', 200),
                SalesData('2004', 2004),
                SalesData('2005', 205),
                SalesData('2006', 76),
                SalesData('2007', 47),
                SalesData('2008', 28),
                SalesData('2009', 239),
                SalesData('2010', 20),
                SalesData('2011', 41),
                SalesData('2012', 12),
                SalesData('2013', 3),
                SalesData('2014', 24),
                SalesData('2015', 45),
                SalesData('2016', 216),
                SalesData('2017', 217),
                SalesData('2018', 218),
                SalesData('2019', 219),
              ],
            ),
            AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                // height: MediaQuery.of(context).size.height * 0.02,
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 5;
                          // appCubit.fetchStockTimeline(
                          //     period: 1825, ramz: widget.ramz);
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == 5
                              ? const Color(0xff161b22)
                              : const Color(0xff161b22).withOpacity(0.0),
                        ),
                        child: Text(
                          "5Y",
                          style: TextStyle(
                              color: currentIndex == 5
                                  ? Colors.blueGrey.shade200
                                  : Colors.blueGrey,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 4;
                          // appCubit.fetchStockTimeline(
                          //     period: 360, ramz: widget.ramz);
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == 4
                              ? const Color(0xff161b22)
                              : const Color(0xff161b22).withOpacity(0.0),
                        ),
                        child: Text(
                          "1Y",
                          style: TextStyle(
                              color: currentIndex == 4
                                  ? Colors.blueGrey.shade200
                                  : Colors.blueGrey,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 3;
                          // appCubit.fetchStockTimeline(
                          //     period: 180, ramz: widget.ramz);
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: currentIndex == 3
                              ? AppColors.kPrimaryColor
                              : Colors.grey.shade200,
                        ),
                        child: Text(
                          "6M",
                          style: TextStyle(
                              color: currentIndex == 3
                                  ? Colors.blueGrey.shade200
                                  : Colors.blueGrey,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 2;
                          // appCubit.fetchStockTimeline(
                          //     period: 30, ramz: widget.ramz);
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == 2
                              ? const Color(0xff161b22)
                              : const Color(0xff161b22).withOpacity(0.0),
                        ),
                        child: Text(
                          "1M",
                          style: TextStyle(
                              color: currentIndex == 2
                                  ? Colors.blueGrey.shade200
                                  : Colors.blueGrey,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 1;
                          // appCubit.fetchStockTimeline(period: 7, ramz: widget.ramz);
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == 1
                              ? const Color(0xff161b22)
                              : const Color(0xff161b22).withOpacity(0.0),
                        ),
                        child: Text(
                          "1W",
                          style: TextStyle(
                              color: currentIndex == 1
                                  ? Colors.blueGrey.shade200
                                  : Colors.blueGrey,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }
}
