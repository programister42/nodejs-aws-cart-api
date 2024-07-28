-- Create the carts table
CREATE TABLE carts (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    status VARCHAR(8) CHECK (status IN ('OPEN', 'ORDERED')) NOT NULL
);

-- Create the cart_items table
CREATE TABLE cart_items (
    cart_id UUID REFERENCES carts(id),
    product_id UUID,
    count INTEGER,
    PRIMARY KEY (cart_id, product_id)
);

-- Insert test data into carts table
INSERT INTO carts (id, user_id, created_at, updated_at, status) VALUES
('11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', '2023-10-01', '2023-10-01', 'OPEN'),
('33333333-3333-3333-3333-333333333333', '44444444-4444-4444-4444-444444444444', '2023-10-02', '2023-10-02', 'ORDERED');

-- Insert test data into cart_items table
INSERT INTO cart_items (cart_id, product_id, count) VALUES
('11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555555', 2),
('11111111-1111-1111-1111-111111111111', '66666666-6666-6666-6666-666666666666', 1),
('33333333-3333-3333-3333-333333333333', '77777777-7777-7777-7777-777777777777', 3);
