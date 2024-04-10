SELECT TOP (1000) [order_id]
      ,[customer_id]
      ,[order_status]
      ,[order_date]
      ,[required_date]
      ,[shipped_date]
      ,[store_id]
      ,[staff_id]
  FROM [BikeStores].[sales].[orders]
  WHERE order_date >= '2017-01-01' AND store_id = 3
