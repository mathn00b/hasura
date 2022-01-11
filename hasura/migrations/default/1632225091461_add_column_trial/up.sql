ALTER TABLE payment.bought_product
    ADD COLUMN trial BOOLEAN;

COMMENT ON COLUMN payment.bought_product.trial is 'column for mark trial subscription';

ALTER TABLE payment.user_payment_method
    ALTER COLUMN card_type TYPE VARCHAR(255);
DROP TYPE IF EXISTS card_type;