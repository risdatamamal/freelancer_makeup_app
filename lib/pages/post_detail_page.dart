part of 'pages.dart';

class FreelancerDetailsPage extends StatefulWidget {
  final Post post;
  final Function onBackButtonPressed;

  FreelancerDetailsPage({@required this.post, this.onBackButtonPressed});

  @override
  _FreelancerDetailsPageState createState() => _FreelancerDetailsPageState();
}

class _FreelancerDetailsPageState extends State<FreelancerDetailsPage> {
  int selectedIndex = 0;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.post.thumbnail),
                      fit: BoxFit.cover)),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    //// onBackPressButton
                    Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            if (widget.onBackButtonPressed != null) {
                              widget.onBackButtonPressed();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black12,
                            ),
                            child: Image.asset('assets/arrow_back_white.png'),
                          ),
                        ),
                      ),
                    ),

                    //// BODY
                    Container(
                      margin: EdgeInsets.only(top: 180),
                      padding:
                          EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.post.name,
                                style: blackFontStyle2,
                              ),
                              SizedBox(height: 6),
                              RatingStars(widget.post.rate),
                              // Container(
                              //   margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                              //   child: Text(
                              //     widget.post.desc,
                              //     style: greyFontStyle,
                              //   ),
                              // ),
                              // Container(
                              //   margin: EdgeInsets.fromLTRB(0, 4, 0, 41),
                              //   child: Text(widget.post.thumbnail,
                              //       style: greyFontStyle),
                              // ),
                            ],
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(right: 10, bottom: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(widget.post.thumbnail),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),

                    //// Menu
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CustomTabBar(
                            titles: ["Jasa", "Foto", "Ulasan"],
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
                            children: ((selectedIndex == 0)
                                    ? ['List Jasa']
                                    : (selectedIndex == 1)
                                        ? ['List Foto']
                                        : ['List Ulasan'])
                                .map((e) => Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 16,
                                          left: defaultMargin,
                                          right: defaultMargin),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            e,
                                            style: blackFontStyle3,
                                          ),
                                          //// Button Book Jasa
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 10),
                                                child: Text(
                                                  NumberFormat.currency(
                                                    locale: 'id-ID',
                                                    symbol: 'Rp',
                                                    decimalDigits: 0,
                                                  ).format(widget.post.price),
                                                  style: blackFontStyle2
                                                      .copyWith(fontSize: 18),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 90,
                                                height: 45,
                                                child: RaisedButton(
                                                  onPressed: () {},
                                                  color: mainColor,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                  ),
                                                  child: Text(
                                                    'Book',
                                                    style: blackFontStyle3
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
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
            ),
          ),
        ],
      ),
    );
  }
}
