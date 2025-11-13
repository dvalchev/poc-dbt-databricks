SELECT 
    ID as PRODUCT_ID,
    PRODUCT_NAME,
    PRODUCT_CATEGORY,
    PRICE
FROM {{ ref('raw__products') }}