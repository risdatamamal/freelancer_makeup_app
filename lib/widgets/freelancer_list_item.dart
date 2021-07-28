part of 'widgets.dart';

class FreelancerListItem extends StatelessWidget {
  final Freelancer freelancer;
  final double itemWidth;

  FreelancerListItem({@required this.freelancer, this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(freelancer.picturePath),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: itemWidth - 182, // 60 + 12 + 110
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    freelancer.name,
                    style: blackFontStyle2,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    freelancer.categories,
                    style: greyFontStyle,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: RatingStars(freelancer.rate),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Text("Mulai dari", style: greyFontStyle),
                  Text(
                    NumberFormat.currency(
                            symbol: 'Rp ', decimalDigits: 0, locale: 'id-ID')
                        .format(freelancer.price),
                    style: blackFontStyle1.copyWith(fontSize: 14),
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
