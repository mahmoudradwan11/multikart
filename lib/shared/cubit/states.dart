abstract class MultikartStates{}
class InitialMultikart extends MultikartStates{}
class ChangeScreen extends MultikartStates{}
class UserUpdateError extends MultikartStates{}
class UserUpdateLoading extends MultikartStates{}
class GetUserSuccessState extends MultikartStates{}
class GetUserErrorState extends MultikartStates{
  final String error;

  GetUserErrorState(this.error);
}
class CreateDataBaseState extends MultikartStates {}

class ErrorCreateDataBaseState extends MultikartStates {}

class InsertWishState extends MultikartStates{}

class ErrorInsertWishState extends MultikartStates{}

class GetWishState extends MultikartStates {}

class ErrorGetWishState extends MultikartStates {}

class InsertCartState extends MultikartStates{}

class ErrorInsertCardState extends MultikartStates{}

class GetCardState extends MultikartStates{}

class ErrorGetCardState extends MultikartStates{}

class DeleteWishState extends MultikartStates {}

class DeleteCardState extends MultikartStates{}

class ChangeSize extends MultikartStates{}

class ChangeQuantity extends MultikartStates{}
