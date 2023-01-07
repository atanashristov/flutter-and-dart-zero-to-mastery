import 'package:adviser/2_application/pages/adviser/bloc/adviser_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

void main() {
  group('AdviserBloc', () {
    group('should emit', () {
      blocTest<AdviserBloc, AdviserState>(
        'nothing when no event is added',
        build: () => AdviserBloc(),
        act: (bloc) {},
        expect: () => const <AdviserState>[],
      );

      blocTest<AdviserBloc, AdviserState>(
        '[AdviserStateLoading, AdviserStateError] when AdviceRequestedEvent is added',
        build: () => AdviserBloc(),
        act: (bloc) => bloc.add(AdviceRequestedEvent()),
        wait: const Duration(seconds: 3),
        expect: () => <AdviserState>[
          AdviserStateLoading(),
          const AdviserStateError(message: 'Oops, not good my man!'),
        ],
      );
    });
  });
}
