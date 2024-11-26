import 'package:crypto_app/services/network_service.dart';
import 'crypto_list_event.dart';
import 'crypto_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  final NetworkService networkService;

  CoinsBloc(this.networkService) : super(CoinsInitialState()) {
    // Обработчик события для получения данных
    on<FetchCoinsEvent>((event, emit) async {
      emit(CoinsLoadingState());
      try {
        final coins = await networkService.fetchCoins(
          vsCurrency: "usd",
          order: "market_cup_desc",
          perPage: 50,
          page: 1,
          sparkline: false,
          priceChangePercentage: "24h",
          locale: "en",
        );
        emit(CoinsSuccessState(coins: coins));
      } catch (error) {
        emit(CoinsErrorState(errorMessage: error.toString()));
      }
    });
  }
}
