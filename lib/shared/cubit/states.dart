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
