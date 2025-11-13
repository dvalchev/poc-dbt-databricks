{{ 
  config(
    materialized = 'view',
    )
}}

SELECT *
FROM {{ ref('source__clients') }}