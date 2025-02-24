CREATE TABLE `default`.products (
    product_id UInt32,
    product_name String,
    category String,
    price Float32
) ENGINE = MergeTree()
ORDER BY product_id;

CREATE TABLE `default`.customers (
    customer_id UInt32,
    customer_name String,
    location String,
    age UInt8
) ENGINE = MergeTree()
ORDER BY customer_id;

CREATE TABLE `default`.dates (
    date_id Date,
    day_name String,
    month_name String,
    year UInt16
) ENGINE = MergeTree()
ORDER BY date_id;

CREATE TABLE `default`.sales (
    sale_id UInt32,
    product_id UInt32,
    customer_id UInt32,
    date_id Date,
    quantity UInt32,
    total_amount Float32
) ENGINE = MergeTree()
ORDER BY (date_id, sale_id);

-- 

CREATE TABLE `default`.sales (
    sale_id UInt32,
    product_id UInt32,
    customer_id UInt32,
    date_id Date,
    quantity SimpleAggregateFunction(sum, UInt32), 
    total_amount SimpleAggregateFunction(sum, Float32)
) ENGINE = AggregatingMergeTree()
ORDER BY (date_id, sale_id);


CREATE TABLE `default`.sales (
    sale_id UInt32,
    product_id UInt32,
    customer_id UInt32,
    date_id Date,
    quantity UInt32,
    total_amount Float32
) ENGINE = Log;


