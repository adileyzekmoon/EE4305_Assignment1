import sys
sys.setrecursionlimit(1100)

nu = 0.001 

def derivX(x,y):
    answer = (2*(x-1)) - (400*x*(y-(x**2)))
#    print(answer)
    return(answer)

def derivY(x,y):
    answer = 200*(y-(x**2))
#    print(answer)
    return(answer)

def deltaX(x,y):
    answer = x - (nu*derivX(x,y))
    return answer

def deltaY(x,y):
    answer = y - (nu*derivY(x,y))
    return answer

def f(x,y):
    answer = ((1-x)**2) + 100*((y-(x**2))**2)
    return answer

#
#print(deltaX(0.004316, .32))
#print(deltaY(0.004316, .32))

def steepestdescent(x,y,n):
    if (f(x,y)<.1):
        return 0
    else:
        newX = deltaX(x,y)
        newY = deltaY(x,y)
        print("Wave :" + str(n))
        print("x: " + str(newX))
        print("y: " + str(newY))
        print("f(x,y): " + str(f(newX, newY)))
        return steepestdescent(newX,newY,(n+1))
    
steepestdescent(0,0.5,0)
