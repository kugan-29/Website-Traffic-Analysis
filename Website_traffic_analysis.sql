CREATE DATABASE website_traffic;
USE website_traffic;

CREATE TABLE traffic_data (
    visit_date               DATE,
    visit_hour               TINYINT,
    country                  VARCHAR(50),
    city                     VARCHAR(50),
    traffic_source           VARCHAR(50),
    campaign                 VARCHAR(50),
    device                   VARCHAR(20),
    landing_page             VARCHAR(50),
    users                    INT,
    new_users                INT,
    sessions                 INT,
    pages_per_session        DECIMAL(5,2),
    avg_session_duration_sec INT,
    bounce_rate              DECIMAL(6,4),
    engagement_rate          DECIMAL(6,4),
    conversions              INT,
    revenue                  DECIMAL(10,2),
    month_name               VARCHAR(10),
    month_number             TINYINT,
    day_of_week              VARCHAR(15)
);

SELECT COUNT(*) AS total_rows,
       SUM(sessions) AS total_sessions,
       ROUND(SUM(revenue)) AS total_revenue,
       SUM(conversions) AS total_conversions
FROM traffic_data;

USE website_traffic;

SELECT
    COUNT(*)                          AS total_rows,
    SUM(visit_date IS NULL)
      + SUM(country IS NULL)
      + SUM(traffic_source IS NULL)
      + SUM(sessions IS NULL)
      + SUM(revenue IS NULL)          AS total_nulls,
    MIN(visit_date)                   AS start_date,
    MAX(visit_date)                   AS end_date,
    COUNT(DISTINCT visit_date)        AS distinct_days,
    SUM(new_users > users)
      + SUM(users > sessions)         AS logic_errors
FROM traffic_data;

SELECT SUM(sessions)       AS total_sessions,
       SUM(conversions)    AS total_conversions,
       ROUND(SUM(revenue)) AS total_revenue
FROM traffic_data;

SELECT traffic_source,
       SUM(sessions)       AS sessions,
       SUM(conversions)    AS conversions,
       ROUND(SUM(revenue)) AS revenue
FROM traffic_data
GROUP BY traffic_source
ORDER BY revenue DESC;

SELECT campaign,
       ROUND(SUM(revenue)) AS revenue
FROM traffic_data
GROUP BY campaign
ORDER BY revenue DESC
LIMIT 5;

SELECT month_number, month_name,
       SUM(sessions)       AS sessions,
       ROUND(SUM(revenue)) AS revenue
FROM traffic_data
GROUP BY month_number, month_name
ORDER BY month_number;

USE website_traffic;

CREATE OR REPLACE VIEW v_traffic_clean AS
SELECT
    visit_date,
    visit_hour,
    country,
    city,
    traffic_source,
    campaign,
    device,
    landing_page,
    users,
    new_users,
    sessions,
    pages_per_session,
    conversions,
    revenue,
    month_name,
    month_number,
    day_of_week,
    CASE WHEN day_of_week IN ('Saturday','Sunday')
         THEN 'Weekend' ELSE 'Weekday' END     AS day_type,
    bounce_rate * sessions                     AS bounced_sessions,
    avg_session_duration_sec * sessions        AS total_duration_sec
FROM traffic_data;

SELECT COUNT(*)                                                   AS total_rows,
       SUM(sessions)                                              AS total_sessions,
       ROUND(SUM(bounced_sessions) / SUM(sessions) * 100, 2)      AS bounce_pct,
       ROUND(SUM(total_duration_sec) / SUM(sessions), 1)          AS avg_duration_sec
FROM v_traffic_clean;

