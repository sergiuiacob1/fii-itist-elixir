import random

number = random.randint(0, 10)

while True:
    try:
        guess = int(input("Guess the number between 0 and 10: "))
    except:
        print("Invalid number")
        continue
    if guess == number:
        print("Congratulations!")
        break
    else:
        print("Wrong!")
