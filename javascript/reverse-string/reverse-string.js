function reverseString(string) {
  if (string.length === 0) {
    return '';
  } else {
    return string.split("").reverse().join("");
  }
}

module.exports = reverseString;
