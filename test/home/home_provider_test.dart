import 'package:exercise/core/errors/network_failure.dart';
import 'package:exercise/core/usecases/empty_params.dart';
import 'package:exercise/home/data/models/fact_dto.dart';
import 'package:exercise/home/domain/usecase/fetch_fact_usecase.dart';
import 'package:exercise/home/presentation/models/home_errors.dart';
import 'package:exercise/home/presentation/provider/home_provider.dart';
import 'package:exercise/home/presentation/provider/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_provider_test.mocks.dart';

@GenerateMocks([GetFactUseCase])
void main() {
  final ref = ProviderContainer();
  final getFactUseCase = MockGetFactUseCase();

  late StateNotifierProvider<HomeProvider, HomeState> provider;

  const fact = FactDTO(fact: 'fact');

  setUp(() {
    provider = StateNotifierProvider<HomeProvider, HomeState>(
      (ref) => HomeProvider(getFactUseCase: getFactUseCase),
    );
  });

  test('Check successful loading', () async {
    when(getFactUseCase.call(const EmptyParams()))
        .thenAnswer((_) async => (data: fact, failure: null));

    await expectLater(
      ref.read(provider.notifier).stream,
      emitsInOrder(
        [
          const HomeState(fact: fact, isLoading: false),
        ],
      ),
    );
  });

  test('Check unsuccessful loading', () async {
    when(getFactUseCase.call(const EmptyParams())).thenAnswer(
      (_) async => (data: null, failure: const NetworkFailure()),
    );

    await expectLater(
      ref.read(provider.notifier).stream,
      emitsInOrder(
        [
          const HomeState(
            isLoading: false,
            errors: HomeErrors(isFetchError: true),
          ),
        ],
      ),
    );
  });
}
