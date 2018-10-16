CREATE VIEW view_orders
AS SELECT orders.id, orders.amount, orders.order_date,discounts.percentage,payment_modes.mode_type,payments.payment_status FROM payment_modes,payments,orders,discounts WHERE payments.payment_mode_id=payment_modes.id and discounts.id=payments.discount_id and payments.id=orders.payment_id;
