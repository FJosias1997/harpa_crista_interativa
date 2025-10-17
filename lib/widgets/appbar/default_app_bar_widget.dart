import 'package:flutter/material.dart';
import 'package:harpa_crista_app/extensions/context_extensions.dart';

class DefaultAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool? isLeading;
  final bool? enableLogo;
  final bool? isTransparent;
  final Function(String)? onSearch;
  const DefaultAppBarWidget({
    this.title,
    this.isLeading,
    this.enableLogo = false,
    this.isTransparent,
    this.onSearch,
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<DefaultAppBarWidget> createState() => _DefaultAppBarWidgetState();
}

class _DefaultAppBarWidgetState extends State<DefaultAppBarWidget> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          _isSearching
              ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Buscar...',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                onChanged: (value) => widget.onSearch?.call(value),
              )
              : Text(
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
      actions: [
        IconButton(
          icon: Icon(_isSearching ? Icons.close : Icons.search),
          onPressed: () {
            setState(() {
              if (_isSearching) {
                _searchController.clear();
              }
              widget.onSearch?.call('');
              _isSearching = !_isSearching;
            });
          },
        ),
      ],
    );
  }
}
