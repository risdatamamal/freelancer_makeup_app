part of 'widgets.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  CustomBottomNavBar({this.selectedIndex, this.onTap});

  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          )
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ic_home' +
                          ((selectedIndex == 0) ? '.png' : '_normal.png')),
                      fit: BoxFit.contain)),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              margin: EdgeInsets.symmetric(horizontal: 83),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ic_order' +
                          ((selectedIndex == 1) ? '.png' : '_normal.png')),
                      fit: BoxFit.contain)),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ic_profile' +
                          ((selectedIndex == 2) ? '.png' : '_normal.png')),
                      fit: BoxFit.contain)),
            ),
          )
        ],
      ),
    );
  }
}
