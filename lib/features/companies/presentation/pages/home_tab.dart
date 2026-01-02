import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_text_styles.dart';
import '../../presentation/bloc/companies_bloc.dart';
import '../../presentation/bloc/companies_state.dart';
import '../../presentation/bloc/companies_event.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),

            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Main', style: AppTextStyles.screenTitle),
                Icon(Icons.notifications_none, size: 24.sp),
              ],
            ),

            SizedBox(height: 24.h),

            /// Search
            TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context
                      .read<CompaniesBloc>()
                      .add(SearchCompaniesEvent(value));
                }
              },
              decoration: InputDecoration(
                hintText: 'Search brands',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            /// Content
            Expanded(
              child: BlocBuilder<CompaniesBloc, CompaniesState>(
                builder: (context, state) {
                  if (state is CompaniesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is CompaniesLoaded) {
                    if (state.companies.isEmpty) {
                      return const Center(
                        child: Text('No companies found'),
                      );
                    }

                    return ListView.separated(
                      itemCount: state.companies.length,
                      separatorBuilder: (_, _) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final company = state.companies[index];

                        return Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                company.name,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                company.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }

                  if (state is CompaniesError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }

                  return const Center(
                    child: Text('Start searching'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
