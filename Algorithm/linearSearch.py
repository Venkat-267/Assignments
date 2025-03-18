def linear_search(array,search):
    for i, element in enumerate(array):
        if element == search:
            return i
    return -1 
array=[1,3,4,5,6]
print(linear_search(array,3))