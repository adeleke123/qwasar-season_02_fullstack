### Ruby Quest06
Remember to git add && git commit && git push each exercise!

We will execute your function with our test(s), please DO NOT PROVIDE ANY TEST(S) in your file

For each exercise, you will have to create a folder and in this folder, you will have additional files that contain your work. Folder names are provided at the beginning of each exercise under submit directory and specific file names for each exercise are also provided at the beginning of each exercise under submit file(s).

Ruby Quest06	My Csv Parser
Submit directory	ex00
Submit file	my_csv_parser.rb
Description
What is a CSV? :-)
It's a format that is used very often, Microsoft Excel uses it.
It's a 2d array: row and column.
Rows are separated by "line" (the character "
"). Columns are separated by ",". (Separators can be different, they can also be ";")

Your goal is to transform a string following the CSV format to a 2d array.

Your function will take two arguments, the contents of a CSV as a string and a separator.
Your function will return an array (line) of arrays (columns).

In this assignment, you will have to determine how to transform a string into an array.

### Function prototype (ruby)
```
##
##
## QWASAR.IO -- my_csv_parser
##
##
## @param {String} param_1
## @param {String} param_2
##
## @return {string[][]}
##


def my_csv_parser(param_1, param_2)

end
```
### Example 00
```
Input: "a,b,c,e\n1,2,3,4\n" && ","
Output: 
Return Value: [["a", "b", "c", "e"], ["1", "2", "3", "4"]]
```
### Tip
```
lines = "column1,column2,column3\nvalue1,value2,value3\n".split("\n");
console.log(lines);

var index = 0;

while (index < lines.length) {
  var values = lines[index].split(',');
}
```
Ruby Quest06	My Data Transform
Submit directory	ex01
Submit file	my_data_transform.rb
Description
We have been provided with a dataset of sales from My Online Coffee Shop. It's a CSV (Comma Separated Values) (each column is separated by , and each line is separated by  ).
Our goal will be to identify customers who are more likely to buy coffee online.

Data management is a hard problem. To better solve this hard problem, we will split them into smaller ones.

Here is our first step: data prep.

You noticed our CSV is composed of 3 columns we cannot group them easily: Email - Age - Order At.

For the email, we will consider the provider.
For the age column, we consider a group from [1->20] - [21->40] - [41->65] - [66->99]
For the Order at column, we consider a group for [morning => 06:00am -> 11:59am] - [afternoon => 12:00pm -> 5:59pm] - [evening => 6:00pm -> 11:59pm]

You will have to create a function that will replace the value in each of these columns with the correct actionable data. (ex: if the age is between 21 and 40, replace by "21->40")

Order At is a little more tricky.

Your function will be prototyped: def my_data_transform(csv_content)
It will take a string which contains data in CSV format and it will return an array of strings in CSV format with the column Email, Age and Order At transformed.

### Function prototype (ruby)
```
##
##
## QWASAR.IO -- my_data_transform
##
##
## @param {String} param_1
##
## @return {string[]}
##


def my_data_transform(param_1)

end
```
### Example 00
```

Input: "Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At\nMale,Carl,Wilderman,carl,wilderman_carl@yahoo.com,29,Seattle,Safari iPhone,2,2020-03-06 16:37:56\nMale,Marvin,Lind,marvin,marvin_lind@hotmail.com,77,Detroit,Chrome Android,2,2020-03-02 13:55:51\nFemale,Shanelle,Marquardt,shanelle,marquardt.shanelle@hotmail.com,21,Las Vegas,Chrome,1,2020-03-05 17:53:05\nFemale,Lavonne,Romaguera,lavonne,romaguera.lavonne@yahoo.com,81,Seattle,Chrome,2,2020-03-04 10:33:53\nMale,Derick,McLaughlin,derick,mclaughlin.derick@hotmail.com,47,Chicago,Chrome Android,1,2020-03-05 15:19:48\n"
Output: ["Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At", "Male,Carl,Wilderman,carl,yahoo.com,21->40,Seattle,Safari iPhone,2,afternoon", "Male,Marvin,Lind,marvin,hotmail.com,66->99,Detroit,Chrome Android,2,afternoon", "Female,Shanelle,Marquardt,shanelle,hotmail.com,21->40,Las Vegas,Chrome,1,afternoon", "Female,Lavonne,Romaguera,lavonne,yahoo.com,66->99,Seattle,Chrome,2,morning", "Male,Derick,McLaughlin,derick,hotmail.com,41->65,Chicago,Chrome Android,1,afternoon"]
```
Tip
+ (In Ruby)
You should use object DateTime :-)

DateTime.parse('2020-03-06 16:37:56', '%Y-%m-%d %H:%M:%S')
Ruby Quest06	My Data Process
Submit directory	ex02
Submit file	my_data_process.rb
Description
We have been provided with a dataset of sales from My Online Coffee Shop. It's a CSV (Comma Separated Values) (each column is separated by , and each line is separated by  ).
Our goal will be to identify customers who are more likely to buy coffee online.

This time we will need to create a function with code logic, not just return the solution hard coded. :D

Data management is a hard problem. To better solve this hard problem, we will split them into smaller ones.

Here is our second step: data transformation. This exercise follows step one.

You will receive the output of your function my_data_transform.

Our function will group the data and it will become a Hash of hash. (Wow.)
### Example:
```
"{'Gender': {'Male': 22, 'Female': 21}, 'Email': {'yahoo.com': 3, 'hotmail.com': 2}, ...}"

We will discard the column FirstName, LastName, UserName and Coffee Quantity from our output.

Your function will be prototyped: def my_data_process
It will take a string array which is the output of your function my_data_transform, it will return a json string of hash of hash following this format:
{COLUMN: {Value1: nbr_of_occurence_of_value_1, Value2: nbr_of_occurence_of_value_2, ...}, ...}
Order of Column will be the order they are in the header of the CSV (Gender first then Email, etc)
Order of the Value will be the order they appear in each line from top left.
Use STRINGS as keys (=> Do not use any symbol or any fancy things. It doesn't translate well in json. (no :Age => "Age"))
```
Function prototype (ruby)
```
##
##
## QWASAR.IO -- my_data_process
##
##
## @param {String[]} param_1
##
## @return {string}
##


def my_data_process(param_1)

end
```
### Example 00
```
Input: ["Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At", "Male,Carl,Wilderman,carl,yahoo.com,21->40,Seattle,Safari iPhone,2,afternoon", "Male,Marvin,Lind,marvin,hotmail.com,66->99,Detroit,Chrome Android,2,afternoon", "Female,Shanelle,Marquardt,shanelle,hotmail.com,21->40,Las Vegas,Chrome,1,afternoon", "Female,Lavonne,Romaguera,lavonne,yahoo.com,66->99,Seattle,Chrome,2,morning", "Male,Derick,McLaughlin,derick,hotmail.com,41->65,Chicago,Chrome Android,1,afternoon"]
Output:
'{"Gender":{"Male":3,"Female":2},"Email":{"yahoo.com":2,"hotmail.com":3},"Age":{"21->40":2,"66->99":2,"41->65":1},"City":{"Seattle":2,"Detroit":1,"Las Vegas":1,"Chicago":1},"Device":{"Safari iPhone":1,"Chrome Android":2,"Chrome":2},"Order At":{"afternoon":4,"morning":1}}'
```
