import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bag_about_us/controllers/navigation_controller.dart';
import 'package:bag_about_us/theme/app_theme.dart';
import 'package:bag_about_us/widgets/accessibility_widgets.dart';
import 'package:flutter/services.dart';

class SidebarItem {
  final String title;
  final String id;
  final IconData? icon;

  SidebarItem({required this.title, required this.id, this.icon});
}

class SidebarWidget extends StatelessWidget {
  final List<SidebarItem> items;
  final NavigationController controller;
  final bool isMobile;

  const SidebarWidget({
    Key? key,
    required this.items,
    required this.controller,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = isMobile ? double.infinity : 250.0;

    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.purpleGradientStart,
            AppTheme.deepPurple,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(5, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingLg),
            child: _buildHeader(context),
          ),
          const SizedBox(height: AppTheme.spacingLg),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingLg),
            child: _buildDivider(),
          ),
          const SizedBox(height: AppTheme.spacingMd),
          Expanded(
            child: _buildNavItems(context, isDark),
          ),
          const SizedBox(height: AppTheme.spacingMd),
          // if (!isMobile) _buildConnectWalletButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppTheme.accentGradient,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.accentMagenta.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppTheme.accentMagenta,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
              ),
            )),
        const SizedBox(width: AppTheme.spacingMd),
        const AccessibleText(
          text: 'BAG Wiki',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
          semanticLabel: "BAG Wiki navigation",
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.05),
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.05),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItems(BuildContext context, bool isDark) {
    return ListView.builder(
      itemCount: items.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Obx(() {
          final isSelected = controller.selectedIndex.value == index;
          return AnimatedContainer(
            duration: AppTheme.animDurationMedium,
            margin: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingSm,
              vertical: AppTheme.spacingXs,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusMd),
              gradient: isSelected
                  ? LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  : null,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: CustomFocusableActionDetector(
              onPressed: () {
                controller.changeIndex(index);
                if (isMobile) {
                  Navigator.pop(context);
                }
                HapticFeedback.lightImpact();
              },
              tooltip: 'Navigate to ${items[index].title}',
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingMd,
                  vertical: AppTheme.spacingMd,
                ),
                child: Row(
                  children: [
                    if (items[index].icon != null)
                      Icon(
                        items[index].icon,
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                        size: 18,
                      ),
                    if (items[index].icon != null)
                      const SizedBox(width: AppTheme.spacingMd),
                    Expanded(
                      child: AccessibleText(
                        text: items[index].title,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.white.withOpacity(0.7),
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 15,
                        ),
                        semanticLabel: 'Navigation item: ${items[index].title}',
                      ),
                    ),
                    if (isSelected) ...[
                      Container(
                        width: 4,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  // Widget _buildConnectWalletButton(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingLg),
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(
  //         horizontal: AppTheme.spacingMd,
  //         vertical: AppTheme.spacingMd,
  //       ),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(AppTheme.borderRadiusMd),
  //         color: Colors.white.withOpacity(0.1),
  //         border: Border.all(
  //           color: Colors.white.withOpacity(0.05),
  //         ),
  //       ),
  //       child:

  //        CustomFocusableActionDetector(
  //         onPressed: () {
  //           HapticFeedback.mediumImpact();
  //         },
  //         tooltip: 'Connect your wallet',
  //         child: Row(
  //           children: [
  //             Container(
  //               padding: const EdgeInsets.all(AppTheme.spacingSm),
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 color: AppTheme.accentGreen,
  //               ),
  //               child: const Icon(
  //                 Icons.wallet,
  //                 color: Colors.white,
  //                 size: 16,
  //               ),
  //             ),
  //             const SizedBox(width: AppTheme.spacingMd),

  //             //  AccessibleText(
  //             //   text: 'Connect Wallet',
  //             //   style: TextStyle(
  //             //     color: Colors.white,
  //             //     fontWeight: FontWeight.bold,
  //             //   ),
  //             //   semanticLabel: 'Connect your wallet button',
  //             // ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
