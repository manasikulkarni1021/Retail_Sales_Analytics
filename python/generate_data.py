
import pandas as pd
import numpy as np
from pathlib import Path

# Create the folder where our data files will be saved
data_folder = Path(__file__).resolve().parent.parent / "data"
data_folder.mkdir(exist_ok=True)

# Make the sample data repeatable
rng = np.random.default_rng(42)

# 1. Create customer data
customers = pd.DataFrame({
    "customer_id": range(1, 101),
    "customer_name": [f"Customer {i}" for i in range(1, 101)],
    "city": rng.choice(
        ["Pune", "Mumbai", "Nashik", "Nagpur", None],
        size=100
    )
})

# 2. Create product data
products = pd.DataFrame({
    "product_id": range(1, 21),
    "product_name": [f"Product {i}" for i in range(1, 21)],
    "category": rng.choice(
        ["Electronics", "Fashion", "Home", "Grocery"],
        size=20
    ),
    "unit_price": np.round(rng.uniform(100, 5000, 20), 2)
})

# 3. Create order data
number_of_orders = 500

orders = pd.DataFrame({
    "order_id": range(1001, 1001 + number_of_orders),
    "customer_id": rng.integers(1, 101, number_of_orders),
    "product_id": rng.integers(1, 21, number_of_orders),
    "order_date": (
        pd.Timestamp("2025-01-01")
        + pd.to_timedelta(
            rng.integers(0, 365, number_of_orders),
            unit="D"
        )
    ),
    "quantity": rng.integers(1, 6, number_of_orders)
})

# Get the correct price for each product
price_lookup = products.set_index("product_id")["unit_price"]
orders["unit_price"] = orders["product_id"].map(price_lookup)

# Calculate sales amount
orders["sales_amount"] = (
    orders["quantity"] * orders["unit_price"]
).round(2)

# Save all three datasets as CSV files
customers.to_csv(data_folder / "customers.csv", index=False)
products.to_csv(data_folder / "products.csv", index=False)
orders.to_csv(data_folder / "orders.csv", index=False)

print("SUCCESS! Your datasets have been created.")
print("Customers:", len(customers))
print("Products:", len(products))
print("Orders:", len(orders))
print("Saved to:", data_folder)
