import os

with open('buildnum.txt', 'r') as f:
    content = f.readlines()
content = content[0].rstrip()
num = str(content)
name = str(os.environ['ZIPTEST'])
print(name)
os.rename(name+".zip", name+"-test"+num+".zip")
os.remove("buildnum.txt")
inc = int(num) + 1
file = open("buildnum.txt","w") 
file.write(str(inc))
file.close()
file = open("zucc.txt","w")
file.write(name+"-test"+num+".zip")
file.close



