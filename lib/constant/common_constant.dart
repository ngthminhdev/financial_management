final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
final whiteSpaceRegex = RegExp(r'^\S+$');

const int TRANSACTION_TYPE_INCOME = 1;
const int TRANSACTION_TYPE_SPENT = 2;

const int MEMBER_SHIP_STANDARD = 1;
const int MEMBER_SHIP_PREMIUM = 2;
