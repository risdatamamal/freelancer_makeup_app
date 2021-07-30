part of 'models.dart';

enum TransactionStatus { delivered, on_delivery, pending, cancelled }

class Transaction extends Equatable {
  final int id;
  final User user;
  final Jasa jasa;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus status;

  Transaction(
      {this.id,
      this.jasa,
      this.quantity,
      this.total,
      this.dateTime,
      this.status,
      this.user});

  Transaction copyWith({
    int id,
    Jasa jasa,
    int quantity,
    int total,
    DateTime dateTime,
    TransactionStatus status,
    User user,
  }) {
    return Transaction(
        id: id ?? this.id,
        jasa: jasa ?? this.jasa,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status,
        user: user ?? this.user);
  }

  @override
  List<Object> get props => [id, jasa, quantity, total, dateTime, status, user];
}

List<Transaction> mockTransactions = [
  Transaction(
    id: 1,
    jasa: mockJasas[0],
    quantity: 10,
    total: (mockJasas[0].price * 10 * 1.1).round() + 9000,
    dateTime: DateTime.now(),
    status: TransactionStatus.on_delivery,
    user: mockUser,
  ),
  Transaction(
    id: 2,
    jasa: mockJasas[0],
    quantity: 7,
    total: (mockJasas[0].price * 7 * 1.1).round() + 9000,
    dateTime: DateTime.now(),
    status: TransactionStatus.delivered,
    user: mockUser,
  ),
  Transaction(
    id: 3,
    jasa: mockJasas[0],
    quantity: 4,
    total: (mockJasas[0].price * 4 * 1.1).round() + 9000,
    dateTime: DateTime.now(),
    status: TransactionStatus.cancelled,
    user: mockUser,
  ),
];
