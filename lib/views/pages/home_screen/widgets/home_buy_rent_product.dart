import 'package:cardealership/models/car_model.dart';

import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/views/global_widgets/custom_button.dart';
import 'package:cardealership/views/global_widgets/custom_spaces.dart';
import 'package:flutter/material.dart';

class BuyRentProduct extends StatelessWidget {
  const BuyRentProduct({
    super.key,
    required this.item,
  });

  final item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text("\$ ${item.price}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              const VerticalSpace(
                height: 5,
              ),
              CostomButton(
                text: AppTexts.buy,
                OnPressed: () {},
              ),
            ],
          ),
        ),
        if (item is CarModel)
          Expanded(
              child: Column(
            children: [
              Text("\$ ${item.rentPrice}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              const VerticalSpace(
                height: 5,
              ),
              CostomButton(
                text: AppTexts.rent,
                OnPressed: () {},
              ),
            ],
          )),
      ],
    );
  }
}
