//Create a model class to store the mapping between a string and two double values.
class ValueMapping {
  final String key;
  final double value1;
  final double value2;

  ValueMapping({required this.key, required this.value1, required this.value2});
}

//Create a list of mappings to store all the possible values.
List<ValueMapping> mappings = [
  ValueMapping(key: "Bahawalpur", value1: 29.395721, value2: 71.683334),
  ValueMapping(key: "B", value1: 3.5, value2: 4.5),
  ValueMapping(key: "C", value1: 5.0, value2: 6.0),
];

//Write a function to search the list for the given key and retrieve the corresponding double values.
ValueMapping? getValuesForKey(String key) {
  return mappings.firstWhere(
    (mapping) => mapping.key == key,
    orElse: () => ValueMapping(key: "", value1: 0.0, value2: 0.0),
  );
}

// Call the function when the user provides a string value.
void handleUserInput(String userInput) {
  ValueMapping? result = getValuesForKey(userInput);
  if (result != null) {
    print(
        "Key: ${result.key}, Value1: ${result.value1}, Value2: ${result.value2}");
  } else {
    print("No matching values found for key: $userInput");
  }
}
