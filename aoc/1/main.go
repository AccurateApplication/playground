package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
	"strconv"
)

func main() {

	// filePath := os.Args[1]
	readFile, err := os.Open("./input")

	if err != nil {
		fmt.Println(err)
	}

	fileScanner := bufio.NewScanner(readFile)
	fileScanner.Split(bufio.ScanLines)
	var fileLines []string

	for fileScanner.Scan() {
		fileLines = append(fileLines, fileScanner.Text())
	}

	readFile.Close()
	var combinedNumbers []int
	reGrp1 := regexp.MustCompile(`^[^\d]*(\d)`)
	// reGrp2 := regexp.MustCompile(`.*(?:\D|^)(\d)(?:\D|$)`)
	reGrp2 := regexp.MustCompile(`(\d)[^\d]*$`)
	// reGrp2 := regexp.MustCompile(`.*\D(\d)[^\d]*$`)

	for _, line := range fileLines {
		// fmt.Println(line)

		firstNumMatch := reGrp1.FindStringSubmatch(line)
		lastNumMatch := reGrp2.FindStringSubmatch(line)

		if len(firstNumMatch) > 1 {
			// fmt.Println(firstNumMatch[1])
			fmt.Printf("num: %s and string: %s", firstNumMatch[1], line)
		} else {
			fmt.Println("No first number found")
		}
		if len(lastNumMatch) > 1 {
			fmt.Printf("\t ||||| num: %s and string: %s \n", lastNumMatch[1], line)
		} else {
			fmt.Println("No last number found")
		}
		if len(firstNumMatch) > 1 && len(lastNumMatch) > 1 {
			firstNum, _ := strconv.Atoi(firstNumMatch[1])
			lastNum, _ := strconv.Atoi(lastNumMatch[1])

			// Combine the numbers (assuming concatenation)
			combined := firstNum*10 + lastNum
			combinedNumbers = append(combinedNumbers, combined)
		}
	}

	// Sum the combined numbers
	var sum int
	for _, num := range combinedNumbers {
		sum += num
	}

	fmt.Println("Combined Numbers:", combinedNumbers)
	fmt.Println("Total Sum:", sum)

}

// 	// fmt.Println("lollll")
// 	testText := "4onersrfjcskckcxcj4sevenzzzpsixeight5abc"
// 	firstNumMatch := reGrp1.FindStringSubmatch(testText)
// 	if len(firstNumMatch) > 1 {
// 		fmt.Println(firstNumMatch[1])
// 	} else {
// 		fmt.Println("No first number found")
// 	}

// 	// For the last number
// 	lastNumMatch := reGrp2.FindStringSubmatch(testText)
// 	if len(lastNumMatch) > 1 {
// 		fmt.Println(lastNumMatch[1])
// 	} else {
// 		fmt.Println("No last number found")
// 	}

// }
