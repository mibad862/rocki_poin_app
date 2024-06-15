class RefTaskModel {
  final String totalAmount;
  final String totalNumber;

  RefTaskModel(this.totalAmount, this.totalNumber);

  static List<RefTaskModel> refTaskList = [
    RefTaskModel(
      "20,000",
      "10"
    ),
    RefTaskModel(
        "45,000",
        "25"
    ),
    RefTaskModel(
        "90,000",
        "50"
    ),
  ];
}
