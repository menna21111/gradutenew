import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation/core/custom_loading_widget.dart';
import 'package:graduation/features/categories/presentation/views/widgets/customcard.dart';
import 'package:graduation/features/search/presentation/manager/searh_cubit.dart';
import 'package:graduation/features/search/presentation/manager/searh_state.dart';

class SearhResultGrid extends StatelessWidget {
  const SearhResultGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(listener: (context, state) {
      if (state is SearchFailure) {
        GoRouter.of(context).push('/Information');
      }
    }, builder: (context, state) {
      if (state is SearchSuccess) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (MediaQuery.of(context).size.width * .431) /
                (MediaQuery.of(context).size.height * .253),
            crossAxisCount: 2,
            crossAxisSpacing: 22,
            mainAxisSpacing: 15,
          ),
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, x) {
            return CustomCard(
              imglink: 'assets/img/landmarks/${state.landmark[x].imageCover!}',
              text: state.landmark[x].name!,
              onTap: () => GoRouter.of(context)
                  .push('/Information', extra: state.landmark[x]),
            );
          },
          itemCount: state.landmark.length,
        );
      } else if (state is SearchLoading) {
        return const CustomLoadingWidget();
      } else {
        return const SizedBox();
      }
    });
  }
}
