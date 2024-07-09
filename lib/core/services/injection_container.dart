import 'package:dio/dio.dart';
import 'package:fushati/src/home/data/repos/card_repo_impl.dart';
import 'package:fushati/src/home/domain/usecases/add_card.dart';
import 'package:fushati/src/home/domain/usecases/delete_card.dart';
import 'package:fushati/src/home/domain/usecases/get_card.dart';
import 'package:fushati/src/home/domain/usecases/get_cards.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../src/app_language/presentation/app/cubit/app_language_cubit.dart';
import '../../src/auth/data/datasources/auth_remote_data_src.dart';
import '../../src/auth/data/repos/auth_repo_impl.dart';
import '../../src/auth/domain/repos/auth_repo.dart';
import '../../src/auth/domain/usecases/auth_usecases.dart';
import '../../src/auth/presentation/app/blocs/auth_bloc/authenticator_bloc.dart';
import '../../src/home/data/datasources/cards_remote_data_src.dart';
import '../../src/home/domain/repos/card_repo.dart';
import '../common/app/cache_helper.dart';

part 'injection_container.main.dart';
