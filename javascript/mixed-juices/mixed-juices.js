// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
  switch(name) {
    case 'Pure Strawberry Joy':
      return 0.5
      break;
    case 'Energizer':
    case 'Green Garden':
      return 1.5
      break;
    case 'Tropical Island':
      return 3.0
      break;
    case 'All or Nothing':
      return 5.0
      break;
    default:
      return 2.5
  }
}

/**
* Calculates the number of wedges
* for a lime size.
*
* @param {string} limeSize
* @returns {number} number of wedges
*/
function wedgesForLimeSize(limeSize) {
  switch(limeSize) {
    case 'small':
      return 6
      break;
    case 'medium':
      return 8
      break;
    case 'large':
      return 10
  }
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
  if (wedgesNeeded === 0) return 0

  let limesUsedCount = 0
  let wedgesCount = 0

  while(limes.length > 0) {
    let currentLimeWedges = wedgesForLimeSize(limes.shift())

    wedgesCount += currentLimeWedges
    limesUsedCount += 1

    if (wedgesCount >= wedgesNeeded) break
  }

  return limesUsedCount
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  let remainingOrdersMinutes = 0

  while(orders.length > 0) {
    let currentOrderMinutes = timeToMixJuice(orders.shift())

    remainingOrdersMinutes += currentOrderMinutes

    if (remainingOrdersMinutes >= timeLeft) break
  }

  return orders
}
