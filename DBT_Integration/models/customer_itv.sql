select
    *,
    total_revenue / nullif(total_orders, 0) as avg_order_value
from {{ ref('customer_orders') }}
