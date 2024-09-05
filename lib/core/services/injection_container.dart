import 'package:dio/dio.dart';
import 'package:fushati/src/home/data/datasources/registration_fees_remote_data_src.dart';
import 'package:fushati/src/home/data/datasources/transaction_remote_data_src.dart';
import 'package:fushati/src/home/data/repos/card_repo_impl.dart';
import 'package:fushati/src/home/data/repos/registration_fees_repo_impl.dart';
import 'package:fushati/src/home/data/repos/transaction_repo_impl.dart';
import 'package:fushati/src/home/domain/repos/registration_fees_repo.dart';
import 'package:fushati/src/home/domain/usecases/add_card.dart';
import 'package:fushati/src/home/domain/usecases/add_card_usecase.dart';
import 'package:fushati/src/home/domain/usecases/get_registration_fees.dart';
import 'package:fushati/src/manage_card/domain/usecases/delete_card.dart';
import 'package:fushati/src/home/domain/usecases/get_card.dart';
import 'package:fushati/src/home/domain/usecases/get_cards.dart';
import 'package:fushati/src/moyasar_transfer/data/datasources/deposite_remote_data_src.dart';
import 'package:fushati/src/profile/domain/usecases/user_transactions.dart';
import 'package:fushati/src/splash/data/datasources/schools_remote_data_src.dart';
import 'package:fushati/src/splash/data/repo/school_repo_impl.dart';
import 'package:fushati/src/splash/domain/repo/schools_repo.dart';
import 'package:fushati/src/splash/domain/usecases/get_schools.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../src/app_language/presentation/app/cubit/app_language_cubit.dart';
import '../../src/auth/data/datasources/auth_remote_data_src.dart';
import '../../src/auth/data/repos/auth_repo_impl.dart';
import '../../src/auth/domain/repos/auth_repo.dart';
import '../../src/auth/domain/usecases/auth_usecases.dart';
import '../../src/auth/presentation/app/blocs/auth_bloc/authenticator_bloc.dart';
import '../../src/edit_profile/domain/usecases/edit_user_info.dart';
import '../../src/home/data/datasources/cards_remote_data_src.dart';
import '../../src/home/domain/repos/card_repo.dart';
import '../../src/home/domain/repos/transactions_repo.dart';
import '../../src/manage_card/domain/usecases/get_transacrions.dart';
import '../../src/moyasar_transfer/data/repos/deposit_repo_impl.dart';
import '../../src/moyasar_transfer/domain/repo/deposit_repo.dart';
import '../../src/moyasar_transfer/domain/usecases/transfer_to_card.dart';
import '../../src/profile/data/datasources/user_info_remote_data_src.dart';
import '../../src/profile/data/repos/user_info_repo_impl.dart';
import '../../src/profile/domain/repos/user_info_repo.dart';
import '../../src/profile/domain/usecases/delete_user.dart';
import '../../src/profile/domain/usecases/get_user_info.dart';
import '../common/app/cache_helper.dart';

part 'injection_container.main.dart';
