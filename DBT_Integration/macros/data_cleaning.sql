{% macro remove_nulls(table_ref, columns) %}
    SELECT *
    FROM {{ table_ref }}
    WHERE
        {% for col in columns %}
            {{ col }} IS NOT NULL
            {% if not loop.last %} AND {% endif %}
        {% endfor %}
{% endmacro %}
