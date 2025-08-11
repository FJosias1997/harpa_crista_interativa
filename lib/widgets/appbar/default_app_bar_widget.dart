import 'package:flutter/material.dart';
import 'package:harpa_crista_app/extensions/context_extensions.dart';

class DefaultAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool? isLeading;
  final bool? enableLogo;
  final bool? isTransparent;
  const DefaultAppBarWidget({
    this.title,
    this.isLeading,
    this.enableLogo = false,
    this.isTransparent,
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<DefaultAppBarWidget> createState() => _DefaultAppBarWidgetState();
}

class _DefaultAppBarWidgetState extends State<DefaultAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title ?? '',
        style: context.theme.textTheme.titleLarge?.copyWith(
          color: context.theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor:
          widget.isTransparent == true
              ? Colors.transparent
              : context.theme.colorScheme.primary,
      automaticallyImplyLeading: widget.isLeading ?? true,
    );
  }
}
