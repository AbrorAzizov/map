import 'package:boycot/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/companies/presentation/bloc/companies_bloc.dart';
import 'features/companies/presentation/bloc/companies_event.dart';

class Injection extends StatelessWidget {
  final Widget child;

  const Injection({super.key, required this.child,});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<CompaniesBloc>()
            ..add(LoadCompaniesEvent()),
        ),
      ],
      child: child,
    );
  }
}
