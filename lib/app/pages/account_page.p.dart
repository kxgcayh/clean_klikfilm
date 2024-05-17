part of 'account_page.dart';

class AccountServiceContentContainer extends StatelessWidget {
  final int index;
  final String title;
  final String expiry;
  const AccountServiceContentContainer({
    super.key,
    this.index = 0,
    required this.title,
    required this.expiry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: index % 2 == 0 ? KColors.grey : KColors.primaryGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Active until $expiry',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
