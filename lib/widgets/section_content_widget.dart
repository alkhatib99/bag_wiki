import 'package:flutter/material.dart';
import 'package:bag_about_us/models/section_model.dart';
import 'package:bag_about_us/theme/app_theme.dart';
import 'package:bag_about_us/widgets/accessibility_widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class SectionContentWidget extends StatelessWidget {
  final SectionModel section;
  final bool isMobile;

  const SectionContentWidget({
    Key? key,
    required this.section,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < AppTheme.tabletBreakpoint;
        final padding = isNarrow
            ? const EdgeInsets.all(AppTheme.spacingMd)
            : const EdgeInsets.all(AppTheme.spacingXl);

        return Container(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (section.imageUrl != null)
                _buildBannerImage(context, isNarrow),
              AnimatedContainer(
                duration: AppTheme.animDurationMedium,
                margin: EdgeInsets.only(
                  top: section.imageUrl != null ? AppTheme.spacingXl : 0,
                  bottom: AppTheme.spacingMd,
                ),
                child: _buildSectionTitle(context),
              ),
              AnimatedContainer(
                duration: AppTheme.animDurationMedium,
                margin: const EdgeInsets.symmetric(vertical: AppTheme.spacingMd),
                child: (section.id == 'faq')
                    ? buildFAQSection(section)
                    : _buildContentCard(context, isDark),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBannerImage(BuildContext context, bool isNarrow) {
    final height = isNarrow ? 180.0 : 240.0;

    return Hero(
      tag: 'banner-${section.id}',
      child: Container(
        width: double.infinity,
        height: height,
        margin: const EdgeInsets.only(bottom: AppTheme.spacingMd),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLg),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLg),
          child: Stack(
            children: [
              // Banner image
              Positioned.fill(
                child: AccessibleImage(
                  imageUrl: section.imageUrl!,
                  semanticLabel: '${section.title} banner image',
                  fit: BoxFit.cover,
                ),
              ),
              // Gradient overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.6],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title with animated gradient
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppTheme.textWhite, AppTheme.highlightPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: AccessibleText(
            text: section.title,
            style: Theme.of(context).textTheme.displaySmall,
            semanticLabel: 'Section title: ${section.title}',
          ),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        // Animated divider
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 80),
          duration: AppTheme.animDurationSlow,
          builder: (context, value, child) {
            return Container(
              width: value,
              height: 4,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildContentCard(BuildContext context, bool isDark) {
    return AnimatedContainer(
      duration: AppTheme.animDurationMedium,
      padding: const EdgeInsets.all(AppTheme.spacingLg),
      decoration: AppTheme.getGradientCardDecoration(isDark: isDark),
      child: Linkify(
        onOpen: (link) async {
          final url = Uri.parse(link.url);
          if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
            throw 'Could not launch $url';
          }
        },
        text: section.content,
        style: Theme.of(context).textTheme.bodyLarge,
        linkStyle: const TextStyle(
          color: Colors.blueAccent,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

Widget buildFAQSection(SectionModel faqSection) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        faqSection.title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      ...?faqSection.faqItems?.map(
        (item) => ExpansionTile(
          title: Text(item.question,
              style: TextStyle(fontWeight: FontWeight.w600)),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(item.answer),
            ),
          ],
        ),
      ),
    ],
  );
}
