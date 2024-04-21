final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
final whiteSpaceRegex = RegExp(r'^\S+$');

const int TRANSACTION_TYPE_INCOME = 1;
const int TRANSACTION_TYPE_SPENT = 2;

const int MEMBER_SHIP_STANDARD = 1;
const int MEMBER_SHIP_PREMIUM = 2;


const int WALLET_TYPE_DEFAULT = 1;
const int WALLET_TYPE_SPENT = 2;
const int WALLET_TYPE_INVEST = 3;
const int WALLET_TYPE_GOAT = 4;
