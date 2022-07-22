// @ts-check

/**
 * Calculates the total bird count.
 *
 * @param {number[]} birdsPerDay
 * @returns {number} total bird count
 */
export function totalBirdCount(birdsPerDay) {
  let result = 0

  for(let i = 0; i < birdsPerDay.length; i++) {
    result += birdsPerDay[i]
  }

  return result
}

const DAYS_IN_A_WEEK = 7

/**
 * Calculates the total number of birds seen in a specific week.
 *
 * @param {number[]} birdsPerDay
 * @param {number} week
 * @returns {number} birds counted in the given week
 */
export function birdsInWeek(birdsPerDay, week) {
  const startDayIndex = (DAYS_IN_A_WEEK * week) - DAYS_IN_A_WEEK
  const endDayIndex = startDayIndex + DAYS_IN_A_WEEK

  let result = 0

  for(let i = startDayIndex; i < endDayIndex; i++) {
    result += birdsPerDay[i]
  }

  return result
}

const isEven = (number) => {
  return number % 2 == 0
}

/**
 * Fixes the counting mistake by increasing the bird count
 * by one for every second day.
 *
 * @param {number[]} birdsPerDay
 * @returns {number[]} corrected bird count data
 */
export function fixBirdCountLog(birdsPerDay) {
  for (let i = 0; i < birdsPerDay?.length; i++) {
    let currentDayBirdsCount = birdsPerDay[i]
    let updatedBirdsCount = isEven(i) ? currentDayBirdsCount + 1 : currentDayBirdsCount

    birdsPerDay[i] = updatedBirdsCount
  }

  return birdsPerDay
}
