import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fab/floating_small_provider.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({super.key});

  @override
  ConsumerState<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      final isSmall = ref.read(isFloatingButtonSmallProvider);
      if (scrollController.position.pixels > 100 && !isSmall) {
        ref.read(isFloatingButtonSmallProvider.notifier).change(ref, true);
      } else if (scrollController.position.pixels < 100 && isSmall) {
        ref.read(isFloatingButtonSmallProvider.notifier).change(ref, false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        Container(height: 500, color: Colors.red),
        Container(height: 500, color: Colors.blue),
        Container(height: 500, color: Colors.red),
        Container(height: 500, color: Colors.blue),
        Container(height: 500, color: Colors.red),
        Container(height: 500, color: Colors.blue),
      ],
    );
  }
}
