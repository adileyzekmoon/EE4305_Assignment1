import csv
import sys
sys.setrecursionlimit(1100)

n = 0.001 




def derivX(x,y):
    answer = (2*(x-1)) - (400*x*(y-(x**2)))
#    print(answer)
    return(answer)

def derivY(x,y):
    answer = 200*(y-(x**2))
#    print(answer)
    return(answer)

def deltaX(x,y):
    answer = x - (n*derivX(x,y))
    return answer

def deltaY(x,y):
    answer = y - (n*derivY(x,y))
    return answer

def f(x,y):
    answer = ((1-x)**2) + 100*((y-(x**2))**2)
    return answer

xValues = [0]
yValues = [0.5]
fValues=[f(0,0.5)]

def steepestdescent(x,y,n):
    if (f(x,y)<.1):
        return 0
    else:
        newX = deltaX(x,y)
        xValues.append(newX)
        newY = deltaY(x,y)
        yValues.append(newY)
        fValues.append(f(newX, newY))
        print("Wave :" + str(n))
        print("x: " + str(newX))
        print("y: " + str(newY))
        print("f(x,y): " + str(f(newX, newY)))
        return steepestdescent(newX,newY,(n+1))
    
steepestdescent(0,0.5,0)


with open('XYvalues.csv', mode='w') as file:
    writer = csv.writer(file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

    writer.writerow(xValues)
    writer.writerow(yValues)
    writer.writerow(fValues)