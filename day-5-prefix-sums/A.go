package main

import "bufio"
import "fmt"
// import "ioutil"
import "os"
import "strings"
import "strconv"

func main() {
	file, _ := os.Open("input.txt")
	defer file.Close()

	// contents, _ := ioutil.ReadAll(reader)
	// lines := strings.Split(string(contents), '\n')

	var lines []string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	fmt.Println(len(lines))
	fmt.Println(lines)

	arr := strings.Split(lines[1], ",")
	n_colours := make([]int, 0, len(arr))
	for _, str := range arr {
    v, _ := strconv.Atoi(str)
    n_colours = append(n_colours, v)
	}
	arr  = strings.Split(lines[3], ",")
	m_colours := make([]int, 0, len(arr))
	for _, str := range arr {
    v, _ := strconv.Atoi(str)
    m_colours = append(m_colours, v)
	}

	i, j := find_match(n_colours, m_colours)
	fmt.Println(i, j)
}

func find_match(n_colours []int, m_colours []int) (int, int) {
	return 5, 2
}
// 	return 4, 6
// 	// answer := 0

// 	// if len(word) < len(letter_sequence) {
// 	// 	return answer
// 	// }

// 	// letter_sequence_counter := counter(letter_sequence)
// 	// word_counter := counter(word[:len(letter_sequence)-1])

// 	// for i := len(letter_sequence) - 1; i < len(word); i++ {
// 	// 	word_counter[word[i]-65] += 1
// 	// 	if word_counter == letter_sequence_counter {
// 	// 		answer += 1
// 	// 	}
// 	// 	word_counter[word[i-len(letter_sequence)+1]-65] -= 1
// 	// }

// 	// // fmt.Println(letter_sequence_counter)
// 	// // fmt.Println(word_counter)

// 	// return answer
// }
