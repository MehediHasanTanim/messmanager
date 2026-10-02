import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../data/member_repository.dart';
import '../domain/member_models.dart';
import '../domain/member_use_cases.dart';

final memberRepositoryProvider = Provider<DriftMemberRepository>(
  (ref) => DriftMemberRepository(ref.watch(appDatabaseProvider)),
);

final memberProvider = FutureProvider.family<Member?, String>(
  (ref, id) => ref.watch(memberRepositoryProvider).findById(id),
);

final memberFinancialSummaryProvider =
    FutureProvider.family<
      MemberFinancialSummary,
      ({String memberId, String monthId})
    >(
      (ref, key) => GetMemberFinancialSummary(ref.watch(appDatabaseProvider))(
        memberId: key.memberId,
        monthId: key.monthId,
      ),
    );
