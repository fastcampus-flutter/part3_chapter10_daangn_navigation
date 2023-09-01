import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/fab/floating_small_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final floatingExpandedProvider = StateProvider((ref) {
  return false;
});

class FloatingDaangnButton extends ConsumerStatefulWidget {
  const FloatingDaangnButton({super.key});

  @override
  ConsumerState<FloatingDaangnButton> createState() => _FloatingDaangnButtonState();
}

class _FloatingDaangnButtonState extends ConsumerState<FloatingDaangnButton> {
  @override
  Widget build(BuildContext context) {
    final isExpanded = ref.watch(floatingExpandedProvider);
    final isSmall = ref.watch(isFloatingButtonSmallProvider);
    return Stack(
      children: [
        Positioned.fill(
            child: IgnorePointer(
          ignoring: !isExpanded,
          child: AnimatedContainer(
            duration: 300.ms,
            color: isExpanded ? Colors.black.withOpacity(0.3) : Colors.transparent,
          ),
        )),
        Align(
          alignment: Alignment.bottomRight,
          child: Tap(
            onTap: () {
              ref.read(floatingExpandedProvider.notifier).state = !isExpanded;
            },
            child: AnimatedContainer(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              duration: 100.ms,
              decoration:
                  BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add),
                  AnimatedWidthCollapse(
                    visible: !isSmall,
                    duration: 100.ms,
                    child: '글쓰기'.text.white.make(),
                  )
                ],
              ),
            ).pOnly(bottom: 80, right: 20),
          ),
        )
      ],
    );
  }
}

class AnimatedWidthCollapse extends StatelessWidget {
  final bool visible;
  final Widget child;
  final Duration duration;

  const AnimatedWidthCollapse({
    super.key,
    required this.visible,
    required this.child,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: duration,
      child: Container(
        constraints: visible
            ? const BoxConstraints(
                maxWidth: double.infinity,
              )
            : const BoxConstraints(
                maxWidth: 0.0,
              ),
        child: visible ? child : Container(),
      ),
    );
  }
}
