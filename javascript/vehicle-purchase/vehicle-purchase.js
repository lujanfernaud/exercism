// @ts-check

const VEHICULES_REQUIRING_LICENSE = ["car", "truck"]

/**
 * Determines whether or not you need a licence to operate a certain kind of vehicle.
 *
 * @param {string} kind
 * @returns {boolean} whether a license is required
 */
export function needsLicense(kind) {
  return VEHICULES_REQUIRING_LICENSE.includes(kind)
}

/**
 * Helps choosing between two options by recommending the one that
 * comes first in dictionary order.
 *
 * @param {string} option1
 * @param {string} option2
 * @returns {string} a sentence of advice which option to choose
 */
export function chooseVehicle(option1, option2) {
  let chosenOption = [option1, option2].sort()[0]

  return `${chosenOption} is clearly the better choice.`
}

/**
 * Calculates an estimate for the price of a used vehicle in the dealership
 * based on the original price and the age of the vehicle.
 *
 * @param {number} originalPrice
 * @param {number} age
 * @returns expected resell price in the dealership
 */
export function calculateResellPrice(originalPrice, age) {
  const discountPriceMultiplier = () => {
    if (age < 3) {
      return 0.80
    } else if (age >= 3 && age <= 10) {
      return 0.70
    } else {
      return 0.50
    }
  }

  return originalPrice * discountPriceMultiplier()
}
