{% macro union_failed_ids(model_name) %}
  {% set failure_tables = get_all_failure_tables(model_name) %}
  
  {% if failure_tables | length == 0 %}
    select null as id where false
  {% else %}
    {% set selects = [] %}
    
    {% for table in failure_tables %}
      {% set parts = table.split('_') %}
      {% set test_type = parts[0] %}

      {% set field_name = get_failure_field_name(test_type | lower) %}
      
      {% set select_sql %}
        select {{ field_name }} as id
        from {{ adapter.quote(target.database) }}.{{ adapter.quote(target.schema ~ '_DBT_TEST__AUDIT') }}.{{ adapter.quote(table) }}
      {% endset %}
      
      {% do selects.append(select_sql) %}
    {% endfor %}
    
    {{ return(selects | join(' union all ')) }}
  {% endif %}
{% endmacro %}
