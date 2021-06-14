package main

import "fmt"

func main() {
	var k int
	var l int
	var letter_sequence string
	var word string

	fmt.Scanf("%d %d", &k, &l)
	fmt.Scanf("%s", &letter_sequence)
	fmt.Scanf("%s", &word)

	r := decrypt(word, letter_sequence)
	fmt.Println(r)
}

func counter(str string) [58]int {
	var arr [58]int
	for i := 0; i < len(str); i++ {
		arr[str[i]-65] += 1
	}
	return arr
}

func decrypt(word string, letter_sequence string) int {
	answer := 0

	if len(word) < len(letter_sequence) {
		return answer
	}

	letter_sequence_counter := counter(letter_sequence)
	word_counter := counter(word[:len(letter_sequence)-1])

	for i := len(letter_sequence) - 1; i < len(word); i++ {
		word_counter[word[i]-65] += 1
		if word_counter == letter_sequence_counter {
			answer += 1
		}
		word_counter[word[i-len(letter_sequence)+1]-65] -= 1
	}

	// fmt.Println(letter_sequence_counter)
	// fmt.Println(word_counter)

	return answer
}
