import csv
import random
from datetime import datetime, timedelta

NUM_RECORDS = 1000

CLIENT_IDS = list(range(1, 66))      # 65 clients
PRODUCT_IDS = list(range(1, 31))     # 30 products
START_DATE = datetime(2024, 8, 15)
END_DATE = datetime(2025, 6, 30)

def random_date(start, end):
    delta = end - start
    random_days = random.randint(0, delta.days)
    return start + timedelta(days=random_days)

sales = []
for i in range(NUM_RECORDS):
    sale_id = 100001 + i
    sale_date = random_date(START_DATE, END_DATE).strftime('%Y-%m-%d')
    client_id = random.choice(CLIENT_IDS)
    product_id = random.choice(PRODUCT_IDS)
    quantity = random.randint(1, 4)
    sales.append([sale_id, sale_date, client_id, product_id, quantity])

# Sort sales by SALE_DATE ascending, then by ID
sales.sort(key=lambda x: (x[1], x[0]))

with open('raw__sales.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['ID', 'SALE_DATE', 'CLIENT_ID', 'PRODUCT_ID', 'QUANTITY'])
    writer.writerows(sales)