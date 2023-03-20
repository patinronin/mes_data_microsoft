import numpy as np 
import pandas as pd 


data = [50,50,47,97,49,3,53,42,26,74,82,62,37,15,70,27,36,35,48,52,63,64]
# convert list to numpy array
grades = np.array(data)
print(grades)
print(f"shape of grades: {grades.shape}")
print(f"frist element of grades: {grades[0]}")
print(f"mean of grades: {grades.mean()}")

study_hours = [10.0,11.5,9.0,16.0,9.25,1.0,11.5,9.0,8.5,14.5,15.5,
               13.75,9.0,8.0,15.5,8.0,9.0,6.0,10.0,12.0,12.5,12.0]

# Create a 2D array
student_data = np.array([study_hours, grades])
print(f"student data {student_data}")
print(f"student data shape: {student_data.shape}")
print (f"frist element of de frist element: {student_data[0][0]}")

avg_study = student_data[0].mean()
avg_grade = student_data[1].mean()

print('Average study hours: {:.2f}\nAverage grade: {:.2f}'.format(avg_study, avg_grade))

df_students = pd.DataFrame({'Name': ['Dan', 'Joann', 'Pedro', 'Rosie', 'Ethan', 'Vicky', 'Frederic', 'Jimmie', 
                                     'Rhonda', 'Giovanni', 'Francesca', 'Rajab', 'Naiyana', 'Kian', 'Jenny',
                                     'Jakeem','Helena','Ismat','Anila','Skye','Daniel','Aisha'],
                            'StudyHours':student_data[0],
                            'Grade':student_data[1]})
print(f"\nGet the data for index value 5:  \n {df_students.loc[5]}")
print(f"\nGet the rows with index values from 0 to 5: \n{df_students.loc[0:5]}")
print(f"\nGet data in the first five rows: \n {df_students.iloc[0:5]}")
print(f"\nelements 1 and 2 from row 0: \n {df_students.iloc[0,[1,2]]}")

# we can search from diferent forms 
df_students.loc[df_students['Name']=='Aisha']
df_students[df_students['Name']=='Aisha']
df_students.query('Name=="Aisha"')
df_students[df_students.Name == 'Aisha']


# load csv file
# !wget https://raw.githubusercontent.com/MicrosoftDocs/mslearn-introduction-to-machine-learning/main/Data/ml-basics/grades.csv
try:
    df_students = pd.read_csv('grades.csv',delimiter=',',header='infer')
    df_students.head()
    df_students.isnull()
    # return the rows only with values null 
    df_students[df_students.isnull().any(axis=1)]
    print(f"\n students with null values: {df_students[df_students.isnull().any(axis=1)]} ")
    passes  = pd.Series(df_students['Grade'] >= 60)
    df_students = pd.concat([df_students, passes.rename("Pass")], axis=1)

except:
    print("can't load de file")