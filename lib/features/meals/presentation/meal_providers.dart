import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import '../domain/meal_models.dart';
import '../domain/meal_use_cases.dart';

final mealCalendarProvider =
    FutureProvider.family<List<MealCalendarDay>, String>(
      (ref, monthId) =>
          GetMealCalendar(ref.watch(appDatabaseProvider))(monthId),
    );
