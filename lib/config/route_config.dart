import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_smart_water/code_cua_hung/type/type.dart';
import 'package:web_smart_water/ui/screen/luong_smart_water/list_streets/list_customers_screen.dart';
import 'package:web_smart_water/ui/screen/luong_smart_water/list_streets/streets_screen.dart';
import 'package:web_smart_water/code_cua_hung/login_page/login.dart';
import 'package:web_smart_water/ui/screen/main/home.dart';
import 'package:web_smart_water/ui/screen/main/splash.dart';
import '../code_cua_hung/admin_history/admin_history_view.dart';
import '../code_cua_hung/config/account_view.dart';
import '../code_cua_hung/config/config_account.dart';
import '../controller/app_controller.dart';
import '../ui/screen/main/permission_denied.dart';
class RouteConfig{
  static final List<RouteToPage> _routeToPage = [
    RouteToPage(name: '/', page: const SplashScreen(),roles: []),
    RouteToPage(name: '/permission_denied', page: const PermissionDeniedScreen(),roles: []),
    RouteToPage(name: '/login', page: const LogInPage(), roles: []
    ),
    RouteToPage(name: '/home', page: HomeScreen(),roles: ['admin','operation','manager']),
    RouteToPage(name: '/cau_hinh', page: Container(),roles: ['admin','operation','manager']),
    // RouteToPage(name: '/cau_hinh_danh_muc', page: Container(),roles: ['admin','operation','manager']),
    RouteToPage(name: '/cau_hinh_tai_khoan', page: ConfigAccountScreen(),roles: ['admin']),
    RouteToPage(name: '/danh_sach_duong_pho', page: ListStreetsScreen(),roles: ['admin']),
    RouteToPage(name: '/danh_sach_khach_hang', page: ListCustomersScreen(),roles: ['admin','operation']),
    RouteToPage(name: '/type', page: TypeScreen(),roles: ['admin','operation','manager']),
    RouteToPage(name: '/admin_history', page: AdminHistoryView(),roles: ['admin']),
  ];
  final List<GetPage> _route = _routeToPage.map((route) => GetPage(name: route.name, page: () => route.page)).toList();

  final List<RouteModel> _navbar = [
  //   RouteModel(route: '/bao_cao', label: 'B??o c??o',group: '/bao_cao',screen: const ListReportScreen(),children: [
  //     RouteModel(route: '/bao_cao_nhap_kho', label: 'B??o c??o nh???p kho',group: '/bao_cao',children: [],screen: const ReportImportScreen()),
  //     RouteModel(route: '/bao_cao_xuat_kho', label: 'B??o c??o xu???t kho',group: '/bao_cao',children: [],screen: const ReportExportScreen()),
  //     RouteModel(route: '/bao_cao_van_chuyen', label: 'B??o c??o v???n chuy???n',group: '/bao_cao',children: [],screen: const ReportTransportScreen()),
  //     RouteModel(route: '/bao_cao_loi', label: 'B??o c??o l???i',group: '/bao_cao',children: [],screen: const ReportErrorScreen()),
  //     RouteModel(route: '/bao_cao_thong_tin_lo', label: 'B??o c??o th??ng tin l??',group: '/bao_cao',children: [],screen: const ReportLotScreen()),
  //     RouteModel(route: '/bao_cao_thong_tin_lo_unit', label: 'B??o c??o th??ng tin Lot Unit',group: '/bao_cao',children: [],screen: const ReportUnitLotScreen()),
  //     RouteModel(route: '/bao_cao_thong_tin_kho', label: 'B??o c??o t???n kho',group: '/bao_cao',children: [],screen: const ReportWareHouseScreen()),
  //     RouteModel(route: '/bao_cao_thong_tin_don_hang', label: 'B??o c??o th??ng tin ????n h??ng',group: '/bao_cao',children: [],screen: const ReportOrderScreen()),
  //   ]),
    RouteModel(route: '/cau_hinh', label: 'C???u h??nh',group: '/cau_hinh',children: [
      RouteModel(route: '/cau_hinh_tai_khoan', label: 'C???u h??nh t??i kho???n',group: '/cau_hinh',children: [],screen: ConfigAccountScreen()),
      RouteModel(route: '/type', label: 'Lo???i',group: '/cau_hinh',children: [],screen: TypeScreen()),
    ],screen: ConfigAccountScreen()),
    RouteModel(route: '/danh_sach_duong_pho', label: 'Danh s??ch ???????ng ph???',children: [],group: '/danh_sach_duong_pho',screen: ListStreetsScreen()),
    RouteModel(route: '/danh_sach_khach_hang', label: 'Danh s??ch kh??ch h??ng',children: [],group: '/danh_sach_khach_hang',screen: ListCustomersScreen()),
    RouteModel(route: '/admin_history', label: 'L???ch s???',group: '/lich_su',children: [],screen: AdminHistoryView()),

  //   RouteModel(route: '/qr_code', label: 'QR Code',children: [],group: '/qr_code',screen: const QrCodeScreen()),

  ];
  List<GetPage> get getRoute => [
    // GetPage(name: '/order', page: () => ResponsiveOrderPage(desktopBody: const OrderPage(), mobileBody: const OrderMobilePage())),
    // GetPage(name: '/search_order', page: () => const SearchOrderPage()),
    // GetPage(name : '/dang_ky_don_hang', page: () => const AddProduct()),
    GetPage(name : '/', page: () => const SplashScreen()),
    GetPage(name : '/home', page: () => HomeScreen()),
    GetPage(name : '/permission_denied', page: () => const PermissionDeniedScreen()),
    GetPage(name : '/login', page: () => LogInPage())
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
        if(route.roles.isEmpty || route.roles.contains(appController.role)){
          list.add(model);
        }
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