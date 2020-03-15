def derivX(x,y):
    answer = (2*(x-1)) - (400*x*(y-(x**2)))
#    print(answer)
    return(answer)

def derivY(x,y):
    answer = 200*(y-(x**2))
#    print(answer)
    return(answer)

def derivXX(x,y):
    answer = 2-(400*(y-(3*(x**2))))
#    print(answer)
    return(answer)

def derivYY(x,y):
    answer = 200
#    print(answer)
    return(answer)

def derivXY(x,y):
    answer = -400*x
#    print(answer)
    return(answer)

def derivYX(x,y):
    answer = -400*x
#    print(answer)
    return(answer)

def deltaX(x,y):
    multiplier = -1/((derivXX(x,y)*derivYY(x,y))-(derivXY(x,y)*derivYX(x,y)))
    answer = multiplier * ((derivYY(x,y)*derivX(x,y)) + (-(derivXY(x,y))*derivY(x,y)))
    print("DeltaX: " + str(answer))
    return answer

def deltaY(x,y):
    multiplier = -1/((derivXX(x,y)*derivYY(x,y))-(derivXY(x,y)*derivYX(x,y)))
    answer = multiplier * ((-(derivYX(x,y))*derivX(x,y)) + (derivXX(x,y)*derivY(x,y)))
    print("DeltaY: " + str(answer))
    return answer

def f(x,y):
    answer = ((1-x)**2) + 100*((y-(x**2))**2)
    return answer

def recursion(x,y,n):
    if (f(x,y)<0.1):
        return 0
    else:
        print("Wave :" + str(n))
        newX = x + deltaX(x,y)
        newY = y + deltaY(x,y)
        print("x: " + str(newX))
        print("y: " + str(newY))
        print("f(x,y): " + str(f(newX, newY)))
        print()
        return recursion(newX,newY,(n+1))

    
recursion(0,0.5,1)
#deltaY(0,0.5)