{% test relationships(model, column_name, field, to) %}

with parent AS (
    SELECT 
        {{ field }} AS id
    FROM 
        {{ to }}
),

child AS (
    SELECT 
        {{ column_name }} AS id
    FROM 
        {{ model }}
)

SELECT * 
FROM child 
WHERE id IS NOT NULL 
AND   id NOT IN (SELECT id FROM parent)

{% endtest %}