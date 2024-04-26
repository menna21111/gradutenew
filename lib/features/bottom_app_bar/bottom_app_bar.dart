import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../../core/utils/assets.dart';
import '../../core/widgets/appbar.dart';
import '../image_upload/presentation/pages/image_upload_page.dart';
import '../../constants.dart';
import '../categories/presentation/views/categories_view.dart';
import '../home/pres/views/home_view.dart';
import '../splachview/preslayer/views/widget/custom_drawer.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedTab = 1;

  final List pages = [
    const CategoriesView(),
    const HomeView(),
    const ImagesUploadPage()
  ];

  _changeTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: pages[selectedTab],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: ksecondcolor,
        style: TabStyle.react,
        items: [
          TabItem(icon: Image.asset(AssetsData.key)),
          TabItem(icon: Image.asset(AssetsData.home)),
          TabItem(icon: Image.asset(AssetsData.camera)),
        ],
        initialActiveIndex: 1,
        onTap: (int index) => _changeTab(index),
      ),
    );
  }
}
