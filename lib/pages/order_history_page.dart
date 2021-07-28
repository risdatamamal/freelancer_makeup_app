part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key key}) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  List<Transaction> inProgress = mockTransactions
      .where((element) =>
          element.status == TransactionStatus.on_delivery ||
          element.status == TransactionStatus.pending)
      .toList();

  List<Transaction> past = mockTransactions
      .where((element) =>
          element.status == TransactionStatus.delivered ||
          element.status == TransactionStatus.cancelled)
      .toList();

  @override
  Widget build(BuildContext context) {
    if (inProgress.length == 0 && past.length == 0) {
      return IllustrationPage(
        title: 'Ouch! Thirsty',
        subtitle: 'Seems you like have not \n ordered any coffee yet',
        picturePath: 'assets/machine_coffee.png',
        buttonTap1: () {},
        buttonTitle1: 'Find Orders',
      );
    } else {
      double listItemWidth =
          MediaQuery.of(context).size.width - 2 * defaultMargin;
      return ListView(
        children: [
          Column(
            children: [
              //// HEADERS
              Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: mainColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Orders',
                      style: whiteFontStyle1.copyWith(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Wait for the best makeup',
                      style:
                          greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              //// Body
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    CustomTabBar(
                      titles: ['Upcoming', 'History'],
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: (selectedIndex == 0 ? inProgress : past)
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(
                                    right: defaultMargin,
                                    left: defaultMargin,
                                    bottom: 16),
                                child: OrderListItem(
                                  transaction: e,
                                  itemWidth: listItemWidth,
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
