import requests
from lxml import etree
import csv
headers = {   "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"}
with open('cf.csv', mode='a', encoding='utf-8', newline='') as file:
    for j in range(1, 11):
        url = "https://codeforces.com/contests/with/Vanthoci"
        response = requests.get(url, headers=headers)
        data = etree.HTML(response.text)
        lis = data.xpath(f'//*[@id="pageContent"]/div[4]/div[6]/table/tbody/tr[{j}]')
        writer = csv.writer(file)
        if j == 1:
            writer.writerow(['contest', 'start_time', 'rank', 'solved', 'rating_change', 'new_rating'])  # 写入表头
        for i in lis:
            t2 = i.xpath('./td[2]/a/text()')[0][2:-2].strip()
            t3 = i.xpath('./td[3]/a/@href')
            t3 = t3[0].split("?")[1]
            # 使用字符串的split方法按'&'分割参数字符串，然后获取每个参数
            parts = t3.split('&')
            day = next(p for p in parts if p.startswith('day='))
            month = next(p for p in parts if p.startswith('month='))
            year = next(p for p in parts if p.startswith('year='))
            hour = next(p for p in parts if p.startswith('hour='))
            min_ = next(p for p in parts if p.startswith('min='))
            sec = next(p for p in parts if p.startswith('sec='))
            # 使用字符串的split方法按'='分割每个参数，提取值
            day = day.split('=')[1]
            month = month.split('=')[1]
            year = year.split('=')[1]
            hour = hour.split('=')[1]
            min_ = min_.split('=')[1]
            sec = sec.split('=')[1]
            # 格式化日期和时间
            formatted_time = f"{year}-{month}-{day} {hour}-{min_}-{sec}"
            t4 = i.xpath('./td[4]/a/text()')[0]
            t5 = i.xpath('./td[5]/a/text()')[0][3:-2].strip()
            t6 = i.xpath('./td[6]/span/text()')[0]
            t7 = i.xpath('./td[7]/text()')[0][3:-2].strip()
            writer.writerow([t2, formatted_time, t4, t5, t6, t7])
