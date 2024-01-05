part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel wishlistItem;
  HomeProductWishlistButtonClickedEvent({
    required this.wishlistItem,
  });
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel cartItem;
  HomeProductCartButtonClickedEvent({
    required this.cartItem,
  });
}

class HomeWishlitButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}


