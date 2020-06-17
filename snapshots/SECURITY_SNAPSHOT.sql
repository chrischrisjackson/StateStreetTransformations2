{% snapshot security_snapshot %}

{{
    config(
      unique_key='UNIQUE_SECURITY_ID',
      updated_at='INGESTION_TIME',
    )
}}

select * from {{ source('PUBLIC', 'SMF') }}

{% endsnapshot %}
