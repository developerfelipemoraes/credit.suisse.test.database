USE [dbCreditSuisseTest]
GO
CREATE PROCEDURE dbo.SEL_RISK_TRADE
AS 
BEGIN  
	SELECT Trade.Id
		  ,Value
		  ,ClientSector.ClientSector
		  ,
		  CASE   
			WHEN ([ClientSector].Id = 1 AND Trade.Value > ClientSector.ValueLimit ) THEN 'HIGHRISK'   
			WHEN ([ClientSector].Id = 2 AND Trade.Value > ClientSector.ValueLimit ) THEN 'MEDIUMRISK'   
			WHEN ([ClientSector].Id = 2 AND Trade.Value <= ClientSector.ValueLimit ) THEN 'LOWRISK' 
		  END AS RiskTrade
	  FROM [dbo].[Trade]
	  INNER JOIN [dbo].[ClientSector]
		 ON [dbo].[ClientSector].Id = [dbo].[Trade].ClientSectorId
   	END

GO

