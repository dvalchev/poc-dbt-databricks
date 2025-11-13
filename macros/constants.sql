{%- macro start_of_time() -%}
    to_date('01-01-1900', 'dd-mm-yyyy')
{%- endmacro -%}

{%- macro end_of_time() -%}
    to_date('31-12-2999', 'dd-mm-yyyy')
{%- endmacro -%}