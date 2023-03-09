import os
import pandas as pd
import json

# read database uri
database_uri = os.getenv('DATABASE_URI','no_database_uri')

# read/query data from database_uri
data = pd.read_csv(database_uri)
print(data.iloc[:,0:5])
#data = pd.read_csv("C:\\Users\\P70070487\\Downloads\\Radiomics\\mda_copy.csv")
df = data.copy()

with open('input.txt') as json_file:
    input_text = json.load(json_file)
    #print(input_text)

for col in df.columns:
    if col!= "researchnr" and col!= "study" and col!= "overall_survival_in_days" and col!= "event_overall_survival":
        df[col] = (df[col] - input_text[col]['min']) / (input_text[col]['max'] - input_text[col]['min'])     
df.to_csv(database_uri, index = False)

data = pd.read_csv(database_uri)
print(data.iloc[:,0:5])
