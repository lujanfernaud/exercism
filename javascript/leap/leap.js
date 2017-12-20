var Year = function (input) {
  this.input = input;
};

Year.prototype.isLeap = function () {
  if (this.input % 400 == 0) {
    return true;
  } else if (this.input % 4 == 0 && this.input % 100 != 0) {
    return true;
  } else {
    return false;
  }
};

module.exports = Year;
