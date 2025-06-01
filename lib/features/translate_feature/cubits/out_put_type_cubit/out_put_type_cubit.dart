import 'package:bloc/bloc.dart';
import 'package:deaf_gain/features/translate_feature/enums/output_type_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'out_put_type_state.dart';

class OutPutTypeCubit extends Cubit<OutPutTypeState> {
  OutPutTypeCubit()
      : super(ChangeOutPutTypeState(outPutType: OutPutTypeEnum.text));
  static OutPutTypeCubit get(context) => BlocProvider.of(context);

  changeOutPutType({required OutPutTypeEnum outPutTypeEnum}) {
    emit(ChangeOutPutTypeState(outPutType: outPutTypeEnum));
  }
}
