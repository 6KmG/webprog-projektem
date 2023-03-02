import random

with open("english nouns.txt") as file:
    l = file.read().split('\n')
print(random.choice(l)+random.choice(l))