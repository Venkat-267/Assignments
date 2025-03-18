def binary_search(array,search,l,h):
    if l > h:
        return -1
    mid=(l+h)//2
    if search == array[mid]:
        return mid
    elif search>array[mid]:
        return binary_search(array,search,mid+1,h)
    else:
        return binary_search(array,search,l,mid-1)
    
array=[1,3,4,5,6]
print(binary_search(array,5,0,len(array)-1))