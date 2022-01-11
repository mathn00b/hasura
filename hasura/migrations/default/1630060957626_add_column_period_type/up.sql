CREATE TYPE period_type AS ENUM ('month', 'day');
ALTER TABLE payment.bought_product
    ADD COLUMN period_type period_type;