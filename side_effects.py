counter = 0
 
def side_effect(x):
    global counter
    counter += 1
    return x ** 2
 
def pure(x, counter):
    return x ** 2, counter + 1

print("Counter is", counter) # Counter is 0
_ = side_effect(8)
print("Counter is", counter) # Counter is 1
_, modified_counter = pure(8, counter)
print("Counter is", counter) # Counter is 1
