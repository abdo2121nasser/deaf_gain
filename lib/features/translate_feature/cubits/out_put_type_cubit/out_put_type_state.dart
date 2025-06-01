part of 'out_put_type_cubit.dart';

@immutable
sealed class OutPutTypeState {
  final OutPutTypeEnum outPutType;

  const OutPutTypeState({required this.outPutType});

}

final class ChangeOutPutTypeState extends OutPutTypeState {

  ChangeOutPutTypeState({required super.outPutType});
}

