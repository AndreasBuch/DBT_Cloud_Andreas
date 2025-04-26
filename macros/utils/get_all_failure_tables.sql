{% macro get_all_failure_tables(model_name) %}
    {% set query %}
        select table_name
        from {{ target.database }}.information_schema.tables
        where table_schema = '{{ target.schema }}_DBT_TEST__AUDIT'
          and table_name like '%{{ model_name | upper }}%'
    {% endset %}
    
    {% set results = run_query(query) %}
    
    {% if execute %}
      {% set table_names = results.columns[0].values() %}
    {% else %}
      {% set table_names = [] %}
    {% endif %}
    
    {{ return(table_names) }}
{% endmacro %}
