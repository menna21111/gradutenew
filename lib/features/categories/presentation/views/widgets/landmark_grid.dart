import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation/core/widgets/custom_error_msg.dart';
import 'package:graduation/features/categories/presentation/manger/landmarks_cubit/landmarks_cubit_cubit.dart';
import 'package:graduation/features/categories/presentation/views/widgets/customcard.dart';

import '../../../../../core/widgets/loading_widget.dart';

class LandMarkGrid extends StatelessWidget {
  const LandMarkGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandmarksCubitCubit, LandmarksCubitState>(
      builder: (context, state) {
        if (state is LandmarksCubitSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 11, right: 17),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.landmarklist.length,
              clipBehavior: Clip.none,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (MediaQuery.of(context).size.width * .431) /
                    (MediaQuery.of(context).size.height * .253),
                crossAxisCount: 2,
                crossAxisSpacing: 22,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return CustomCard(
                  imglink:
                      'assets/img/landmarks/${state.landmarklist[index].imageCover!}',
                  text: state.landmarklist[index].name!,
                  onTap: () => GoRouter.of(context)
                      .push('/Information', extra: state.landmarklist[index]),
                );
              },
            ),
          );
        } else if (state is LandmarksCubitFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(child: LoadingWidget());
        }
      },
    );
  }
}
