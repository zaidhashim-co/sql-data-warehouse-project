# 📑 Data Dictionary (Gold Layer)

## 📌 Overview
The **Gold Layer** represents the business-level data store, fully optimized and structured to support analytical, reporting, and business intelligence (BI) use cases. 

This layer consists of high-quality, cleansed, and transformed **Dimension tables** (to store descriptive attributes) and **Fact tables** (to store measurable, quantitative data) organized in a Star Schema design. This ensures fast query performance and reliable data driven insights.

---

## 1. `gold.dim_customers`
* **Purpose:** Stores comprehensive customer profiles enriched with demographic and geographic data to support customer segmentation and sales analysis.

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| **customer_key** | INT | Surrogate key uniquely identifying each customer record in the dimension table. |
| **customer_id** | INT | Unique numerical identifier assigned to each customer from the source system. |
| **customer_number** | NVARCHAR(50) | Alphanumeric identifier representing the customer, used for tracking and business referencing. |
| **first_name** | NVARCHAR(50) | The customer's first name, as recorded in the system. |
| **last_name** | NVARCHAR(50) | The customer's last name or family name. |
| **country** | NVARCHAR(50) | The country of residence for the customer (e.g., 'Australia'). |
| **marital_status** | NVARCHAR(50) | The marital status of the customer (e.g., 'Married', 'Single'). |
| **gender** | NVARCHAR(50) | The gender of the customer (e.g., 'Male', 'Female', 'n/a'). |
| **birthdate** | DATE | The date of birth of the customer, formatted as YYYY-MM-DD. |
| **create_date** | DATE | The date and time when the customer record was originally created in the system. |

---

## 2. `gold.dim_products`
* **Purpose:** Provides detailed information about the products, including categorization, naming, and cost attributes for catalog analysis.

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| **product_key** | INT | Surrogate key uniquely identifying each product record in the product dimension table. |
| **product_id** | INT | A unique identifier assigned to the product for internal tracking and referencing. |
| **product_number** | NVARCHAR(50) | A structured alphanumeric code representing the product, often used for categorization or inventory. |
| **product_name** | NVARCHAR(50) | Descriptive name of the product, including key details such as type, color, and size. |
| **category_id** | NVARCHAR(50) | A unique identifier for the product's category, linking to its high-level classification. |
| **category** | NVARCHAR(50) | The broader classification of the product (e.g., Bikes, Components) to group related items. |
| **subcategory** | NVARCHAR(50) | A more detailed classification of the product within the category, such as product type. |
| **maintenance_required**| NVARCHAR(50) | Indicates whether the product requires regular maintenance or service (e.g., 'Yes', 'No'). |
| **cost** | INT | The cost or base price of the product, measured in monetary units. |
| **product_line** | NVARCHAR(50) | The specific product line or series to which the product belongs (e.g., Road, Mountain). |
| **start_date** | DATE | The date when the product became available for sale or use, stored in YYYY-MM-DD. |

---

## 3. `gold.fact_sales`
* **Purpose:** Stores transactional sales performance data, linking metrics with dimensions to evaluate revenue, quantities, and pricing.

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| **order_number** | NVARCHAR(50) | A unique alphanumeric identifier for each sales order (e.g., 'SO54496'). |
| **product_key** | INT | Surrogate key linking the order to the `gold.dim_products` table. |
| **customer_key** | INT | Surrogate key linking the order to the `gold.dim_customers` table. |
| **order_date** | DATE | The date when the sales order was placed by the customer. |
| **shipping_date** | DATE | The date when the order was officially shipped to the customer. |
| **due_date** | DATE | The date when the order payment or delivery was due. |
| **sales_amount** | INT | The total monetary value of the sale for the line item, in whole currency units. |
| **quantity** | INT | The number of units of the product ordered for the line item. |
| **price** | INT | The price per unit of the product for the line item, in whole currency units. |
