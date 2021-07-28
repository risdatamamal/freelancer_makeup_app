part of 'pages.dart';

class FreelancerPage extends StatefulWidget {
  @override
  _FreelancerPageState createState() => _FreelancerPageState();
}

class _FreelancerPageState extends State<FreelancerPage> {
  int selectedIndex = 0;

  Freelancer selectedKategori;
  List<Freelancer> kategori = [
    Freelancer(categories: "Makeup Photoshoot"),
    Freelancer(categories: "Makeup Pernikahan"),
    Freelancer(categories: "Makeup Wisuda"),
    Freelancer(categories: "Makeup Pesta"),
  ];
  List<DropdownMenuItem> generateItemsKategori(List<Freelancer> freelancers) {
    List<DropdownMenuItem> items = [];
    for (var item in kategori) {
      items.add(DropdownMenuItem(child: Text(item.categories), value: item));
    }
    return items;
  }

  Freelancer selectedWilayah;
  List<Freelancer> wilayah = [
    Freelancer(city: "Jakarta"),
    Freelancer(city: "Bandung"),
    Freelancer(city: "Yogyakarta"),
    Freelancer(city: "Depok"),
  ];
  List<DropdownMenuItem> generateItemsWilayah(List<Freelancer> freelancers) {
    List<DropdownMenuItem> items = [];
    for (var item in wilayah) {
      items.add(DropdownMenuItem(child: Text(item.city), value: item));
    }
    return items;
  }

  Future<List<Freelancer>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Freelancer(
        name: "$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            //// HEADER
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 100,
              color: mainColor,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Makeup App You',
                      style: whiteFontStyle1.copyWith(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Let's booking for your make up artist",
                      style:
                          greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            //// SEARCHING
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: mainColor,
              ),
              height: 90,
              width: double.infinity,
              child: SearchBar<Freelancer>(
                  onSearch: search,
                  icon: Icon(Icons.search, color: Colors.black),
                  cancellationText: Text("cancel"),
                  searchBarStyle: SearchBarStyle(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(10),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onItemFound: (Freelancer freelancer, int index) {
                    return Column(
                      children: mockFreelancers
                          .map((e) => Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  defaultMargin, 0, defaultMargin, 16),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(FreelancerDetailsPage(
                                    transaction: Transaction(
                                      freelancer: e,
                                      user: (context.bloc<UserCubit>().state
                                              as UserLoaded)
                                          .user,
                                    ),
                                    onBackButtonPressed: () {
                                      Get.back();
                                    },
                                  ));
                                },
                                child: FreelancerListItem(
                                  freelancer: e,
                                  itemWidth: listItemWidth,
                                ),
                              )))
                          .toList(),
                    );
                  }),
            ),
            //// KATEGORI && WILAYAH
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: mainColor)),
                    child: DropdownButton(
                      hint: Text("Kategori"),
                      dropdownColor: mainColor,
                      underline: SizedBox(),
                      value: selectedKategori,
                      items: generateItemsKategori(kategori),
                      onChanged: (item) {
                        setState(() {
                          selectedKategori = item;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: mainColor)),
                    child: DropdownButton(
                      hint: Text("Wilayah"),
                      dropdownColor: mainColor,
                      underline: SizedBox(),
                      value: selectedWilayah,
                      items: generateItemsWilayah(wilayah),
                      onChanged: (item) {
                        setState(() {
                          selectedWilayah = item;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            //// LIST OF FREELANCER
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 80.0),
                child: Builder(builder: (_) {
                  return Column(
                    children: mockFreelancers
                        .map((e) => Padding(
                            padding: const EdgeInsets.fromLTRB(
                                defaultMargin, 0, defaultMargin, 16),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(FreelancerDetailsPage(
                                  transaction: Transaction(
                                    freelancer: e,
                                    user: (context.bloc<UserCubit>().state
                                            as UserLoaded)
                                        .user,
                                  ),
                                  onBackButtonPressed: () {
                                    Get.back();
                                  },
                                ));
                              },
                              child: FreelancerListItem(
                                freelancer: e,
                                itemWidth: listItemWidth,
                              ),
                            )))
                        .toList(),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
