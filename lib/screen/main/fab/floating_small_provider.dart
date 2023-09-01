import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isFloatingButtonSmallProvider = StateNotifierProvider<IsFloatingButtonSmall, bool>((ref) {
  final isExpanded = ref.watch(floatingExpandedProvider);
  return IsFloatingButtonSmall(isExpanded ? true : null);
});

class IsFloatingButtonSmall extends StateNotifier<bool> {
  IsFloatingButtonSmall([bool? isExpanded]) : super(isExpanded ?? false);

  void change(WidgetRef ref, bool isSmall) {
    final isExpanded = ref.read(floatingExpandedProvider);
    if (isExpanded) {
      state = true;
    } else {
      state = isSmall;
    }
  }
}
