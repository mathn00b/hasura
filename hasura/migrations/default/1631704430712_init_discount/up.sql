CREATE TABLE IF NOT EXISTS pricing.subscriptions(
    id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
    product_id UUID NOT NULL REFERENCES pricing.price_products(product_id),
    discount NUMERIC NOT NULL
);

COMMENT ON TABLE pricing.subscriptions is 'Table with data on which products are subscriptions at the same time';
COMMENT ON COLUMN pricing.subscriptions.id is 'Subscription id';
COMMENT ON COLUMN pricing.subscriptions.product_id is 'Reference what kind of product is';
COMMENT ON COLUMN pricing.subscriptions.discount is 'How many percent of the discount does the subscription give';

CREATE TABLE IF NOT EXISTS pricing.trial_periods(
    id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
    free_period_offer_through TIMESTAMP WITH TIME ZONE,
    free_period INT NOT NULL,
    free_period_type period_type NOT NULL
);

COMMENT ON TABLE pricing.trial_periods is 'Table with possible trial periods for products';
COMMENT ON COLUMN pricing.trial_periods.id is 'Trial period id';
COMMENT ON COLUMN pricing.trial_periods.free_period_offer_through is 'Through what date is the offer with a free period valid';
COMMENT ON COLUMN pricing.trial_periods.free_period is 'How long does the free period last (conditional units)';
COMMENT ON COLUMN pricing.trial_periods.free_period_type is 'Value of the conditional unit';

CREATE TABLE IF NOT EXISTS pricing.product_trial_periods(
    id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
    product_id UUID NOT NULL REFERENCES pricing.price_products(product_id),
    trial_period_id UUID NOT NULL REFERENCES pricing.trial_periods(id)
);

COMMENT ON TABLE pricing.product_trial_periods is 'Many-to-mane relationship table between products and trial periods';
COMMENT ON COLUMN pricing.product_trial_periods.id is 'Relationship id';
COMMENT ON COLUMN pricing.product_trial_periods.product_id is 'Reference the product for which the trial period is applied';
COMMENT ON COLUMN pricing.product_trial_periods.trial_period_id is 'Reference the trial period apply to this product';