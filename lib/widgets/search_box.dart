import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const SearchBox({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Cari lapangan atau lokasi...',
        hintStyle: const TextStyle(
          color: AppTheme.textGrey,
          fontSize: 14,
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppTheme.textGrey,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            controller.clear();
            onChanged?.call('');
          },
          icon: const Icon(Icons.tune_rounded),
        ),
      ),
    );
  }
}