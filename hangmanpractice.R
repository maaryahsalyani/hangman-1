# Read word list from file
# Dictionary-List will read the words in Doc3.txt
dictionary_list <- readLines("Doc3.txt")

# Choose a random word from the list
correct_word <- sample(dictionary_list, 1)

#providing the user with the number of letters in the word
#using the nchar function to provide the number of letters
#Using the cat function to concatenate and print a text message that includes the number of charactersword_length <- nchar(correct_word)
cat("The correct word has", word_length, "letters.\n")

#Defined the number of wrong guesses allowed, and concatenated it with text to be printed to the user in the consolemax_wrong_guesses <- 10
cat("You are allowed", max_wrong_guesses, "wrong guesses.\n")

# Initialize variables

#created dashes that are equivalent to the number of letters in the word that need to be guessed by the user
guesses <- rep("_", word_length)

#created a function that displays the word with blanks equivalent to the length of the word
#cat is used to concatenate the correct letters guessed into a single string 
#collapse="" will add spaces between characters 
display_word <- function(guesses) {
  cat(paste(guesses, collapse = " "), "\n")
}

#created a main loop for the game 
wrong_guesses <- 0
# this loop will run until the number of wrong guesses (wrong_guesses) is less than the maximum allowed wrong guesses (max_wrong_guesses)
# while loop allows user to continue playing until number of guesses is greater than maximum wrong guesses allowed, or if they have guessedthe word correctly
while (wrong_guesses < max_wrong_guesses) {
  
  # Display the current state of the word
  display_word(guesses)
  
  # Ask for user input
  user_input <- readline("Enter a letter or type 'guess' to guess the whole word: ")
  
  # Check if user wants to guess the whole word
  # "tolower" condition checks if the user input, after converting it to lowercase 
  if (tolower(user_input) == "guess") {
    guessed_word <- readline("Enter your guess: ")
    #if statement is used to compare the lowercase version of the user's guess (tolower(guessed_word)) with the lowercase version of the correct word.hecks if the user's guess matches the correct word.
    if (tolower(guessed_word) == tolower(correct_word)) {
      # if the user's guess matches the correct word:
      cat("Congratulations! You guessed the word correctly.\n")
      #break statement is used to exit the loop 
      break
    } else {
      # if the user's guess does not match the correct word:
      cat("Sorry, your guess is incorrect.\n")
      break
    }
    
    
    # Check if user input is a single letter
    if (nchar(user_input) != 1) {
      cat("Please enter only one letter.\n")
      next
    }
    
  }
  # Update guessed letters and check if the letter is found in the correct word
  found <- FALSE
  for (i in 1:word_length) {
    # substr extracts a substring from the correct_word starting at position i and ending at position i
    # tolower function converts the extracted substring to lowercase
    if (tolower(user_input) == tolower(substr(correct_word, i, i))) {
      # guesses[i] updates the "guesses" vector by assigining the character at position i in the correct_word to the corresponding position i in the guesses
      guesses[i] <- substr(correct_word, i, i)
      #set found to TRUE to indicate when a match is found.
      found <- TRUE
    }
  } #this condition checks if the variable found is TRUE
  if (found) {
    #if true
    cat("Congratulations! The letter is in the word.\n")
  } else { #if not true (the inpit doesnt match a correct letter in the word)
    cat("Sorry, the letter is not in the word.\n")
    wrong_guesses <- wrong_guesses + 1
  }
  # Check if all letters have been guessed correctly
  if (all(guesses != "_")) {
    cat("Congratulations! You guessed the word correctly.\n")
    break
  }
  
  # Notify user about the number of tries left
  cat("Remaining wrong guesses:", max_wrong_guesses - wrong_guesses, "\n")
}
# If all tries are finihsed, reveal the correct word
if (wrong_guesses >= max_wrong_guesses) {
  cat("Sorry, better luck next time! The correct was:", correct_word, "\n")
}

