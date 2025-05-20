import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:bag_about_us/theme/app_theme.dart';

class AccessibleText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final bool selectable;

  const AccessibleText({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.selectable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? Theme.of(context).textTheme.bodyLarge;
    
    // Apply text scaling based on MediaQuery
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    
    if (selectable) {
      return Semantics(
        label: semanticLabel ?? text,
        excludeSemantics: excludeFromSemantics,
        child: SelectableText(
          text,
          style: effectiveStyle,
          textAlign: textAlign,
          maxLines: maxLines,
          textScaleFactor: textScaleFactor,
        ),
      );
    }
    
    return Semantics(
      label: semanticLabel ?? text,
      excludeSemantics: excludeFromSemantics,
      child: Text(
        text,
        style: effectiveStyle,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
      ),
    );
  }
}

class AccessibleImage extends StatelessWidget {
  final String imageUrl;
  final String semanticLabel;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  
  const AccessibleImage({
    Key? key,
    required this.imageUrl,
    required this.semanticLabel,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      image: true,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(AppTheme.borderRadiusMd),
        child: Image.network(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: width,
              height: height,
              color: Theme.of(context).colorScheme.surface,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                  color: Theme.of(context).colorScheme.primary,
                  semanticsLabel: 'Loading image: $semanticLabel',
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: width,
              height: height,
              color: Theme.of(context).colorScheme.error.withOpacity(0.1),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.image_not_supported,
                      color: Theme.of(context).colorScheme.error,
                      size: 24,
                    ),
                    const SizedBox(height: AppTheme.spacingSm),
                    Text(
                      'Image not available',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomFocusableActionDetector extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final String? tooltip;
  final FocusNode? focusNode;
  final bool autofocus;
  
  const CustomFocusableActionDetector({
    Key? key,
    required this.child,
    this.onPressed,
    this.tooltip,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: onPressed != null,
      enabled: onPressed != null,
      label: tooltip,
      child: Focus(
        focusNode: focusNode,
        autofocus: autofocus,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMd),
          child: tooltip != null
              ? Tooltip(
                  message: tooltip!,
                  child: child,
                )
              : child,
        ),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  
  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AppTheme.desktopBreakpoint && desktop != null) {
          return desktop!;
        }
        
        if (constraints.maxWidth >= AppTheme.tabletBreakpoint && tablet != null) {
          return tablet!;
        }
        
        return mobile;
      },
    );
  }
}

class AnimatedPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  
  AnimatedPageRoute({
    required this.page,
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOutCubic;
      
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      
      return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
    transitionDuration: AppTheme.animDurationMedium,
  );
}
