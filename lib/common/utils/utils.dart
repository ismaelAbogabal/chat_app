class Utils {
  static Map<T, O> compareUpdateData<T, O>(
    Map<T, O> oldData,
    Map<T, O> newData,
  ) {
    return {
      for (var key in newData.keys)
        if (newData[key] != oldData[key]) key: newData[key]!,
    };
  }
}
