CREATE TYPE cancellation_reason_type AS ENUM ('invalid_card_data', 'insufficient_funds', 'other', 'already_paid');

ALTER TABLE payment.transaction
    ADD COLUMN cancellation_reason cancellation_reason_type;
ALTER TABLE payment.transaction ALTER COLUMN payment_id DROP NOT NULL;