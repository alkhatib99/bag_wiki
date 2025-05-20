import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bag_about_us/controllers/navigation_controller.dart';
import 'package:bag_about_us/controllers/content_controller.dart';
import 'package:bag_about_us/controllers/theme_controller.dart';
import 'package:bag_about_us/widgets/sidebar_widget.dart';
import 'package:bag_about_us/widgets/section_content_widget.dart';
import 'package:bag_about_us/widgets/custom_button.dart';
import 'package:bag_about_us/widgets/accessibility_widgets.dart';
import 'package:bag_about_us/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());
  final ContentController contentController = Get.put(ContentController());
  final ThemeController themeController = Get.find<ThemeController>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sidebarItems = contentController.sections
        .map((section) => SidebarItem(
              title: section.title,
              id: section.id,
            ))
        .toList();

    return Scaffold(
      appBar: _buildMobileAppBar(context),
      drawer: MediaQuery.of(context).size.width < AppTheme.tabletBreakpoint
          ? Drawer(
              child: SidebarWidget(
                items: sidebarItems,
                controller: navigationController,
                isMobile: true,
              ),
            )
          : null,
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context, sidebarItems),
        tablet: _buildTabletLayout(context, sidebarItems),
        desktop: _buildDesktopLayout(context, sidebarItems),
      ),
    );
  }

  AppBar? _buildMobileAppBar(BuildContext context) {
    if (MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint) {
      return null;
    }

    return AppBar(
      title: const AccessibleText(
        text: 'BAG Guild Wiki',
        semanticLabel: 'BAG Guild Wiki Homepage',
      ),
      actions: [
        IconButton(
          icon: Obx(() => Icon(
                themeController.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode,
              )),
          onPressed: themeController.toggleTheme,
          tooltip: 'Toggle theme',
        ),
        // Profile icon removed as requested
      ],
    );
  }

  Widget _buildMobileLayout(
      BuildContext context, List<SidebarItem> sidebarItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: AppTheme.getResponsivePadding(context),
              child: Obx(() {
                final selectedIndex = navigationController.selectedIndex.value;
                if (selectedIndex >= 0 &&
                    selectedIndex < contentController.sections.length) {
                  return SectionContentWidget(
                    section: contentController.sections[selectedIndex],
                    isMobile: true,
                  );
                }
                return const Center(child: Text('Section not found'));
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(
      BuildContext context, List<SidebarItem> sidebarItems) {
    return Row(
      children: [
        SidebarWidget(
          items: sidebarItems,
          controller: navigationController,
          isMobile: false,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: AppTheme.getResponsivePadding(context),
                    child: Obx(() {
                      final selectedIndex =
                          navigationController.selectedIndex.value;
                      if (selectedIndex >= 0 &&
                          selectedIndex < contentController.sections.length) {
                        return SectionContentWidget(
                          section: contentController.sections[selectedIndex],
                          isMobile: false,
                        );
                      }
                      return const Center(child: Text('Section not found'));
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(
      BuildContext context, List<SidebarItem> sidebarItems) {
    return Row(
      children: [
        SidebarWidget(
          items: sidebarItems,
          controller: navigationController,
          isMobile: false,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: AppTheme.getResponsivePadding(context),
                    child: Obx(() {
                      final selectedIndex =
                          navigationController.selectedIndex.value;
                      if (selectedIndex >= 0 &&
                          selectedIndex < contentController.sections.length) {
                        return SectionContentWidget(
                          section: contentController.sections[selectedIndex],
                          isMobile: false,
                        );
                      }
                      return const Center(child: Text('Section not found'));
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTheme.spacingLg),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AccessibleText(
            text: 'BAG Guild Wiki',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            semanticLabel: 'BAG Guild Wiki Homepage',
          ),
          Row(
            children: [
              IconButton(
                icon: Obx(() => Icon(
                      themeController.isDarkMode.value
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    )),
                onPressed: themeController.toggleTheme,
                tooltip: 'Toggle theme',
              ),
              const SizedBox(width: AppTheme.spacingMd),
              // CustomButton(
              //   text: 'Connect Wallet',
              //   onPressed: () {},
              //   icon: Icons.account_balance_wallet,
              //   isPrimary: true,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
