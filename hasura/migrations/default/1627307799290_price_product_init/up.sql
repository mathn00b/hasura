CREATE SCHEMA IF NOT EXISTS pricing;

CREATE TABLE IF NOT EXISTS pricing.price_products(
    product_id uuid NOT NULL DEFAULT gen_random_uuid(),
    product_name VARCHAR NOT NULL,
    product_price DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (product_id)
);
