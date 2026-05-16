WITH user_journey AS (
  -- Calculate the journey time per user to maintain consistency with Query 3
  SELECT
    user_id,
    traffic_source,
    DATE(event_date) AS event_day,
    TIMESTAMP_DIFF(
      MIN(CASE WHEN event_type = 'purchase' THEN event_date END), 
      MIN(CASE WHEN event_type = 'page_view' THEN event_date END), 
      MINUTE
    ) AS journey_duration
  FROM `phonic-axle-397713.city_data.Funnel_Analysys`
  GROUP BY 1, 2, 3
  HAVING journey_duration IS NOT NULL
)

SELECT 
  DATE(t1.event_date) AS event_day,
  t1.traffic_source,
  
  -- Funnel Stages (Same names as your original Query 1)
  COUNT(DISTINCT CASE WHEN t1.event_type = 'page_view' THEN t1.user_id END) AS stage_1_views,
  COUNT(DISTINCT CASE WHEN t1.event_type = 'add_to_cart' THEN t1.user_id END) AS stage_2_cart,
  COUNT(DISTINCT CASE WHEN t1.event_type = 'checkout_start' THEN t1.user_id END) AS stage_3_checkout,
  COUNT(DISTINCT CASE WHEN t1.event_type = 'payment_info' THEN t1.user_id END) AS stage_4_payment,
  COUNT(DISTINCT CASE WHEN t1.event_type = 'purchase' THEN t1.user_id END) AS stage_5_purchase,
  
  -- Revenue (Same name as your Query 4)
  SUM(CASE WHEN t1.event_type = 'purchase' THEN t1.amount ELSE 0 END) AS total_revenue,
  
  -- Journey Time (Same name as your Query 3)
  AVG(uj.journey_duration) AS avg_total_journey_minute

FROM `phonic-axle-397713.city_data.Funnel_Analysys` t1
LEFT JOIN user_journey uj 
  ON t1.user_id = uj.user_id 
  AND DATE(t1.event_date) = uj.event_day

GROUP BY 1, 2
ORDER BY 1 ASC, 2 ASC