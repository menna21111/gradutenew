import 'package:flutter/material.dart';
import 'package:graduation/core/widgets/appbar.dart';
import 'package:graduation/features/categories/data/model/landmark_on_cat_model/landmark_on_cat_model.dart';
import 'package:graduation/features/categories/presentation/views/widgets/info_img.dart';
import 'package:graduation/features/categories/presentation/views/widgets/information.dart';
import 'package:graduation/features/categories/presentation/views/widgets/name_location.dart';
import 'package:graduation/features/home/data/models/most_visited_model/most_visited_model.dart';

class InfViewBody extends StatelessWidget {
  const InfViewBody(
      {super.key, this.landmarkoncatModel, this.mostVisitedModel});
  final LandmarkOnCatModel? landmarkoncatModel;
  final MostVisitedModel? mostVisitedModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              InfoImg(
                imagelink:
                    'assets/img/landmarks/${(landmarkoncatModel?.imageCover ?? mostVisitedModel?.imageCover)!}',
              ),
              CustomNameLocation(
                name: (landmarkoncatModel?.name ?? mostVisitedModel?.name)!,
                location: (landmarkoncatModel?.location?.governorate ??
                    mostVisitedModel?.location?.governorate)!,
              ),
              Information(
                  text: (landmarkoncatModel?.description ??
                      mostVisitedModel?.description)!),
            ],
          ),
        ));
  }
}
