part of 'widgets.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final double itemWidth;

  PostListItem({@required this.post, this.itemWidth});

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
                      image: NetworkImage(post.thumbnail), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: itemWidth - 182, // 60 + 12 + 110
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.name,
                    style: blackFontStyle2,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    post.category.toString(),
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
              child: RatingStars(post.rate),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Text("Mulai dari", style: greyFontStyle),
                  Text(
                    NumberFormat.currency(
                            symbol: 'Rp ', decimalDigits: 0, locale: 'id-ID')
                        .format(post.price),
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
