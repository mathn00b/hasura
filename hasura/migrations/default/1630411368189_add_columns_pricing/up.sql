-- delete test data from 1627897936443_insert_price_product migration
DELETE FROM pricing.price_products;

ALTER TABLE pricing.price_products
    DROP COLUMN product_price;

-- add prices for different periods
-- add foreign id columns
CREATE TYPE platform_type AS ENUM ('SC', 'SBO');

ALTER TABLE pricing.price_products
    ADD COLUMN product_type VARCHAR,
    ADD COLUMN platform platform_type NOT NULL,
    ADD COLUMN platform_id VARCHAR NOT NULL,
    ADD COLUMN day_price NUMERIC,
    ADD COLUMN month_price NUMERIC,
    ADD COLUMN year_price NUMERIC;

COMMENT ON COLUMN pricing.price_products.product_type is 'Type of education material';
COMMENT ON COLUMN pricing.price_products.platform is 'Selling platform';
COMMENT ON COLUMN pricing.price_products.platform_id is 'Product ID on the selling platform';
COMMENT ON COLUMN pricing.price_products.day_price is 'Price of the product for one day';
COMMENT ON COLUMN pricing.price_products.month_price is 'Price of the product for one month';
COMMENT ON COLUMN pricing.price_products.year_price is 'Price of the product for one year';

CREATE UNIQUE INDEX IF NOT EXISTS pricing_platform_idx ON pricing.price_products(platform, platform_id);

-- change type for join capability
ALTER TABLE payment.bought_product
    ALTER COLUMN product_id TYPE uuid USING product_id::uuid;

-- add new value ('year') to enum
ALTER TABLE payment.bought_product
    ALTER COLUMN period_type TYPE VARCHAR(255);
DROP TYPE IF EXISTS period_type;
CREATE TYPE period_type AS ENUM (
    'day',
    'month',
    'year'
);
ALTER TABLE payment.bought_product
    ALTER COLUMN period_type TYPE period_type
    USING (period_type::period_type);

-- switch from double to numeric
ALTER TABLE payment.transaction
    ALTER COLUMN amount TYPE NUMERIC USING amount::NUMERIC;