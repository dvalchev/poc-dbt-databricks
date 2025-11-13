{{
  config(
    materialized = 'incremental',
    unique_key = 'SALE_ID',
    )
}}

SELECT
    ID as SALE_ID,
    SALE_DATE,
    CLIENT_ID,
    PRODUCT_ID,
    QUANTITY
FROM {{ ref('raw__sales') }} s
{% if is_incremental() %}
WHERE SALE_DATE > coalesce(
                        (SELECT MAX(SALE_DATE) FROM {{ this }}),
                        {{ start_of_time() }}
                    )
{% endif %}