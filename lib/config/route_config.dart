import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_smart_water/ui/screen/main/home.dart';
import 'package:web_smart_water/ui/screen/main/splash.dart';

import '../controller/app_controller.dart';
import '../ui/screen/main/permission_denied.dart';
class RouteConfig{
  static final List<RouteToPage> _routeToPage = [
    RouteToPage(name: '/', page: const SplashScreen(),roles: []),
    RouteToPage(name: '/permission_denied', page: const PermissionDeniedScreen(),roles: []),
    // RouteToPage(name: '/login', page: ResponsiveLoginPage(
    //     desktopBody: const LogInPage(),
    //     mobileBody: const LogInMobilePage()), roles: []
    // ),
    RouteToPage(name: '/home', page: HomeScreen(),roles: ['admin','operation','manager']),
    RouteToPage(name: '/cau_hinh', page: Container(),roles: ['admin','operation','manager']),
    RouteToPage(name: '/cau_hinh_danh_muc', page: Container(),roles: ['admin','operation','manager']),
    RouteToPage(name: '/cau_hinh_tai_khoan', page: Container(),roles: ['admin','operation','manager']),
    RouteToPage(name: '/danh_sach_duong_pho', page: Container(),roles: ['admin','operation','manager']),
  ];
  final List<GetPage> _route = _routeToPage.map((route) => GetPage(name: route.name, page: () => route.page)).toList();

  final List<RouteModel> _navbar = [
  //   RouteModel(route: '/bao_cao', label: 'Báo cáo',group: '/bao_cao',screen: const ListReportScreen(),children: [
  //     RouteModel(route: '/bao_cao_nhap_kho', label: 'Báo cáo nhập kho',group: '/bao_cao',children: [],screen: const ReportImportScreen()),
  //     RouteModel(route: '/bao_cao_xuat_kho', label: 'Báo cáo xuất kho',group: '/bao_cao',children: [],screen: const ReportExportScreen()),
  //     RouteModel(route: '/bao_cao_van_chuyen', label: 'Báo cáo vận chuyển',group: '/bao_cao',children: [],screen: const ReportTransportScreen()),
  //     RouteModel(route: '/bao_cao_loi', label: 'Báo cáo lỗi',group: '/bao_cao',children: [],screen: const ReportErrorScreen()),
  //     RouteModel(route: '/bao_cao_thong_tin_lo', label: 'Báo cáo thông tin lô',group: '/bao_cao',children: [],screen: const ReportLotScreen()),
  //     RouteModel(route: '/bao_cao_thong_tin_lo_unit', label: 'Báo cáo thông tin Lot Unit',group: '/bao_cao',children: [],screen: const ReportUnitLotScreen()),
  //     RouteModel(route: '/bao_cao_thong_tin_kho', label: 'Báo cáo tồn kho',group: '/bao_cao',children: [],screen: const ReportWareHouseScreen()),
  //     RouteModel(route: '/bao_cao_thong_tin_don_hang', label: 'Báo cáo thông tin đơn hàng',group: '/bao_cao',children: [],screen: const ReportOrderScreen()),
  //   ]),
    RouteModel(route: '/cau_hinh', label: 'Cấu hình',group: '/cau_hinh',children: [
      RouteModel(route: '/cau_hinh_danh_muc', label: 'Cấu hình danh mục',group: '/cau_hinh',children: [],screen: Container()),
      RouteModel(route: '/cau_hinh_tai_khoan', label: 'Cấu hình tài khoản',group: '/cau_hinh',children: [],screen: Container()),
    ],screen: Container()),
    RouteModel(route: '/danh_sach_duong_pho', label: 'Danh sách đường phố',children: [],group: '/danh_sach_duong_pho',screen: Container()),

  //   RouteModel(route: '/qr_code', label: 'QR Code',children: [],group: '/qr_code',screen: const QrCodeScreen()),

  ];
  List<GetPage> get getRoute => [
    // GetPage(name: '/order', page: () => ResponsiveOrderPage(desktopBody: const OrderPage(), mobileBody: const OrderMobilePage())),
    // GetPage(name: '/search_order', page: () => const SearchOrderPage()),
    // GetPage(name : '/dang_ky_don_hang', page: () => const AddProduct()),
    GetPage(name : '/', page: () => const SplashScreen()),
    GetPage(name : '/home', page: () => HomeScreen()),
    GetPage(name : '/permission_denied', page: () => const PermissionDeniedScreen()),
    // GetPage(name : '/login', page: () => ResponsiveLoginPage(
    //     desktopBody: const LogInPage(),
    //     mobileBody: const LogInMobilePage())),
  ];
  // List<GetPage> get getRoute => _route;
  List<RouteModel> getNavbar (){
    List<RouteModel> list = [];
    for(RouteModel model in _navbar){
      List<RouteToPage> listRouteToPage = [];
      listRouteToPage.addAll(_routeToPage.where((element) => element.name == model.route).toList());
      if(listRouteToPage.isNotEmpty){
        RouteToPage route = listRouteToPage.first;
        // if(route.roles.isEmpty || route.roles.contains(appController.role)){
          list.add(model);
        // }
      }
    }
    return list;
  }

  List<RouteToPage> get getRouteToPage => _routeToPage;
}

class RouteModel{
  final String route;
  final String label;
  final String group;
  final List<RouteModel> children;
  final Widget screen;
  RouteModel({required this.route,required this.label,required this.group,required this.children,required this.screen});
}

class RouteToPage{
  final String name;
  final Widget page;
  final List<String> roles;
  RouteToPage({required this.name,required this.page,required this.roles});
}