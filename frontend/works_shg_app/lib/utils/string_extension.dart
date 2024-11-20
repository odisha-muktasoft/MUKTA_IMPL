extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

extension MaskString on String {
  String mask() {
    if (isEmpty) {
      return this; // Return the empty string as is
    }
    return split(' ').map((word) {
      if (word.length > 1) {
        return word[0] + '*' * (word.length - 1);
      } else {
        return word;
      }
    }).join(' ');
  }

  String lastUnmask() {
    if (isEmpty) {
      return this; // Return the empty string as is
    }
    return split(' ').map((word) {
      if (word.length > 4) {
        // Keep the first letter, mask the middle, and keep the last three characters
        return word[0] + '*' * (word.length - 4) + word.substring(word.length - 3);
      } else {
        // If the word has 4 or fewer characters, don't mask anything
        return word;
      }
    }).join(' ');
  }
}
