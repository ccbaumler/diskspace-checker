#!/usr/bin/env python3

import sys, json

def sizeof_fmt(num, suffix='B'):
    for unit in ['','Ki','Mi','Gi','Ti','Pi','Ei','Zi']:
        if abs(num) < 1024.0:
            return "%3.1f%s%s" % (num, unit, suffix)
        num /= 1024.0
    return "%.1f%s%s" % (num, 'Yi', suffix)

def get_recursive(item):
    size = 0
    if isinstance(item, dict):
        name = item["name"]
        size = item["dsize"] #use asize for apparent size instead of disk size
    else:
        name = item[0]["name"]
        for sub in item:
            size += get_recursive(sub)[1]
    return (name, size)

data = json.loads(sys.stdin.read())

items=[]
for i in data[3][1:]:
    items.append(get_recursive(i))

sum_sizes = sum([item[1] for item in items])
biggest = max([item[1] for item in items])
print("------ {} --- {} -------".format(data[3][0]["name"], sizeof_fmt(sum_sizes)))

for item in sorted(items, key=lambda x:x[1], reverse=True):
    size=item[1]
    hsize=sizeof_fmt(item[1])
    name=item[0]
    percent=(size/sum_sizes*100)
    percent_str="({:.1f}%)".format(percent)
    
    print("{} {:8} [{}{}] {}".format(
        " " * (10 - len(str(hsize)))+ str(hsize),
        " " * (8 - len(percent_str)) + percent_str,  
        ('#' * round(size/biggest*10)),
        ('-' * round(10-size/biggest*10)),
        item[0])
    )
