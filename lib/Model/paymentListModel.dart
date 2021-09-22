class paymentlist {
  final String id;
  final String payment;
  final String number_va;

  paymentlist({this.id = '', required this.payment, required this.number_va});

  factory paymentlist.fromJson(Map<String, dynamic> json) {
    return paymentlist(
        id: json['id'], payment: json['payment'], number_va: json['number_va']);
  }

  @override
  String toString() {
    return 'paymentlist{id: $id, payment: $payment, number_va: $number_va}';
  }
}
