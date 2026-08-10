class CustomerReportSendParam {
  final String merchantId;
  final String categoryReport;
  final String reason;

  CustomerReportSendParam({
    required this.merchantId,
    required this.categoryReport,
    required this.reason,
  });

  Map<String, dynamic> toJson() {
    return {
      'category_report': categoryReport,
      'reason': reason,
    };
  }
}
