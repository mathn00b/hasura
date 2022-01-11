ALTER TABLE payment.transaction ADD COLUMN bought_product_id uuid REFERENCES payment.bought_product(id);
ALTER TABLE payment.transaction ADD COLUMN process_id VARCHAR;

ALTER TABLE payment.bought_product DROP COLUMN transaction_id;
ALTER TABLE payment.bought_product DROP COLUMN last_renewal_date;

COMMENT ON COLUMN payment.transaction.process_id IS 'This is variable needed for correct work subscription to frontend';
COMMENT ON COLUMN payment.transaction.bought_product_id IS 'PK bought_product';