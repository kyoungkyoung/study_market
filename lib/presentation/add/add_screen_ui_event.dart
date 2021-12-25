import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_screen_ui_event.freezed.dart';
@freezed
abstract class AddScreenUiEvent with _$AddScreenUiEvent {
  const factory AddScreenUiEvent.success() = Success;
  const factory AddScreenUiEvent.showSnackBar(String message) = ShowSnackBar;
}