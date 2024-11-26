abstract class CoinsEvent {
  const CoinsEvent();
}

// Событие загрузки монет
class FetchCoinsEvent extends CoinsEvent {}

// Событие обновления
class RefreshCoinsEvent extends CoinsEvent {
  final String vsCurrency;

  const RefreshCoinsEvent({required this.vsCurrency});
}
