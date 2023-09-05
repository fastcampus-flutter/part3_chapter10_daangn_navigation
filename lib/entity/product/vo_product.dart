import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/vo_user.dart';

part 'vo_product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product(
    final User user,
    final String name,
    final int price,
    final String description,
    final ProductStatus status,
    final List<String> images,
  ) = _Product;
}
