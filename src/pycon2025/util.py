


def add_nums(  A ,B):return A+B

import numpy as np
def add_nums_numpy(  A ,B):
     return np.sum([A, B])


def divideNums( A , B):
        return A/B
def multiply(a,b ):
 return  a *b

def main( ) :
    x= add_nums(2,  3) 
 #some comment
    y=multiply( x ,4 )              # in the middle of the sea
    z=divideNums( x ,4 )              
    print( "sum:",x  )
    print("product:" ,  y)
    print("div:" ,  z)
main()
