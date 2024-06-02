from lxml import etree

s = open("otos.html", "r").read()
print(s)
table = etree.HTML(s).find("body/table")
rows = iter(table)
headers = [col.text for col in next(rows)]
for row in rows:
    values = [col.text for col in row]
    print(dict(zip(headers, values)))