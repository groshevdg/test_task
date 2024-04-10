import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exercise/core/extensions/localization_extension.dart';
import 'package:exercise/core/providers/consumer_state_with_provider.dart';
import 'package:exercise/home/presentation/provider/home_provider.dart';
import 'package:exercise/home/presentation/provider/home_state.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState
    extends ConsumerStateWithProvider<HomeProvider, HomeState, HomePage> {
  Widget _buildBody() {
    final state = ref.watch(provider);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errors != null || state.fact == null) {
      return Center(child: Text(context.locale.homeFetchError));
    }

    return Center(
      child: Text(
        state.fact!.fact,
        style: TextStyle(fontSize: 18.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.locale.homeTitle)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: _buildBody(),
      ),
    );
  }
}
