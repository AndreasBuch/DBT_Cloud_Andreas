{% macro get_failure_field_name(test_type) %}
  {% if test_type == 'unique' %}
    {{ return('UNIQUE_FIELD') }}
  {% elif test_type == 'not' %}
    {{ return('NOT_NULL_FIELD') }}
  {% elif test_type == 'accepted_values' %}
    {{ return('ACCEPTED_VALUES_FIELD') }}
  {% else %}
    {{ exceptions.raise_compiler_error("Unknown test type: " ~ test_type) }}
  {% endif %}
{% endmacro %}
