//----------------------------------------------------------------------------
// import 'package:app/models/sales_data_model.dart';

// import 'package:app/modules/more_charts.dart';
/*import 'package:app/models/stock_model.dart';

class StockChartModel {
  IncomeStatement? incomeStatement;
  BalanceSheet? balanceSheet;
  CashFlow? cashFlow;
  Dividends? dividends;
  DividenedPayoutHistory? dividenedPayoutHistory;
  Revenue? revenue;
  Earning? earning;

  StockChartModel(
      {this.incomeStatement,
      this.balanceSheet,
      this.cashFlow,
      this.dividends,
      this.dividenedPayoutHistory,
      this.revenue,
      this.earning});

  StockChartModel.fromJson(Map<String, dynamic> json) {
    incomeStatement = json['income_statement'] != null
        ? new IncomeStatement.fromJson(json['income_statement'])
        : null;
    balanceSheet = json['balance_sheet'] != null
        ? new BalanceSheet.fromJson(json['balance_sheet'])
        : null;
    cashFlow = json['cash_flow'] != null
        ? new CashFlow.fromJson(json['cash_flow'])
        : null;
    dividends = json['dividends'] != null
        ? new Dividends.fromJson(json['dividends'])
        : null;
    dividenedPayoutHistory = json['dividened_payout_history'] != null
        ? new DividenedPayoutHistory.fromJson(json['dividened_payout_history'])
        : null;
    revenue =
        json['revenue'] != null ? new Revenue.fromJson(json['revenue']) : null;
    earning =
        json['earning'] != null ? new Earning.fromJson(json['earning']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.incomeStatement != null) {
      data['income_statement'] = this.incomeStatement!.toJson();
    }
    if (this.balanceSheet != null) {
      data['balance_sheet'] = this.balanceSheet!.toJson();
    }
    if (this.cashFlow != null) {
      data['cash_flow'] = this.cashFlow!.toJson();
    }
    if (this.dividends != null) {
      data['dividends'] = this.dividends!.toJson();
    }
    if (this.dividenedPayoutHistory != null) {
      data['dividened_payout_history'] = this.dividenedPayoutHistory!.toJson();
    }
    if (this.revenue != null) {
      data['revenue'] = this.revenue!.toJson();
    }
    if (this.earning != null) {
      data['earning'] = this.earning!.toJson();
    }
    return data;
  }
}

class IncomeStatement {
  List<String>? header;
  List<String>? totalRevenue;
  List<String>? costOfGoodsSold;
  List<String>? grossProfit;
  List<String>? operatingExpenses;
  List<String>? operatingIncome;
  List<String>? nonOperatingIncome;
  List<String>? pretaxIncome;
  List<String>? equityInEarnings;
  List<String>? taxes;
  List<String>? nonControllingMinorityInterest;
  List<String>? afterTaxOtherIncomeExpense;
  List<String>? netIncomeBeforeDiscontinuedOperations;
  List<String>? discontinuedOperations;
  List<String>? netIncome;
  List<String>? dilutionAdjustment;
  List<String>? preferredDividends;
  List<String>? dilutedNetIncomeAvailableToCommonStockholders;
  List<String>? basicEPS;
  List<String>? dilutedEPS;
  List<String>? averageBasicSharesOutstanding;
  List<String>? dilutedSharesOutstanding;
  List<String>? eBITDA;
  List<String>? eBIT;
  List<String>? totalOperatingExpenses;

  IncomeStatement(
      {this.header,
      this.totalRevenue,
      this.costOfGoodsSold,
      this.grossProfit,
      this.operatingExpenses,
      this.operatingIncome,
      this.nonOperatingIncome,
      this.pretaxIncome,
      this.equityInEarnings,
      this.taxes,
      this.nonControllingMinorityInterest,
      this.afterTaxOtherIncomeExpense,
      this.netIncomeBeforeDiscontinuedOperations,
      this.discontinuedOperations,
      this.netIncome,
      this.dilutionAdjustment,
      this.preferredDividends,
      this.dilutedNetIncomeAvailableToCommonStockholders,
      this.basicEPS,
      this.dilutedEPS,
      this.averageBasicSharesOutstanding,
      this.dilutedSharesOutstanding,
      this.eBITDA,
      this.eBIT,
      this.totalOperatingExpenses});

  IncomeStatement.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    totalRevenue = json['total_revenue'].cast<String>();
    costOfGoodsSold = json['cost_of_goods_sold'].cast<String>();
    grossProfit = json['gross_profit'].cast<String>();
    operatingExpenses = json['operating_expenses'].cast<String>();
    operatingIncome = json['operating_income'].cast<String>();
    nonOperatingIncome = json['nonOperating_income'].cast<String>();
    pretaxIncome = json['pretax_income'].cast<String>();
    equityInEarnings = json['equity_in_earnings'].cast<String>();
    taxes = json['taxes'].cast<String>();
    nonControllingMinorityInterest =
        json['nonControllingMinority_interest'].cast<String>();
    afterTaxOtherIncomeExpense =
        json['after_tax_other_income_expense'].cast<String>();
    netIncomeBeforeDiscontinuedOperations =
        json['net_income_before_discontinued_operations'].cast<String>();
    discontinuedOperations = json['discontinued_operations'].cast<String>();
    netIncome = json['net_income'].cast<String>();
    dilutionAdjustment = json['dilution_adjustment'].cast<String>();
    preferredDividends = json['preferred_dividends'].cast<String>();
    dilutedNetIncomeAvailableToCommonStockholders =
        json['diluted_net_income_available_to_common_stockholders']
            .cast<String>();
    basicEPS = json['basic_EPS'].cast<String>();
    dilutedEPS = json['diluted_EPS'].cast<String>();
    averageBasicSharesOutstanding =
        json['average_basic_shares_outstanding'].cast<String>();
    dilutedSharesOutstanding =
        json['diluted_shares_outstanding'].cast<String>();
    eBITDA = json['EBITDA'].cast<String>();
    eBIT = json['EBIT'].cast<String>();
    totalOperatingExpenses = json['total_operating_expenses'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['total_revenue'] = this.totalRevenue;
    data['cost_of_goods_sold'] = this.costOfGoodsSold;
    data['gross_profit'] = this.grossProfit;
    data['operating_expenses'] = this.operatingExpenses;
    data['operating_income'] = this.operatingIncome;
    data['nonOperating_income'] = this.nonOperatingIncome;
    data['pretax_income'] = this.pretaxIncome;
    data['equity_in_earnings'] = this.equityInEarnings;
    data['taxes'] = this.taxes;
    data['nonControllingMinority_interest'] =
        this.nonControllingMinorityInterest;
    data['after_tax_other_income_expense'] = this.afterTaxOtherIncomeExpense;
    data['net_income_before_discontinued_operations'] =
        this.netIncomeBeforeDiscontinuedOperations;
    data['discontinued_operations'] = this.discontinuedOperations;
    data['net_income'] = this.netIncome;
    data['dilution_adjustment'] = this.dilutionAdjustment;
    data['preferred_dividends'] = this.preferredDividends;
    data['diluted_net_income_available_to_common_stockholders'] =
        this.dilutedNetIncomeAvailableToCommonStockholders;
    data['basic_EPS'] = this.basicEPS;
    data['diluted_EPS'] = this.dilutedEPS;
    data['average_basic_shares_outstanding'] =
        this.averageBasicSharesOutstanding;
    data['diluted_shares_outstanding'] = this.dilutedSharesOutstanding;
    data['EBITDA'] = this.eBITDA;
    data['EBIT'] = this.eBIT;
    data['total_operating_expenses'] = this.totalOperatingExpenses;
    return data;
  }
}

class BalanceSheet {
  List<String>? header;
  List<String>? totalAssets;
  List<String>? totalLiabilities;
  List<String>? totalEquity;
  List<String>? totalLiabilitiesAndShareholders;
  List<String>? totalDebt;
  List<String>? netDebt;
  List<String>? bookValuePerShare;

  BalanceSheet(
      {this.header,
      this.totalAssets,
      this.totalLiabilities,
      this.totalEquity,
      this.totalLiabilitiesAndShareholders,
      this.totalDebt,
      this.netDebt,
      this.bookValuePerShare});

  BalanceSheet.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    totalAssets = json['total_assets'].cast<String>();
    totalLiabilities = json['total_liabilities'].cast<String>();
    totalEquity = json['total_equity'].cast<String>();
    totalLiabilitiesAndShareholders =
        json['total_liabilities_and_shareholders'].cast<String>();
    totalDebt = json['total_debt'].cast<String>();
    netDebt = json['net_debt'].cast<String>();
    bookValuePerShare = json['book_value_per_share'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['total_assets'] = this.totalAssets;
    data['total_liabilities'] = this.totalLiabilities;
    data['total_equity'] = this.totalEquity;
    data['total_liabilities_and_shareholders'] =
        this.totalLiabilitiesAndShareholders;
    data['total_debt'] = this.totalDebt;
    data['net_debt'] = this.netDebt;
    data['book_value_per_share'] = this.bookValuePerShare;
    return data;
  }
}

class CashFlow {
  List<String>? header;
  List<String>? cashFromOperatingActivity;
  List<String>? cashFromInvestingActivity;
  List<String>? cashFromFinancingActivity;
  List<String>? freeCashFlow;

  CashFlow(
      {this.header,
      this.cashFromOperatingActivity,
      this.cashFromInvestingActivity,
      this.cashFromFinancingActivity,
      this.freeCashFlow});

  CashFlow.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    cashFromOperatingActivity =
        json['cash_from_operating_activity'].cast<String>();
    cashFromInvestingActivity =
        json['cash_from_investing_activity'].cast<String>();
    cashFromFinancingActivity =
        json['cash_from_financing_activity'].cast<String>();
    freeCashFlow = json['free_cash_flow'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['cash_from_operating_activity'] = this.cashFromOperatingActivity;
    data['cash_from_investing_activity'] = this.cashFromInvestingActivity;
    data['cash_from_financing_activity'] = this.cashFromFinancingActivity;
    data['free_cash_flow'] = this.freeCashFlow;
    return data;
  }
}

class Dividends {
  List<String>? header;
  List<String>? dividensPerShare;
  List<String>? dividendYield;
  List<String>? payoutRatio;

  Dividends(
      {this.header,
      this.dividensPerShare,
      this.dividendYield,
      this.payoutRatio});

  Dividends.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    dividensPerShare = json['dividens_per_share'].cast<String>();
    dividendYield = json['dividend_yield'].cast<String>();
    payoutRatio = json['payout_ratio'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['dividens_per_share'] = this.dividensPerShare;
    data['dividend_yield'] = this.dividendYield;
    data['payout_ratio'] = this.payoutRatio;
    return data;
  }
}

class DividenedPayoutHistory {
  List<String>? l0;
  List<String>? l1;
  List<String>? l2;
  List<String>? l3;
  List<String>? l4;
  List<String>? l5;
  List<String>? l6;
  List<String>? l7;
  List<String>? l8;
  List<String>? l9;
  List<String>? l10;
  List<String>? l11;
  List<String>? l12;
  List<String>? l13;
  List<String>? l14;
  List<String>? l15;

  DividenedPayoutHistory(
      {this.l0,
      this.l1,
      this.l2,
      this.l3,
      this.l4,
      this.l5,
      this.l6,
      this.l7,
      this.l8,
      this.l9,
      this.l10,
      this.l11,
      this.l12,
      this.l13,
      this.l14,
      this.l15});

  DividenedPayoutHistory.fromJson(Map<String, dynamic> json) {
    l0 = json['0'].cast<String>();
    l1 = json['1'].cast<String>();
    l2 = json['2'].cast<String>();
    l3 = json['3'].cast<String>();
    l4 = json['4'].cast<String>();
    l5 = json['5'].cast<String>();
    l6 = json['6'].cast<String>();
    l7 = json['7'].cast<String>();
    l8 = json['8'].cast<String>();
    l9 = json['9'].cast<String>();
    l10 = json['10'].cast<String>();
    l11 = json['11'].cast<String>();
    l12 = json['12'].cast<String>();
    l13 = json['13'].cast<String>();
    l14 = json['14'].cast<String>();
    l15 = json['15'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.l0;
    data['1'] = this.l1;
    data['2'] = this.l2;
    data['3'] = this.l3;
    data['4'] = this.l4;
    data['5'] = this.l5;
    data['6'] = this.l6;
    data['7'] = this.l7;
    data['8'] = this.l8;
    data['9'] = this.l9;
    data['10'] = this.l10;
    data['11'] = this.l11;
    data['12'] = this.l12;
    data['13'] = this.l13;
    data['14'] = this.l14;
    data['15'] = this.l15;
    return data;
  }
}

class Revenue {
  List<String>? headerR;
  List<String>? reportedR;
  List<String>? estimateR;
  List<String>? surpriseR;

  Revenue({this.headerR, this.reportedR, this.estimateR, this.surpriseR});

  Revenue.fromJson(Map<String, dynamic> json) {
    headerR = json['header_R'].cast<String>();
    reportedR = json['reported_R'].cast<String>();
    estimateR = json['estimate_R'].cast<String>();
    surpriseR = json['surprise_R'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header_R'] = this.headerR;
    data['reported_R'] = this.reportedR;
    data['estimate_R'] = this.estimateR;
    data['surprise_R'] = this.surpriseR;
    return data;
  }
}

class Earning {
  List<String>? headerE;
  List<String>? reportedE;
  List<String>? estimateE;
  List<String>? surpriseE;

  Earning({this.headerE, this.reportedE, this.estimateE, this.surpriseE});

  Earning.fromJson(Map<String, dynamic> json) {
    headerE = json['header_E'].cast<String>();
    reportedE = json['reported_E'].cast<String>();
    estimateE = json['estimate_E'].cast<String>();
    surpriseE = json['surprise_E'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header_E'] = this.headerE;
    data['reported_E'] = this.reportedE;
    data['estimate_E'] = this.estimateE;
    data['surprise_E'] = this.surpriseE;
    return data;
  }
}
*/

/*class StockChartModel {
  IncomeStatement? incomeStatement;
  BalanceSheet? balanceSheet;
  CashFlow? cashFlow;
  Dividends? dividends;
  DividenedPayoutHistory? dividenedPayoutHistory;
  Revenue? revenue;
  Earning? earning;

  StockChartModel(
      {this.incomeStatement,
      this.balanceSheet,
      this.cashFlow,
      this.dividends,
      this.dividenedPayoutHistory,
      this.revenue,
      this.earning});

  StockChartModel.fromJson(Map<String, dynamic> json) {
    incomeStatement = json['income_statement'] != null
        ? new IncomeStatement.fromJson(json['income_statement'])
        : null;
    balanceSheet = json['balance_sheet'] != null
        ? new BalanceSheet.fromJson(json['balance_sheet'])
        : null;
    cashFlow = json['cash_flow'] != null
        ? new CashFlow.fromJson(json['cash_flow'])
        : null;
    dividends = json['dividends'] != null
        ? new Dividends.fromJson(json['dividends'])
        : null;
    dividenedPayoutHistory = json['dividened_payout_history'] != null
        ? new DividenedPayoutHistory.fromJson(json['dividened_payout_history'])
        : null;
    revenue =
        json['revenue'] != null ? new Revenue.fromJson(json['revenue']) : null;
    earning =
        json['earning'] != null ? new Earning.fromJson(json['earning']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.incomeStatement != null) {
      data['income_statement'] = this.incomeStatement!.toJson();
    }
    if (this.balanceSheet != null) {
      data['balance_sheet'] = this.balanceSheet!.toJson();
    }
    if (this.cashFlow != null) {
      data['cash_flow'] = this.cashFlow!.toJson();
    }
    if (this.dividends != null) {
      data['dividends'] = this.dividends!.toJson();
    }
    if (this.dividenedPayoutHistory != null) {
      data['dividened_payout_history'] = this.dividenedPayoutHistory!.toJson();
    }
    if (this.revenue != null) {
      data['revenue'] = this.revenue!.toJson();
    }
    if (this.earning != null) {
      data['earning'] = this.earning!.toJson();
    }
    return data;
  }
}

class IncomeStatement {
  List<String>? header;
  List<double>? totalRevenue;
  List<double>? costOfGoodsSold;
  List<double>? grossProfit;
  List<double>? operatingExpenses;
  List<double>? operatingIncome;
  List<double>? nonOperatingIncome;
  List<double>? pretaxIncome;
  List<int>? equityInEarnings;
  List<double>? taxes;
  List<int>? nonControllingMinorityInterest;
  List<double>? afterTaxOtherIncomeExpense;
  List<double>? netIncomeBeforeDiscontinuedOperations;
  List<int>? discontinuedOperations;
  List<double>? netIncome;
  List<int>? dilutionAdjustment;
  List<int>? preferredDividends;
  List<double>? dilutedNetIncomeAvailableToCommonStockholders;
  List<double>? basicEPS;
  List<double>? dilutedEPS;
  List<double>? averageBasicSharesOutstanding;
  List<double>? dilutedSharesOutstanding;
  List<double>? eBITDA;
  List<double>? eBIT;
  List<double>? totalOperatingExpenses;

  IncomeStatement(
      {this.header,
      this.totalRevenue,
      this.costOfGoodsSold,
      this.grossProfit,
      this.operatingExpenses,
      this.operatingIncome,
      this.nonOperatingIncome,
      this.pretaxIncome,
      this.equityInEarnings,
      this.taxes,
      this.nonControllingMinorityInterest,
      this.afterTaxOtherIncomeExpense,
      this.netIncomeBeforeDiscontinuedOperations,
      this.discontinuedOperations,
      this.netIncome,
      this.dilutionAdjustment,
      this.preferredDividends,
      this.dilutedNetIncomeAvailableToCommonStockholders,
      this.basicEPS,
      this.dilutedEPS,
      this.averageBasicSharesOutstanding,
      this.dilutedSharesOutstanding,
      this.eBITDA,
      this.eBIT,
      this.totalOperatingExpenses});

  IncomeStatement.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    totalRevenue = json['total_revenue'].cast<double>();
    costOfGoodsSold = json['cost_of_goods_sold'].cast<double>();
    grossProfit = json['gross_profit'].cast<double>();
    operatingExpenses = json['operating_expenses'].cast<double>();
    operatingIncome = json['operating_income'].cast<double>();
    nonOperatingIncome = json['nonOperating_income'].cast<double>();
    pretaxIncome = json['pretax_income'].cast<double>();
    equityInEarnings = json['equity_in_earnings'].cast<int>();
    taxes = json['taxes'].cast<double>();
    nonControllingMinorityInterest =
        json['nonControllingMinority_interest'].cast<int>();
    afterTaxOtherIncomeExpense =
        json['after_tax_other_income_expense'].cast<double>();
    netIncomeBeforeDiscontinuedOperations =
        json['net_income_before_discontinued_operations'].cast<double>();
    discontinuedOperations = json['discontinued_operations'].cast<int>();
    netIncome = json['net_income'].cast<double>();
    dilutionAdjustment = json['dilution_adjustment'].cast<int>();
    preferredDividends = json['preferred_dividends'].cast<int>();
    dilutedNetIncomeAvailableToCommonStockholders =
        json['diluted_net_income_available_to_common_stockholders']
            .cast<double>();
    basicEPS = json['basic_EPS'].cast<double>();
    dilutedEPS = json['diluted_EPS'].cast<double>();
    averageBasicSharesOutstanding =
        json['average_basic_shares_outstanding'].cast<double>();
    dilutedSharesOutstanding =
        json['diluted_shares_outstanding'].cast<double>();
    eBITDA = json['EBITDA'].cast<double>();
    eBIT = json['EBIT'].cast<double>();
    totalOperatingExpenses = json['total_operating_expenses'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['total_revenue'] = this.totalRevenue;
    data['cost_of_goods_sold'] = this.costOfGoodsSold;
    data['gross_profit'] = this.grossProfit;
    data['operating_expenses'] = this.operatingExpenses;
    data['operating_income'] = this.operatingIncome;
    data['nonOperating_income'] = this.nonOperatingIncome;
    data['pretax_income'] = this.pretaxIncome;
    data['equity_in_earnings'] = this.equityInEarnings;
    data['taxes'] = this.taxes;
    data['nonControllingMinority_interest'] =
        this.nonControllingMinorityInterest;
    data['after_tax_other_income_expense'] = this.afterTaxOtherIncomeExpense;
    data['net_income_before_discontinued_operations'] =
        this.netIncomeBeforeDiscontinuedOperations;
    data['discontinued_operations'] = this.discontinuedOperations;
    data['net_income'] = this.netIncome;
    data['dilution_adjustment'] = this.dilutionAdjustment;
    data['preferred_dividends'] = this.preferredDividends;
    data['diluted_net_income_available_to_common_stockholders'] =
        this.dilutedNetIncomeAvailableToCommonStockholders;
    data['basic_EPS'] = this.basicEPS;
    data['diluted_EPS'] = this.dilutedEPS;
    data['average_basic_shares_outstanding'] =
        this.averageBasicSharesOutstanding;
    data['diluted_shares_outstanding'] = this.dilutedSharesOutstanding;
    data['EBITDA'] = this.eBITDA;
    data['EBIT'] = this.eBIT;
    data['total_operating_expenses'] = this.totalOperatingExpenses;
    return data;
  }
}

class BalanceSheet {
  List<String>? header;
  List<String>? totalAssets;
  List<String>? totalLiabilities;
  List<String>? totalEquity;
  List<String>? totalLiabilitiesAndShareholders;
  List<String>? totalDebt;
  List<String>? netDebt;
  List<String>? bookValuePerShare;

  BalanceSheet(
      {this.header,
      this.totalAssets,
      this.totalLiabilities,
      this.totalEquity,
      this.totalLiabilitiesAndShareholders,
      this.totalDebt,
      this.netDebt,
      this.bookValuePerShare});

  BalanceSheet.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    totalAssets = json['total_assets'].cast<String>();
    totalLiabilities = json['total_liabilities'].cast<String>();
    totalEquity = json['total_equity'].cast<String>();
    totalLiabilitiesAndShareholders =
        json['total_liabilities_and_shareholders'].cast<String>();
    totalDebt = json['total_debt'].cast<String>();
    netDebt = json['net_debt'].cast<String>();
    bookValuePerShare = json['book_value_per_share'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['total_assets'] = this.totalAssets;
    data['total_liabilities'] = this.totalLiabilities;
    data['total_equity'] = this.totalEquity;
    data['total_liabilities_and_shareholders'] =
        this.totalLiabilitiesAndShareholders;
    data['total_debt'] = this.totalDebt;
    data['net_debt'] = this.netDebt;
    data['book_value_per_share'] = this.bookValuePerShare;
    return data;
  }
}

class CashFlow {
  List<String>? header;
  List<String>? cashFromOperatingActivity;
  List<String>? cashFromInvestingActivity;
  List<String>? cashFromFinancingActivity;
  List<String>? freeCashFlow;

  CashFlow(
      {this.header,
      this.cashFromOperatingActivity,
      this.cashFromInvestingActivity,
      this.cashFromFinancingActivity,
      this.freeCashFlow});

  CashFlow.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    cashFromOperatingActivity =
        json['cash_from_operating_activity'].cast<String>();
    cashFromInvestingActivity =
        json['cash_from_investing_activity'].cast<String>();
    cashFromFinancingActivity =
        json['cash_from_financing_activity'].cast<String>();
    freeCashFlow = json['free_cash_flow'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['cash_from_operating_activity'] = this.cashFromOperatingActivity;
    data['cash_from_investing_activity'] = this.cashFromInvestingActivity;
    data['cash_from_financing_activity'] = this.cashFromFinancingActivity;
    data['free_cash_flow'] = this.freeCashFlow;
    return data;
  }
}

class Dividends {
  List<String>? header;
  List<String>? dividensPerShare;
  List<String>? dividendYield;
  List<String>? payoutRatio;

  Dividends(
      {this.header,
      this.dividensPerShare,
      this.dividendYield,
      this.payoutRatio});

  Dividends.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    dividensPerShare = json['dividens_per_share'].cast<String>();
    dividendYield = json['dividend_yield'].cast<String>();
    payoutRatio = json['payout_ratio'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['dividens_per_share'] = this.dividensPerShare;
    data['dividend_yield'] = this.dividendYield;
    data['payout_ratio'] = this.payoutRatio;
    return data;
  }
}

class DividenedPayoutHistory {
  List<String>? l0;
  List<String>? l1;
  List<String>? l2;
  List<String>? l3;
  List<String>? l4;
  List<String>? l5;
  List<String>? l6;
  List<String>? l7;
  List<String>? l8;
  List<String>? l9;
  List<String>? l10;
  List<String>? l11;
  List<String>? l12;
  List<String>? l13;
  List<String>? l14;
  List<String>? l15;

  DividenedPayoutHistory(
      {this.l0,
      this.l1,
      this.l2,
      this.l3,
      this.l4,
      this.l5,
      this.l6,
      this.l7,
      this.l8,
      this.l9,
      this.l10,
      this.l11,
      this.l12,
      this.l13,
      this.l14,
      this.l15});

  DividenedPayoutHistory.fromJson(Map<String, dynamic> json) {
    l0 = json['0'].cast<String>();
    l1 = json['1'].cast<String>();
    l2 = json['2'].cast<String>();
    l3 = json['3'].cast<String>();
    l4 = json['4'].cast<String>();
    l5 = json['5'].cast<String>();
    l6 = json['6'].cast<String>();
    l7 = json['7'].cast<String>();
    l8 = json['8'].cast<String>();
    l9 = json['9'].cast<String>();
    l10 = json['10'].cast<String>();
    l11 = json['11'].cast<String>();
    l12 = json['12'].cast<String>();
    l13 = json['13'].cast<String>();
    l14 = json['14'].cast<String>();
    l15 = json['15'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.l0;
    data['1'] = this.l1;
    data['2'] = this.l2;
    data['3'] = this.l3;
    data['4'] = this.l4;
    data['5'] = this.l5;
    data['6'] = this.l6;
    data['7'] = this.l7;
    data['8'] = this.l8;
    data['9'] = this.l9;
    data['10'] = this.l10;
    data['11'] = this.l11;
    data['12'] = this.l12;
    data['13'] = this.l13;
    data['14'] = this.l14;
    data['15'] = this.l15;
    return data;
  }
}

class Revenue {
  List<String>? headerR;
  List<String>? reportedR;
  List<String>? estimateR;
  List<String>? surpriseR;

  Revenue({this.headerR, this.reportedR, this.estimateR, this.surpriseR});

  Revenue.fromJson(Map<String, dynamic> json) {
    headerR = json['header_R'].cast<String>();
    reportedR = json['reported_R'].cast<String>();
    estimateR = json['estimate_R'].cast<String>();
    surpriseR = json['surprise_R'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header_R'] = this.headerR;
    data['reported_R'] = this.reportedR;
    data['estimate_R'] = this.estimateR;
    data['surprise_R'] = this.surpriseR;
    return data;
  }
}

class Earning {
  List<String>? headerE;
  List<String>? reportedE;
  List<String>? estimateE;
  List<String>? surpriseE;

  Earning({this.headerE, this.reportedE, this.estimateE, this.surpriseE});

  Earning.fromJson(Map<String, dynamic> json) {
    headerE = json['header_E'].cast<String>();
    reportedE = json['reported_E'].cast<String>();
    estimateE = json['estimate_E'].cast<String>();
    surpriseE = json['surprise_E'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header_E'] = this.headerE;
    data['reported_E'] = this.reportedE;
    data['estimate_E'] = this.estimateE;
    data['surprise_E'] = this.surpriseE;
    return data;
  }
}

*/

/// -------------------------------------------------------------------------------
class StockChartModel2 {
  IncomeStatement? incomeStatement;
  BalanceSheet? balanceSheet;
  CashFlow? cashFlow;
  Dividends? dividends;
  DividenedPayoutHistory? dividenedPayoutHistory;
  Revenue? revenue;
  Earning? earning;

  StockChartModel2(
      {this.incomeStatement,
      this.balanceSheet,
      this.cashFlow,
      this.dividends,
      this.dividenedPayoutHistory,
      this.revenue,
      this.earning});

  StockChartModel2.fromJson(Map<String, dynamic> json) {
    incomeStatement = json['income_statement'] != null
        ? new IncomeStatement.fromJson(json['income_statement'])
        : null;
    balanceSheet = json['balance_sheet'] != null
        ? new BalanceSheet.fromJson(json['balance_sheet'])
        : null;
    cashFlow = json['cash_flow'] != null
        ? new CashFlow.fromJson(json['cash_flow'])
        : null;
    dividends = json['dividends'] != null
        ? new Dividends.fromJson(json['dividends'])
        : null;
    dividenedPayoutHistory = json['dividened_payout_history'] != null
        ? new DividenedPayoutHistory.fromJson(json['dividened_payout_history'])
        : null;
    revenue =
        json['revenue'] != null ? new Revenue.fromJson(json['revenue']) : null;
    earning =
        json['earning'] != null ? new Earning.fromJson(json['earning']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.incomeStatement != null) {
      data['income_statement'] = this.incomeStatement!.toJson();
    }
    if (this.balanceSheet != null) {
      data['balance_sheet'] = this.balanceSheet!.toJson();
    }
    if (this.cashFlow != null) {
      data['cash_flow'] = this.cashFlow!.toJson();
    }
    if (this.dividends != null) {
      data['dividends'] = this.dividends!.toJson();
    }
    if (this.dividenedPayoutHistory != null) {
      data['dividened_payout_history'] = this.dividenedPayoutHistory!.toJson();
    }
    if (this.revenue != null) {
      data['revenue'] = this.revenue!.toJson();
    }
    if (this.earning != null) {
      data['earning'] = this.earning!.toJson();
    }
    return data;
  }
}

class IncomeStatement {
  List<String>? header;
  List<double>? totalRevenue;
  List<double>? costOfGoodsSold;
  List<double>? grossProfit;
  List<double>? operatingExpenses;
  List<double>? operatingIncome;
  List<double>? nonOperatingIncome;
  List<double>? pretaxIncome;
  List<int>? equityInEarnings;
  List<double>? taxes;
  List<double>? nonControllingMinorityInterest;
  List<int>? afterTaxOtherIncomeExpense;
  List<double>? netIncomeBeforeDiscontinuedOperations;
  List<int>? discontinuedOperations;
  List<double>? netIncome;
  List<int>? dilutionAdjustment;
  List<int>? preferredDividends;
  List<double>? dilutedNetIncomeAvailableToCommonStockholders;
  List<double>? basicEPS;
  List<double>? dilutedEPS;
  List<double>? averageBasicSharesOutstanding;
  List<double>? dilutedSharesOutstanding;
  List<double>? eBITDA;
  List<double>? eBIT;
  List<double>? totalOperatingExpenses;

  IncomeStatement(
      {this.header,
      this.totalRevenue,
      this.costOfGoodsSold,
      this.grossProfit,
      this.operatingExpenses,
      this.operatingIncome,
      this.nonOperatingIncome,
      this.pretaxIncome,
      this.equityInEarnings,
      this.taxes,
      this.nonControllingMinorityInterest,
      this.afterTaxOtherIncomeExpense,
      this.netIncomeBeforeDiscontinuedOperations,
      this.discontinuedOperations,
      this.netIncome,
      this.dilutionAdjustment,
      this.preferredDividends,
      this.dilutedNetIncomeAvailableToCommonStockholders,
      this.basicEPS,
      this.dilutedEPS,
      this.averageBasicSharesOutstanding,
      this.dilutedSharesOutstanding,
      this.eBITDA,
      this.eBIT,
      this.totalOperatingExpenses});

  IncomeStatement.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    totalRevenue = json['total_revenue'].cast<double>();
    costOfGoodsSold = json['cost_of_goods_sold'].cast<double>();
    grossProfit = json['gross_profit'].cast<double>();
    operatingExpenses = json['operating_expenses'].cast<double>();
    operatingIncome = json['operating_income'].cast<double>();
    nonOperatingIncome = json['nonOperating_income'].cast<double>();
    pretaxIncome = json['pretax_income'].cast<double>();
    equityInEarnings = json['equity_in_earnings'].cast<int>();
    taxes = json['taxes'].cast<double>();
    nonControllingMinorityInterest =
        json['nonControllingMinority_interest'].cast<double>();
    afterTaxOtherIncomeExpense =
        json['after_tax_other_income_expense'].cast<int>();
    netIncomeBeforeDiscontinuedOperations =
        json['net_income_before_discontinued_operations'].cast<double>();
    discontinuedOperations = json['discontinued_operations'].cast<int>();
    netIncome = json['net_income'].cast<double>();
    dilutionAdjustment = json['dilution_adjustment'].cast<int>();
    preferredDividends = json['preferred_dividends'].cast<int>();
    dilutedNetIncomeAvailableToCommonStockholders =
        json['diluted_net_income_available_to_common_stockholders']
            .cast<double>();
    basicEPS = json['basic_EPS'].cast<double>();
    dilutedEPS = json['diluted_EPS'].cast<double>();
    averageBasicSharesOutstanding =
        json['average_basic_shares_outstanding'].cast<double>();
    dilutedSharesOutstanding =
        json['diluted_shares_outstanding'].cast<double>();
    eBITDA = json['EBITDA'].cast<double>();
    eBIT = json['EBIT'].cast<double>();
    totalOperatingExpenses = json['total_operating_expenses'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['total_revenue'] = this.totalRevenue;
    data['cost_of_goods_sold'] = this.costOfGoodsSold;
    data['gross_profit'] = this.grossProfit;
    data['operating_expenses'] = this.operatingExpenses;
    data['operating_income'] = this.operatingIncome;
    data['nonOperating_income'] = this.nonOperatingIncome;
    data['pretax_income'] = this.pretaxIncome;
    data['equity_in_earnings'] = this.equityInEarnings;
    data['taxes'] = this.taxes;
    data['nonControllingMinority_interest'] =
        this.nonControllingMinorityInterest;
    data['after_tax_other_income_expense'] = this.afterTaxOtherIncomeExpense;
    data['net_income_before_discontinued_operations'] =
        this.netIncomeBeforeDiscontinuedOperations;
    data['discontinued_operations'] = this.discontinuedOperations;
    data['net_income'] = this.netIncome;
    data['dilution_adjustment'] = this.dilutionAdjustment;
    data['preferred_dividends'] = this.preferredDividends;
    data['diluted_net_income_available_to_common_stockholders'] =
        this.dilutedNetIncomeAvailableToCommonStockholders;
    data['basic_EPS'] = this.basicEPS;
    data['diluted_EPS'] = this.dilutedEPS;
    data['average_basic_shares_outstanding'] =
        this.averageBasicSharesOutstanding;
    data['diluted_shares_outstanding'] = this.dilutedSharesOutstanding;
    data['EBITDA'] = this.eBITDA;
    data['EBIT'] = this.eBIT;
    data['total_operating_expenses'] = this.totalOperatingExpenses;
    return data;
  }
}

class BalanceSheet {
  List<String>? header;
  List<String>? totalAssets;
  List<String>? totalLiabilities;
  List<String>? totalEquity;
  List<String>? totalLiabilitiesAndShareholders;
  List<String>? totalDebt;
  List<String>? netDebt;
  List<String>? bookValuePerShare;

  BalanceSheet(
      {this.header,
      this.totalAssets,
      this.totalLiabilities,
      this.totalEquity,
      this.totalLiabilitiesAndShareholders,
      this.totalDebt,
      this.netDebt,
      this.bookValuePerShare});

  BalanceSheet.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    totalAssets = json['total_assets'].cast<String>();
    totalLiabilities = json['total_liabilities'].cast<String>();
    totalEquity = json['total_equity'].cast<String>();
    totalLiabilitiesAndShareholders =
        json['total_liabilities_and_shareholders'].cast<String>();
    totalDebt = json['total_debt'].cast<String>();
    netDebt = json['net_debt'].cast<String>();
    bookValuePerShare = json['book_value_per_share'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['total_assets'] = this.totalAssets;
    data['total_liabilities'] = this.totalLiabilities;
    data['total_equity'] = this.totalEquity;
    data['total_liabilities_and_shareholders'] =
        this.totalLiabilitiesAndShareholders;
    data['total_debt'] = this.totalDebt;
    data['net_debt'] = this.netDebt;
    data['book_value_per_share'] = this.bookValuePerShare;
    return data;
  }
}

class CashFlow {
  List<String>? header;
  List<String>? cashFromOperatingActivity;
  List<String>? cashFromInvestingActivity;
  List<String>? cashFromFinancingActivity;
  List<String>? freeCashFlow;

  CashFlow(
      {this.header,
      this.cashFromOperatingActivity,
      this.cashFromInvestingActivity,
      this.cashFromFinancingActivity,
      this.freeCashFlow});

  CashFlow.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    cashFromOperatingActivity =
        json['cash_from_operating_activity'].cast<String>();
    cashFromInvestingActivity =
        json['cash_from_investing_activity'].cast<String>();
    cashFromFinancingActivity =
        json['cash_from_financing_activity'].cast<String>();
    freeCashFlow = json['free_cash_flow'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['cash_from_operating_activity'] = this.cashFromOperatingActivity;
    data['cash_from_investing_activity'] = this.cashFromInvestingActivity;
    data['cash_from_financing_activity'] = this.cashFromFinancingActivity;
    data['free_cash_flow'] = this.freeCashFlow;
    return data;
  }
}

class Dividends {
  List<String>? header;
  List<String>? dividensPerShare;
  List<String>? dividendYield;
  List<String>? payoutRatio;

  Dividends(
      {this.header,
      this.dividensPerShare,
      this.dividendYield,
      this.payoutRatio});

  Dividends.fromJson(Map<String, dynamic> json) {
    header = json['header'].cast<String>();
    dividensPerShare = json['dividens_per_share'].cast<String>();
    dividendYield = json['dividend_yield'].cast<String>();
    payoutRatio = json['payout_ratio'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['dividens_per_share'] = this.dividensPerShare;
    data['dividend_yield'] = this.dividendYield;
    data['payout_ratio'] = this.payoutRatio;
    return data;
  }
}

class DividenedPayoutHistory {
  List<String>? l0;

  DividenedPayoutHistory({this.l0});

  DividenedPayoutHistory.fromJson(Map<String, dynamic> json) {
    l0 = json['0'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.l0;
    return data;
  }
}

class Revenue {
  List<String>? headerR;
  List<String>? reportedR;
  List<String>? estimateR;
  List<String>? surpriseR;

  Revenue({this.headerR, this.reportedR, this.estimateR, this.surpriseR});

  Revenue.fromJson(Map<String, dynamic> json) {
    headerR = json['header_R'].cast<String>();
    reportedR = json['reported_R'].cast<String>();
    estimateR = json['estimate_R'].cast<String>();
    surpriseR = json['surprise_R'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header_R'] = this.headerR;
    data['reported_R'] = this.reportedR;
    data['estimate_R'] = this.estimateR;
    data['surprise_R'] = this.surpriseR;
    return data;
  }
}

class Earning {
  List<String>? headerE;
  List<String>? reportedE;
  List<String>? estimateE;
  List<String>? surpriseE;

  Earning({this.headerE, this.reportedE, this.estimateE, this.surpriseE});

  Earning.fromJson(Map<String, dynamic> json) {
    headerE = json['header_E'].cast<String>();
    reportedE = json['reported_E'].cast<String>();
    estimateE = json['estimate_E'].cast<String>();
    surpriseE = json['surprise_E'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header_E'] = this.headerE;
    data['reported_E'] = this.reportedE;
    data['estimate_E'] = this.estimateE;
    data['surprise_E'] = this.surpriseE;
    return data;
  }
}
