import '../../../models/coin.dart';

abstract class CoinsState {
  const CoinsState();
}

// Начальное состояние
class CoinsInitialState extends CoinsState {}

// Состояние загрузки
class CoinsLoadingState extends CoinsState {}

// Состояние успешного получения данных
class CoinsSuccessState extends CoinsState {
  final List<Coin> coins;

  const CoinsSuccessState({required this.coins});
}

// Состояние ошибки при получении данных
class CoinsErrorState extends CoinsState {
  final String errorMessage;

  const CoinsErrorState({required this.errorMessage});
}
