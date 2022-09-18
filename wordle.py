#cerner_2tothe5th_2022
import requests 
import json
def check_word(guess, correct, index, placement_list):
  if (index == 5):
    print(' '.join(guess))
    print(' '.join([str(elem) for elem in placement_list]))
    if((len(set(placement_list)) == 1) and (placement_list[0]) == '*'):
      print("congrats"); quit()
  elif((guess[index] == correct[index]) and (index <= 4)):
    placement_list.append("*")
    check_word(guess,correct, increment(index), placement_list)
  elif (index <= 4):
    check_letter_in_word(guess, correct, index, placement_list)
    check_word(guess,correct, increment(index), placement_list) 
  else:  return 
def check_letter_in_word(guess, correct, index, placement_list):
  if(guess[index] in correct):
    placement_list.append("-")
  else: 
    placement_list.append(" ")
def increment(i):  return i+1
def user_input():
  word = input("Enter wordle: ") 
  return word

response = requests.get("https://random-word-api.herokuapp.com/word?length=5")
correct_word = json.dumps(response.json())[2:7]
for guess in range(5):
    local_placement=[]
    check_word(user_input(), correct_word, 0, local_placement)
print("The correct word was: "+correct_word)
