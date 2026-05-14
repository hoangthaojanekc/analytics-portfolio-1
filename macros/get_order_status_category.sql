{% macro get_order_status_category(column_name) %}
    case
        when {{ column_name }} in ('Complete', 'Shipped') then 'Active'
        when {{ column_name }} in ('Cancelled', 'Returned') then 'Inactive'
        else 'Pending'
    end
{% endmacro %}