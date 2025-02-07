import random
import faker
from datetime import datetime, timedelta

def generate_sql_inserts(num_products, num_customers, num_dates, num_sales):
    fake = faker.Faker()
    
    sql_statements = []
    
    # Generate Products Data
    products = []
    for i in range(1, num_products + 1):
        product_name = fake.word().capitalize()
        category = random.choice(["Electronics", "Clothing", "Food", "Books", "Toys"])
        price = round(random.uniform(5, 500), 2)
        products.append((i, product_name, category, price))
        sql_statements.append(f"INSERT INTO `default`.products VALUES ({i}, '{product_name}', '{category}', {price});")
    
    # Generate Customers Data
    customers = []
    for i in range(1, num_customers + 1):
        customer_name = fake.name().replace("'", "")
        location = fake.city()
        age = random.randint(18, 80)
        customers.append((i, customer_name, location, age))
        sql_statements.append(f"INSERT INTO `default`.customers VALUES ({i}, '{customer_name}', '{location}', {age});")
    
    # Generate Dates Data
    dates = []
    start_date = datetime(2020, 1, 1)
    for i in range(num_dates):
        date = start_date + timedelta(days=i)
        day_name = date.strftime('%A')
        month_name = date.strftime('%B')
        year = date.year
        dates.append((date.strftime('%Y-%m-%d'), day_name, month_name, year))
        sql_statements.append(f"INSERT INTO `default`.dates VALUES ('{date.strftime('%Y-%m-%d')}', '{day_name}', '{month_name}', {year});")
    
    # Generate Sales Data
    for i in range(1, num_sales + 1):
        sale_id = i
        product_id = random.randint(1, num_products)
        customer_id = random.randint(1, num_customers)
        date_id = random.choice(dates)[0]
        quantity = random.randint(1, 10)
        total_amount = round(quantity * next(p[3] for p in products if p[0] == product_id), 2)
        sql_statements.append(f"INSERT INTO `default`.sales VALUES ({sale_id}, {product_id}, {customer_id}, '{date_id}', {quantity}, {total_amount});")
    
    return "\n".join(sql_statements)

# Example: Adjust the number of rows as needed
num_products = 100
num_customers = 200
num_dates = 365
num_sales = 3000

sql_script = generate_sql_inserts(num_products, num_customers, num_dates, num_sales)

# Save to a file
with open("sql/star_schema_data.sql", "w") as f:
    f.write(sql_script)

print("SQL file generated successfully: star_schema_data.sql")
