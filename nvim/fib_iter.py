def fibonacci(n):
    a, b = 0, 1
    for _ in range(2, n + 1):
        a, b = b, a + b
    return b


print(fibonacci(1))
print(fibonacci(2))
print(fibonacci(3))
print(fibonacci(4))
print(fibonacci(5))
print(fibonacci(6))
print(fibonacci(7))
print(fibonacci(8))

# 2,3,4,5
# 1. 0, 1
### for
# 2. 1, 1
# 3. 1, 2
# 4. 2, 3
# 5. 3, 5

# print(r)
