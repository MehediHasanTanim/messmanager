class AmountAllocator {
  const AmountAllocator();

  /// Splits minor units across a stable, sorted participant list. Any remainder
  /// goes to the lexicographically first IDs, making historic results repeatable.
  Map<String, int> equal(int amountMinor, Iterable<String> participantIds) {
    final ids = _ids(participantIds);
    if (amountMinor < 0) throw ArgumentError('Amount cannot be negative.');
    if (ids.isEmpty) throw ArgumentError('Select at least one participant.');
    final base = amountMinor ~/ ids.length;
    final remainder = amountMinor % ids.length;
    return {
      for (var index = 0; index < ids.length; index++)
        ids[index]: base + (index < remainder ? 1 : 0),
    };
  }

  Map<String, int> single(int amountMinor, String memberId) {
    if (amountMinor < 0 || memberId.trim().isEmpty) {
      throw ArgumentError('A member and a valid amount are required.');
    }
    return {memberId: amountMinor};
  }

  Map<String, int> custom({
    required int amountMinor,
    required Iterable<String> participantIds,
    required Map<String, int> allocations,
  }) {
    final ids = _ids(participantIds);
    if (ids.isEmpty) throw ArgumentError('Select at least one participant.');
    if (allocations.keys.toSet().length != ids.length ||
        !ids.every(allocations.containsKey) ||
        allocations.values.any((amount) => amount < 0) ||
        allocations.values.fold(0, (sum, amount) => sum + amount) !=
            amountMinor) {
      throw ArgumentError(
        'Custom allocations must exactly reconcile to the total.',
      );
    }
    return {for (final id in ids) id: allocations[id]!};
  }

  bool reconciles(int amountMinor, Map<String, int> allocations) =>
      allocations.values.fold(0, (sum, amount) => sum + amount) == amountMinor;

  List<String> _ids(Iterable<String> values) {
    final ids =
        values
            .map((id) => id.trim())
            .where((id) => id.isNotEmpty)
            .toSet()
            .toList()
          ..sort();
    return ids;
  }
}
