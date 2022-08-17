// @ts-check

/**
 * Build a sign that includes both of the parameters.
 *
 * @param {string} occasion
 * @param {string} name
 *
 * @returns {string} template string combining both parameters
 */

export function buildSign(occasion, name) {
  return `Happy ${occasion} ${name}!`
}

/**
 * Build a birthday sign that conditionally formats the return string.
 *
 * @param {number} age
 *
 * @returns {string} template string based on age
 */

export function buildBirthdaySign(age) {
  let signifier = age >= 50 ? 'mature' : 'young'

  return `Happy Birthday! What a ${signifier} fellow you are.`
}

/**
 * Build a graduation sign that includes multiple lines.
 *
 * @param {string} name
 * @param {number} year
 *
 * @returns {string} multi-line template string
 */

export function graduationFor(name, year) {
  return `Congratulations ${name}!\nClass of ${year}`
}

const SIGN_BASE_PRICE_IN_DOLLARS = 20
const LETTER_COST_IN_DOLLARS = 2

/**
 * Determine cost based on each character of sign parameter that builds
 * the template string that includes the currency parameter.
 *
 * @param {string} sign
 * @param {string} currency
 *
 * @returns {string} cost to create the sign
 */

export function costOf(sign, currency) {
  let signCost = SIGN_BASE_PRICE_IN_DOLLARS + (sign.length * LETTER_COST_IN_DOLLARS)

  return `Your sign costs ${signCost.toFixed(2)} ${currency}.`
}
