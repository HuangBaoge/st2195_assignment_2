
from bs4 import BeautifulSoup
import requests
import pandas as pd

url="https://en.wikipedia.org/wiki/Comma-separated_values"

# Make a GET request to fetch the raw HTML content
html_content = requests.get(url).text

# Parse the html content
soup = BeautifulSoup(html_content, "lxml")
# print(soup.prettify()) # print the parsed data of html

table_data = soup.find('table', class_ = "wikitable")
print(table_data)

headers = []
for i in table_data.find_all('th'):
    title = i.text.strip()
    headers.append(title)

list=[]
table_rows = table_data.find_all('tr')
for tr in table_rows:
    td = tr.find_all('td')
    row = [i.text for i in td]
    list.append(row)

print(list)
list.pop(0)
print(list)

df1 = pd.DataFrame(list, columns = headers)
df1

df1.to_csv (r'D:\2021 Subjects\IS2195\st2195_assignment_2\python_csv\test.csv', index = False, header=True)
