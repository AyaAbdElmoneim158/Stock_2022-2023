class SalesData {
  final String month;
  final double sales;
  SalesData(this.month, this.sales);
}

class BarChart {
  final String name;
  final List<SalesData> data;
  BarChart(this.name, this.data);
}
