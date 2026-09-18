import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuri_sale/core/constants/app_colors.dart';
import 'package:yuri_sale/core/constants/app_sizes.dart';
import 'package:yuri_sale/core/constants/app_strings.dart';
import 'package:yuri_sale/core/theme/theme_color_extension.dart';
import 'package:yuri_sale/core/widgets/common_icon_widget.dart';
import 'package:yuri_sale/core/widgets/common_network_image.dart';
import 'package:yuri_sale/core/widgets/common_outline_button.dart';
import 'package:yuri_sale/core/widgets/common_text_widget.dart';
import 'package:yuri_sale/features/product/data/model/product.dart';
import 'package:yuri_sale/features/product/presentation/bloc/product_bloc.dart';
import 'package:yuri_sale/features/product/presentation/bloc/product_event.dart';
import 'package:yuri_sale/features/product/presentation/bloc/product_state.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTapAddCart;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTapAddCart,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // final bool hasWarehouseStock = product.warehouseStock.isNotEmpty;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSizes.p12),
        decoration: BoxDecoration(
          color: context.greyFA,
          // border: Border.all(color: context.greyC8),
          borderRadius: BorderRadius.circular(AppSizes.r12),
          boxShadow: [
            BoxShadow(
              color: context.black.withValues(alpha: 0.1),
              offset: Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ------------------------------------------------------------
            // Product Image
            // ------------------------------------------------------------
            Center(
              child: CommonNetworkImage(
                height: AppSizes.image80,
                width: AppSizes.image80,
                imageUrl: product.image,
              ),
            ),

            AppSizes.h8,

            // ------------------------------------------------------------
            // Product Name
            // ------------------------------------------------------------
            CommonTextWidget(
              title: product.name,
              color: context.black,
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.f14,
              maxLines: 3,
              overFlow: TextOverflow.ellipsis,
            ),

            AppSizes.h2,
            /*
            // ------------------------------------------------------------
            // Company Name
            // ------------------------------------------------------------
            if (product.company.name?.isNotEmpty ?? false)
              CommonTextWidget(
                title: product.company.name ?? '',
                color: context.grey89,
                fontWeight: FontWeight.w500,
                fontSize: AppSizes.f10,
                maxLines: 1,
                overFlow: TextOverflow.ellipsis,
              ),

            if (product.company.name?.isNotEmpty ?? false) AppSizes.h2,*/

            // ------------------------------------------------------------
            // Price
            // ------------------------------------------------------------
            CommonTextWidget(
              title: '${product.currencySymbol} ${product.listPrice}',
              color: context.primaryRedColor,
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.f12,
              maxLines: 1,
              overFlow: TextOverflow.ellipsis,
            ),

            // ------------------------------------------------------------
            // Stock + Cart Button
            // ------------------------------------------------------------
            AppSizes.h4,
            CommonTextWidget(
              title:
                  '${AppStringsConstants.stock}'
                  '\t${AppStringsConstants.colon}'
                  '\t${product.totalStock.onHand.toInt()}',
              color: AppColorsConstants.green,
              fontWeight: FontWeight.w500,
              fontSize: AppSizes.f10,
              maxLines: 2,
              overFlow: TextOverflow.ellipsis,
            ),
            /* Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CommonTextWidget(
                      title:
                          '${AppStringsConstants.stock}'
                          '\t${AppStringsConstants.colon}'
                          '\t${product.totalStock.onHand.toInt()}',
                      color: AppColorsConstants.green,
                      fontWeight: FontWeight.w500,
                      fontSize: AppSizes.f10,
                      maxLines: 2,
                      overFlow: TextOverflow.ellipsis,
                    ),
                  ),
                ),



                // --------------------------------------------------------
                // Add To Cart / Go To Cart
                // --------------------------------------------------------
                  BlocBuilder<ProductBloc, ProductState>(
                  buildWhen: (previous, current) =>
                      previous.loadingProductId != current.loadingProductId ||
                      previous != current,
                  builder: (context, state) {
                    final bool isLoading = state.loadingProductId == product.id;

                    return Expanded(
                      child: CommonOutlineButton(
                        strokeWidth: AppSizes.s2,
                        circularSize: AppSizes.s8,
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.p4),
                        sizedBoxWidth: AppSizes.w4,
                        imageHeight: AppSizes.image10,
                        imageWidth: AppSizes.image10,
                        isLoading: isLoading,
                        onTap: isLoading ? null : onTapAddCart,
                        borderRadius: AppSizes.r4,
                 imagePath: product.alreadyInCart
                            ? null
                            : AppImagesConstants.plusCircleIcon,
                        title: product.alreadyInCart
                            ? AppStringsConstants.goToCart
                            : AppStringsConstants.addToCart,
                        height: AppSizes.s16,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSizes.f8,
                        borderColor: context.primaryRedColor,
                        textColor: context.primaryRedColor,
                      ),
                    );
                  },
                ),
              ],
            ),*/

            AppSizes.h10,
            BlocBuilder<ProductBloc, ProductState>(
              buildWhen: (previous, current) {
                return previous.loadingProductId != current.loadingProductId ||
                    previous.cartQuantities != current.cartQuantities;
              },
              builder: (context, state) {
                final bool isLoading = state.loadingProductId == product.id;

                final bool isInCart = product.alreadyInCart;
                final num quantity = state.cartQuantities[product.id] ?? 1;

                // ==========================================================
                // GO TO CART / QUANTITY
                // ==========================================================

                if (isInCart) {
                  return Container(
                    height: AppSizes.s32,
                    padding: EdgeInsets.all(AppSizes.p4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.r8),
                      border: Border.all(color: context.greyC8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // ------------------------------------------------
                        // MINUS
                        // ------------------------------------------------

                        CommonIconWidget(
                          onTap: quantity <= 1
                              ? null
                              : () {
                                  context.read<ProductBloc>().add(
                                    DecreaseProductQuantity(
                                      productId: product.id,
                                    ),
                                  );
                                },
                          icon: Icons.remove,
                          size: AppSizes.icon24,
                          color: quantity <= 1 ? context.greyC8 : context.black,
                        ),

                        // ------------------------------------------------
                        // QUANTITY
                        // ------------------------------------------------
                        CommonTextWidget(
                          title: quantity.toInt().toString(),
                          fontSize: AppSizes.f14,
                          fontWeight: FontWeight.w600,
                        ),

                        // ------------------------------------------------
                        // PLUS
                        // ------------------------------------------------
                        CommonIconWidget(
                          onTap: () {
                            context.read<ProductBloc>().add(
                              IncreaseProductQuantity(productId: product.id),
                            );
                          },
                          icon: Icons.add,
                          size: AppSizes.icon24,
                        ),
                      ],
                    ),
                  );
                }

                // ==========================================================
                // ADD TO CART
                // ==========================================================

                return CommonOutlineButton(
                  strokeWidth: AppSizes.s2,
                  circularSize: AppSizes.s12,
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.p4),
                  sizedBoxWidth: AppSizes.w4,
                  imageHeight: AppSizes.image10,
                  imageWidth: AppSizes.image10,
                  isLoading: isLoading,
                  onTap: onTapAddCart,
                  borderRadius: AppSizes.r8,
                  title: AppStringsConstants.addToCart,
                  height: AppSizes.s32,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.f14,
                  borderColor: context.primaryRedColor,
                  textColor: context.primaryRedColor,
                );
              },
            ),

            /*  // ------------------------------------------------------------
            // Warehouse
            // ------------------------------------------------------------
            if (hasWarehouseStock) ...[
              AppSizes.h4,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonIconWidget(
                    icon: Icons.location_on_outlined,
                    size: AppSizes.icon14,
                    color: context.black,
                  ),
                  AppSizes.w4,
                  Expanded(
                    child: CommonTextWidget(
                      title: product.warehouseStock.first.warehouseName,
                      color: context.black,
                      fontWeight: FontWeight.w400,
                      fontSize: AppSizes.f12,
                      maxLines: 1,
                      overFlow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],*/
          ],
        ),
      ),
    );
  }
}
