import 'package:injectable/injectable.dart';
import 'package:exercise/core/providers/base_state_notifier.dart';
import 'package:exercise/core/usecases/empty_params.dart';
import 'package:exercise/home/domain/usecase/fetch_fact_usecase.dart';
import 'package:exercise/home/presentation/models/home_errors.dart';
import 'package:exercise/home/presentation/provider/home_state.dart';

@injectable
class HomeProvider extends BaseStateNotifier<HomeState> {
  HomeProvider({
    required GetFactUseCase getFactUseCase,
  })  : _getFactUseCase = getFactUseCase,
        super(const HomeState());

  final GetFactUseCase _getFactUseCase;

  @override
  Future<void> onInit() async {
    final factResult = await _getFactUseCase(const EmptyParams());

    if (factResult.failure != null || factResult.data == null) {
      state = state.copyWith(
        isLoading: false,
        errors: const HomeErrors(isFetchError: true),
      );

      return;
    }

    state = state.copyWith(isLoading: false, fact: factResult.data);
  }
}
