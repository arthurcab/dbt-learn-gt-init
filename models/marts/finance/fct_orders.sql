with orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

stripe as (
    select * from {{ ref('stg_jaffle_shop__stripe') }}
)

select
    order_id,
    customer_id,
    order_date,
    order_status,
    payment_status,
    amount

from orders
left join stripe using (order_id)