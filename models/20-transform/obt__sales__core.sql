{{
  config(
    materialized = 'incremental',
    unique_key = 'SALE_ID',
    )
}}

SELECT
    s.SALE_ID,
    s.SALE_DATE,
    s.CLIENT_ID,
    c.CLIENT_NAME,
    c.CITY,
    c.COUNTRY_NAME,
    s.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.PRODUCT_CATEGORY,
    p.PRICE,
    s.QUANTITY,
    (s.QUANTITY * p.PRICE) as TOTAL_SALE_AMOUNT
FROM {{ ref('fact__sales__core') }} s
    LEFT JOIN {{ ref('dim__client__core') }} c
        ON s.CLIENT_ID = c.CLIENT_ID
    LEFT JOIN {{ ref('dim__product__core') }} p
        ON s.PRODUCT_ID = p.PRODUCT_ID
{% if is_incremental() %}
WHERE s.SALE_DATE > coalesce(
                        (SELECT MAX(SALE_DATE) FROM {{ this }}),
                        {{ start_of_time() }}
                    )
{% endif %}