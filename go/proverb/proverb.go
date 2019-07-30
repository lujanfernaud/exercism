// Package proverb implements the solution for Exercism's "proverb" exercise.
package proverb

import "fmt"

// Proverb generates a proverb using the given list of words.
func Proverb(rhyme []string) []string {
	if len(rhyme) == 0 {
		return []string{}
	}

	result := initialSentences(rhyme)

	return append(result, lastSentence(rhyme))
}

func initialSentences(rhyme []string) []string {
	result := []string{}

	for i := 0; i+1 < len(rhyme); i++ {
		sentence := fmt.Sprintf(
			"For want of a %s the %s was lost.", rhyme[i], rhyme[i+1])

		result = append(result, sentence)
	}

	return result
}

func lastSentence(rhyme []string) string {
	return fmt.Sprintf("And all for the want of a %s.", rhyme[0])
}
