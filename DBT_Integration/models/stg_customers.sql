-- models/stg_customers.sql

WITH raw_customers AS (
    SELECT
        id, name, email,created_at 
    FROM {{ source('raw', 'customers') }}
),
cleaned_customers AS (
    {{ remove_nulls('raw_customers', ['id', 'email', 'name']) }}
),
final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['id', 'email']) }} AS customer_sk,
        id, name, email, created_at
    FROM cleaned_customers
)

SELECT * FROM final
