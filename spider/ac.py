import requests
from lxml import etree
import csv

headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"

}

with open('ac.csv', mode='a', encoding='utf-8', newline='') as file:
    for j in range(71, 81):
        url = "https://atcoder.jp/users/ZZXzzx0_0/history"
        response = requests.get(url, headers=headers)
        data = etree.HTML(response.text)
        lis = data.xpath(f'//*[@id="history"]/tbody//tr[{j}]')
        writer = csv.writer(file)
        if j == 71:
            writer.writerow(['date', 'contest', 'rank', 'performance', 'new_rating', 'diff'])  # 写入表头
        for i in lis:
            t1 = i.xpath('./td[1]/time/text()')[0]
            t2 = i.xpath('./td[2]/a[1]/text()')[0]
            t3 = i.xpath('./td[3]/a/text()')[0]
            t4 = i.xpath('./td[4][span]')
            if t4:
                t4 = i.xpath('./td[4]/span/text()')[0]
            else:
                t4 = i.xpath('./td[4]/text()')[0]
            t5 = i.xpath('./td[5][span]')
            if t5:
                t5 = i.xpath('./td[5]/span/text()')[0]
            else:
                t5 = i.xpath('./td[5]/text()')[0]
            t6 = i.xpath('./td[6]/text()')[0]
            writer.writerow([t1, t2, t3, t4, t5, t6])
