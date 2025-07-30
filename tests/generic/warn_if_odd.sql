{% test warn_if_odd(model, column_name) %}

    {{ config(severity = 'warn') }}

    SELECT * 
    FROM {{ model }}
    WHERE ({{ column_name }} % 2) = 1

{% endtest %}