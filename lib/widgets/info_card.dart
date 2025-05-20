import 'package:flutter/material.dart';
import 'package:bag_about_us/theme/app_theme.dart';
import 'package:get/get.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final String? imageUrl;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool useGradient;
  final bool useGlassmorphism;
  final EdgeInsetsGeometry? padding;
  final double? height;
  
  const InfoCard({
    Key? key,
    required this.title,
    required this.content,
    this.imageUrl,
    this.icon,
    this.onTap,
    this.useGradient = true,
    this.useGlassmorphism = false,
    this.padding,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultPadding = AppTheme.getResponsivePadding(context);
    
    return Hero(
      tag: 'card-$title',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLg),
          child: AnimatedContainer(
            duration: AppTheme.animDurationMedium,
            height: height,
            decoration: useGlassmorphism
                ? AppTheme.getGlassDecoration(isDark: isDark)
                : useGradient
                    ? AppTheme.getGradientCardDecoration(isDark: isDark)
                    : BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.circular(AppTheme.borderRadiusLg),
                        border: Border.all(
                          color: isDark ? AppTheme.cardBorder : AppTheme.lightCardBorder,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isDark
                                ? Colors.black.withOpacity(0.3)
                                : Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
            child: Padding(
              padding: padding ?? defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (imageUrl != null) ...[
                    _buildImage(context),
                    SizedBox(height: AppTheme.spacingMd),
                  ],
                  _buildHeader(context),
                  SizedBox(height: AppTheme.spacingMd),
                  Expanded(
                    child: Text(
                      content,
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildImage(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMd),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 40,
                        color: Colors.white70,
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingSm),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusSm),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
          SizedBox(width: AppTheme.spacingMd),
        ],
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
