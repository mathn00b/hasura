-- add new value ('no_such_product') to enum
ALTER TABLE payment.transaction
    ALTER COLUMN cancellation_reason TYPE VARCHAR(255);
DROP TYPE IF EXISTS cancellation_reason_type;
CREATE TYPE cancellation_reason_type AS ENUM (
    'invalid_card_data',
    'insufficient_funds',
    'other',
    'already_paid',
    'no_such_product');
ALTER TABLE payment.transaction
    ALTER COLUMN cancellation_reason TYPE cancellation_reason_type
        USING (cancellation_reason::cancellation_reason_type);