{{
  config(
    materialized = 'table',
    )
}}

SELECT
    month(SALE_DATE) as SALE_MONTH,
    COUNTRY_NAME,
    SUM(TOTAL_SALE_AMOUNT) as TOTAL_SALES
FROM {{ ref('obt__sales__core') }} s
GROUP BY SALE_MONTH, COUNTRY_NAME
