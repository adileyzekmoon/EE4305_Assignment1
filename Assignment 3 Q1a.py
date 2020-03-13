def rosenbrock(x,y):
    answer = ((1-x)**2) + 100*((y-(x**2))**2)
    return (answer)

def derivativeX(x,y):
    answer = (2*(x-1)) - (400*x*(y-(x**2)))
    return answer

def derivativeY(x,y):
    answer = 200*(y-(x**2))

def steepestDescent(x):
    return (x - 0.001*(100))

print(steepestDescent(.5))