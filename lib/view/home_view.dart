import 'package:flutter/material.dart';
import 'package:random_pass_generator/enum/strings_enum.dart';
import 'package:random_pass_generator/view_model/home_view_model.dart';
import 'package:random_pass_generator/widget/add_parameter_widget.dart';
import 'package:random_pass_generator/widget/result_container_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppStrings.appName.value, style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ResultContainerWidget(
              onPressed: fetchPassword,
              child: isLoading
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Text(AppStrings.generating.value,
                          textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleSmall),
                    )
                  : Text(
                      password,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _lenghtSlider(context),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddParameterWidget(
                  buttonColor: specialChar ? Colors.green : Colors.grey,
                  text: AppStrings.addSpecialChar.value,
                  buttonText: AppStrings.specialChar.value,
                  onPressed: () => changeSpecialChar(),
                ),
                const SizedBox(height: 10),
                AddParameterWidget(
                  buttonColor: upperCase ? Colors.green : Colors.grey,
                  text: AppStrings.addUpperCase.value,
                  buttonText: AppStrings.upperCase.value,
                  onPressed: () => changeUpperCase(),
                ),
                const SizedBox(height: 10),
                AddParameterWidget(
                  buttonColor: number ? Colors.green : Colors.grey,
                  text: AppStrings.addNumber.value,
                  buttonText: AppStrings.number.value,
                  onPressed: () => changeNumber(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _lenghtSlider(BuildContext context) {
    return Row(
      children: [
        Text(AppStrings.lenght.value, style: Theme.of(context).textTheme.titleMedium),
        Expanded(
          child: Slider(
            value: lenght.toDouble(),
            min: 6,
            max: 99.0,
            onChanged: sliderOnChanged,
          ),
        ),
        Text(lenght.toInt().toString(), style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
