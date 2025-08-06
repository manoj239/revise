python -m IPython
client = boto3.client('ec2')
client = boto3.client('iam')
regions =  ["us-east-1", "ap-south-1"]
    dir(regions)
     regions.append('us-east-2')
     print(regions) or regions
     ['us-east-1', 'ap-south-1', 'us-east-2']
     regions.append is a reference to the method.

     regions.append() calls the method (and requires an argument — the item to add).

     Printing the method reference only shows its info, not the list or result.
To know the memory location , give below command
id(r1)
faker usually refers to the Faker library in Python, which generates fake data like names, addresses, emails, etc.

**Working with JSON in Python
    1 **Convert a dict to JSON:**
        - `json.dump()` or `json.dumps()`
        - `json.dumps` → Takes a dict and returns a JSON string.
        - `json.dump`  → Takes a dict and a file object, and writes the JSON to the file.
    2 **Convert JSON to dict:
       - `json.load()` or `json.loads()`

       - `json.loads`  → Converts a JSON string to a dict.
       - `json.load`   → Reads from a file object and converts the JSON content to a dict.

File handling : We don’t need to give x.close() ,if we use with open()
    with open("file.txt", "r") as x :
        print(x.read())
    with open("file.txt", "r") as file :
        for line in file :
            print(line())
    with open("file.txt", "a") as file :
        for i in range(1,10,2):
            file.write(f'Hello World {I}\n')

Main difference b/w print and return is print statement will print the value in screen, but return statement will assign the value 
    def hello(a,b):
        print(a,b)
    x= hello(2,3)  o/p:5
    y= hello(4,5)  o/p:9
    x+y o/p:Error

    def hello(a,b):
        return (a+b)
    x= hello(2,3)  o/p:5
    y= hello(4,5)  o/p:9
    x+y o/p:14

#Arbitrary Positional arguments
    def argstesting(*args):
        for region in args:
            print(region)
    argstesting("ap-south-1", "us-east-1", "us-east-2")
#Arbitrary Keyword arguments
    def kwargstesting(**kwargs):
        for key,value in kwargs.items():
            print(key,'------->',value)
    kwargstesting(numbers=5,colours="blue",fruits="apple")
    o/p: numbers ------->5
         colours ------->blue
         fruits -------->apple

To generate unique id give uuid.uuid4(). Here we are genrating 10 unique ids
    for i in range(10):
        print(uuid.uuid4())



