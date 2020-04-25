const LETTERS = [
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
];

class SimpleCipher {
  constructor(key = this.generateKey()) {
    this.key = key;
  }

  generateKey() {
    return Array(...Array(110))
      .map(() => LETTERS[Math.floor(Math.random() * LETTERS.length)])
      .join('');
  }

  encode(string) {
    console.log('-----------------------');
    console.log('encode:', string);
    console.log('result:', this.convert(string));
    console.log('-----------------------');
    return this.convert(string);
  }

  decode(string) {
    console.log('-----------------------');
    console.log('decode:', string);
    console.log('result:', this.convert(string));
    console.log('-----------------------');
    return this.convert(string);
  }

  convert(string) {
    const keyLetters = [...this.key];
    const stringLetters = [...string];

    return stringLetters.reduce((newString, letter, index) => {
      const keyLetter = keyLetters[index];

      const characterIndex = LETTERS.indexOf(letter);
      console.log('characterIndex:', characterIndex);
      const keyLetterIndex = LETTERS.indexOf(keyLetter);
      console.log('keyLetterIndex:', keyLetterIndex);

      let newLetter;

      if (characterIndex > keyLetterIndex) {
        newLetter = LETTERS[keyLetterIndex + characterIndex];
        console.log('characterIndex > keyLetterIndex:', newLetter);
      } else if (characterIndex < keyLetterIndex) {
        newLetter = LETTERS[keyLetterIndex - characterIndex];
        console.log('characterIndex < keyLetterIndex:', newLetter);
      } else {
        newLetter = LETTERS[keyLetterIndex - characterIndex];
        console.log('else:', newLetter);
      }

      // } else {
      //   console.log('else:', LETTERS[keyLetterIndex + characterIndex]);
      //   newLetter = LETTERS[keyLetterIndex - characterIndex];
      // }

      newString += newLetter;

      return newString;
    }, '');
  }
}

export default SimpleCipher;
