import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class NavItem {
  final IconData icon;
  final String label;

  const NavItem({required this.icon, required this.label});
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<NavItem> items;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Container(
      height: 71.5 + bottomInset,
      padding: EdgeInsets.fromLTRB(29, 0, 29, bottomInset),
      decoration: ShapeDecoration(
        color: colors.navBackground,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          side: BorderSide(color: colors.navBorder, width: 1),
        ),
      ),
      child: Row(
        children: List.generate(items.length, (i) {
          final selected = i == currentIndex;
          final item = items[i];
          final color = selected ? colors.navSelected : colors.navUnselected;

          return Expanded(
            child: InkWell(
              onTap: () => onTap(i),
              borderRadius: BorderRadius.circular(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.icon, size: 22, color: color),
                  if (!selected) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.navLabel(context)
                          .copyWith(color: color),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}