part of 'customer_category_bloc.dart';

abstract class CustomerCategoryEvent extends Equatable {
  const CustomerCategoryEvent();

  @override
  List<Object> get props => [];
}

class CustomerCategoryStarted extends CustomerCategoryEvent {}

class CustomerCategorySearchChanged extends CustomerCategoryEvent {
  final String query;

  const CustomerCategorySearchChanged(this.query);

  @override
  List<Object> get props => [query];
}
