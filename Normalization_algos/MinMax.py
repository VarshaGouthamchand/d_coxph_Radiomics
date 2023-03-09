import os
import pandas as pd
import json

# read database uri
database_uri = os.getenv('DATABASE_URI','no_database_uri')

# read/query data from database_uri
data = pd.read_csv(database_uri)
#data = pd.read_csv("C:\\Users\\P70070487\\Downloads\\Radiomics\\mda_copy.csv")
mydict = {}
df = data.copy()

for col in df.columns:
    if col!= "researchnr" and col!= "study" and col!= "overall_survival_in_days" and col!= "event_overall_survival":
        #print(col)
        mydict[col] = {}
        minimum = df[col].min()
        maximum = df[col].max()
        mydict[col]["min"] = minimum
        mydict[col]["max"] = maximum
        #df[col] = (df[col] - df[col].min()) / (df[col].max() - df[col].min())     
#df.to_csv('df.csv', index = False)
#print(df.iloc[:,0:5])

jsonObj = json.dumps(mydict)
#print(jsonObj)

with open('output.txt', 'w') as f:
    f.write(jsonObj)
    