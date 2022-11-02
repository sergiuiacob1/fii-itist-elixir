def fibonacci(n):
    fib = []
    f1, f2 = 0, 1
    while n > 0:
        fib.append(f1)
        f3 = f1 + f2
        f1 = f2
        f2 = f3
        n -= 1
    return fib

print(fibonacci(20))
