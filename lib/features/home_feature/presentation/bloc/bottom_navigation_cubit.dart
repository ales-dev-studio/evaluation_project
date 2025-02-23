import 'package:bloc/bloc.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationState(selectedIndex: 0));

  Future<void> onBottomNavigationItemTap({
    required final int index,
  }) async {
    emit(state.copyWith(selectedIndex: index));
  }
}
