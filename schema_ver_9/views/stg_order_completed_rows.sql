-- WHT currently doesn't support some sql operations such as exploding rows of an array/json to create more rows.
-- A temporary fix to support those is by creating views and using them for the features

create view stg_order_completed_rows as 
   select 
   timestamp, 
   user_id,
    t.value['category_l1'] as category_l1, t.value['product_id'] as product_id, t.value['price'] as amount_spent
    from order_completed, TABLE(FLATTEN(parse_json(properties_products))) t