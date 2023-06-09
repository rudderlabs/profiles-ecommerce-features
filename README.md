# About

This is PB repo to create user features from event stream tables created using Rudderstack SDK

# Inputs
## Raw Tables
| name | table | path |
| ---- | ----- | ---- |
| rsCheckoutStepCompleted | CHECKOUT_STEP_COMPLETED | RUDDERSTACK_TEST_DB.DATA_APPS_SIMULATED_ECOMMERCE.CHECKOUT_STEP_COMPLETED |
| rsOrderCompleted | ORDER_COMPLETED | RUDDERSTACK_TEST_DB.DATA_APPS_SIMULATED_ECOMMERCE.ORDER_COMPLETED |
| rsProductAdded | PRODUCT_ADDED | RUDDERSTACK_TEST_DB.DATA_APPS_SIMULATED_ECOMMERCE.PRODUCT_ADDED |
## SQL Models
| name |
| ---- |
| rsItemsPurchasedEverSku |
| rsItemsPurchasedEverCte |
| rsItemsPurchasedEver |
# Identity Stitching
## user identities
| name | exclusions | sourced_from |
| ---- | ---------- | ------------ |
| user_id |  | ["rsCheckoutStepCompleted:user_id","rsOrderCompleted:user_id","rsProductAdded:user_id"] |
| checkout_id |  | [] |
| cart_id |  | [] |
| anonymous_id | unknown, NaN | [] |
# Features
## user features
| Feature | Computed From | Description |
| ------- | ------------- | ----------- |
| avg_transaction_value | rsOrderCompleted | Total price in each transaction/Total number of transactions. |
| avg_units_per_transaction | rsOrderCompleted | It shows the average units purchased in each transaction. (Total units in each transaction/Total transactions). Includes only those transactions where the total price (from column current_total_price) is greater than zero. So, the feature exclude transactions with 100% off, replacement products etc that may result in the total_price being equal to zero. |
| carts_in_past_365_days | rsProductAdded | A cart id is created for events such as create_cart,update_cart. This coln specifies how many cart ids were created in the past 365 days |
| days_since_first_purchase |  | Number of days since the user purchased the first product |
| days_since_last_cart_add |  | Number of days since the user has added a product to cart |
| days_since_last_purchase |  |  |
| gross_amt_spent_in_past | rsOrderCompleted | Total value of products purchased till date. |
| has_credit_card | rsCheckoutStepCompleted |  |
| highest_transaction_value | rsOrderCompleted | Of all the transactions done by the user, this features contains the highest transaction value. |
| items_purchased_ever | rsItemsPurchasedEver | The list of unique products bought by the user. |
| last_transaction_value | rsOrderCompleted | The total value of products that are part of the last transaction. |
| median_transaction_value | rsOrderCompleted | Median value of total price of all the transactions |
| products_added_in_past_365_days | rsProductAdded | List of products added to cart by the user in last 7 days. (array with list of all product ids). It includes all purchased products plus current active cart. |
| total_carts | rsProductAdded | Total carts created by the user till date. |
| total_products_added | rsProductAdded | Total products added to cart till date. (array with list of all product ids). It includes all purchased products plus current active cart. |
| total_transactions | rsOrderCompleted | Total number of transactions done by the user |
| transactions_in_past_90_days | rsOrderCompleted | Number of transactions in last 90 day |
