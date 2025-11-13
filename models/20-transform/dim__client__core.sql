SELECT
    c.ID as CLIENT_ID,
    c.CLIENT_NAME,
    c.CITY,
    m.COUNTRY_NAME
FROM {{ ref('raw__clients') }} c
    LEFT JOIN {{ ref('meta__country_mapping') }} m
        ON c.CLIENT_COUNTRY_ISO2 = m.COUNTRY_ISO_CODE