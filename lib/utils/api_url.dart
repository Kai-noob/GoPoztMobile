class ApiUrls {
  static const baseUrl =
      'http://gopozt.ap-southeast-1.elasticbeanstalk.com/api';
  // static const baseUrl= 'http://10.0.2.2:8000/api';
  static const registerUrl = '$baseUrl/customer/sign-up';
  static const loginUrl = '$baseUrl/customer/sign-in';
  static const logoutUrl = '$baseUrl/customer/sign-out';
  static const profileUrl = '$baseUrl/customer/me';
  static const editProfileUrl = '$baseUrl/customer/update';
  static const deviecTokenUrl = '$baseUrl/customer/refresh/deviceToken';

  static const categoriesUrl = '$baseUrl/customer/categories';
  static const anounementsUrl = '$baseUrl/customer/announcements';
  static const partnersUrl = '$baseUrl/customer/partners';
  static const advertisementsUrl = '$baseUrl/customer/advertisements';

  static const citiesUrl = '$baseUrl/customer/cities';
  static const ordersUrl = '$baseUrl/customer/orders';
  static const pendingOrdersUrl = '$baseUrl/customer/orders/pending';
  static const deliveringOrdersUrl = '$baseUrl/customer/orders/onDelivery';
    static const completedOrdersUrl = '$baseUrl/customer/orders/completed';

  static const waysUrl = '$baseUrl/customer/ways/from';

  static const extraFeesUrl = '$baseUrl/customer/setting';
  static const notificationsUrl = '$baseUrl/customer/notifications';
}
