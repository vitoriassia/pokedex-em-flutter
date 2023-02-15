import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/core/shared/presentation/message_to_failure_converter/failure_to_message_converter.dart';
import 'package:pokedex_app/app/core/shared/presentation/message_to_failure_converter/impl/default_failure_to_message_converter.dart';
import 'package:pokedex_app/app/core/shared/presentation/message_to_failure_converter/impl/server_failure_to_message_converter.dart';

class FailureToMessageConverterFactory {
  final Failure failure;
  FailureToMessageConverterFactory(this.failure);

  FailureToMessageConverter call() {
    if (failure is ServerFailure) {
      return ServerFailureMessageConverter()(failure as ServerFailure);
    } else {
      return DefaultFailureToMessageConverter();
    }
  }
}
