/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Determines whether the lasagna is done.
 *
 * @param {number} remainingTime
 * @returns {string}
 */
export function cookingStatus(remainingTime) {
  if (remainingTime === 0) return 'Lasagna is done.'
  if (!remainingTime) return 'You forgot to set the timer.'

  return 'Not done, please wait.'
}

/**
 * Estimates the preparation time.
 *
 * @param {string[]} layers
 * @param {number} averagePreparationTime
 * @returns {number}
 */
export function preparationTime(layers, averagePreparationTime = 2) {
  return layers.length * averagePreparationTime
}

const QUANTITIES_PER_LAYER = {
  noodles: 50, // grams
  sauce: 0.2, // liters
}

/**
 * Computes the amounts of noodles and sauce needed.
 *
 * @param {string[]} layers
 * @returns {Record<string, number>}
 */
export function quantities(layers) {
  let quantities = { noodles: 0, sauce: 0 }

  for(let i = 0; i < layers.length; i++) {
    let layer = layers[i]

    if (layer === 'noodles' || layer === 'sauce') quantities[layer] += QUANTITIES_PER_LAYER[layer]
  }

  return quantities
}

/**
 * Adds the secret ingredient.
 *
 * @param {string[]} friendsIngredients
 * @param {string[]} myIngredients
 * @returns {string[]}
 */
export function addSecretIngredient(friendsIngredients, myIngredients) {
  myIngredients.push(friendsIngredients.slice(-1)[0])
}

const DEFAULT_PORTIONS = 2

/**
 * Scales the recipe to the number of portions.
 *
 * @param {Record<string, number>} recipeForTwoPortions
 * @param {number} portions
 * @returns {Record<string, number>}
 */
export function scaleRecipe(recipeForTwoPortions, portions) {
  let scaledRecipe = { ...recipeForTwoPortions }

  for(let ingredient in scaledRecipe) {
    if (portions === 1) scaledRecipe[ingredient] /= DEFAULT_PORTIONS
    if (portions > 1) scaledRecipe[ingredient] *= portions / DEFAULT_PORTIONS
  }

  return scaledRecipe
}
