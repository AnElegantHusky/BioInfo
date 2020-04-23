import csv

with open('data.csv', 'r') as f:
    data = csv.reader(f)
    dat = []
    t=0
    for i in data:
        dat.append(i)
with open('metrics.csv', 'r') as f:
    metrics = csv.reader(f)
    print(type(metrics))
    met=[]
    for i in metrics:
        met.append(i)
print(len(met))
print(len(dat))
id=[]
k=[]
newdat=[]

for i in met:
    id.append(i[0])
for i in range(1,len(dat)):
    if dat[i][0] not in id:
        k.append(i)
# print(k)

for i in range(0,len(dat)):
    if i not in k:
        newdat.append(dat[i])


# print(newdat[0],newdat[1])

with open('newd.csv', "w", newline='') as f:
    # with open(birth_weight_file, "w") as f:
        writer = csv.writer(f)
        writer.writerows(newdat)
        f.close()
# a=[[1,2],[2,3],[3,3]]
# b=[2,3,4]
# c=9
# for i in range(0,len(a)):
#     if a[i][0] not in b:
#         c=i
# del a[c]
# print(a)