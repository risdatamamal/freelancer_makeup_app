part of 'pages.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  User selectedCities;
  List<User> cities = [
    User(city: "Jakarta"),
    User(city: "Bandung"),
    User(city: "Surabaya")
  ];

  List<DropdownMenuItem> generateItems(List<User> users) {
    List<DropdownMenuItem> items = [];
    for (var item in cities) {
      items.add(DropdownMenuItem(child: Text(item.city), value: item));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Address',
      subtitle: "Make sure it’s valid",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Phone No.",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your phone number'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Address",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your address'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "House No.",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: houseController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your house number'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "City",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black)),
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              value: selectedCities,
              items: generateItems(cities),
              onChanged: (item) {
                setState(() {
                  selectedCities = item;
                });
              },
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: RaisedButton(
                onPressed: () {
                  Get.to(() => IdentityPage());
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: mainColor,
                child: Text(
                  'Continue',
                  style: GoogleFonts.poppins(
                      color: secColor, fontWeight: FontWeight.w500),
                ),
              )),
        ],
      ),
    );
  }
}
