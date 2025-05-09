class ScrabbleLetterValues {
  static final Map<String, int> letterValues = {
    // English letters
    'a': 1, 'e': 1, 'i': 1, 'o': 1, 'u': 1, 'l': 1, 'n': 1, 's': 1, 't': 1,
    'r': 1,
    'd': 2, 'g': 2,
    'b': 3, 'c': 3, 'm': 3, 'p': 3,
    'f': 4, 'h': 4, 'v': 4, 'w': 4, 'y': 4,
    'k': 5,
    'j': 8, 'x': 8,
    'q': 10, 'z': 10,

    // Russian letters
    'а': 1, 'в': 1, 'е': 1, 'и': 1, 'н': 1, 'о': 1, 'р': 1, 'с': 1, 'т': 1,
    'д': 2, 'к': 2, 'л': 2, 'м': 2, 'п': 2, 'у': 2,
    'б': 3, 'г': 3, 'ё': 3, 'ь': 3, 'я': 3,
    'й': 4, 'ы': 4,
    'ж': 5, 'з': 5, 'х': 5, 'ц': 5, 'ч': 5,
    'ш': 8, 'э': 8, 'ю': 8,
    'ф': 10, 'щ': 10, 'ъ': 10,
  };

  static int getLetterValue(String letter) {
    return letterValues[letter.toLowerCase()] ?? 0;
  }

  static bool isValidLetter(String letter) {
    return letterValues.containsKey(letter.toLowerCase());
  }
}
