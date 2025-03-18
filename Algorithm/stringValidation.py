def validation(string):
    stack=[]
    maps={"}":"{","]":"[",")":"("}
    for char in string:
        if char in maps:
            top=stack.pop() if stack else "0"
            if maps[char]!=top:
                return False
        else:
            stack.append(char)
            
    return not stack
    
print(validation("((({{[[([{}]{})]]}}})))"))