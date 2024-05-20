-- NEW DONATIONS
--DROP VIEW IF EXISTS [new_donations_view]
CREATE VIEW new_donations_view AS
SELECT CAST(DATEADD(WEEK, 
				DATEDIFF(WEEK, 0, Close_Date), 
				0) as date) AS [DATE],   --cast 'as date' to force the data-type to 'date' and not 'datetime'
	SUM(FirstGiftOnly) AS [donations]
FROM [NewDonationsBeginningJan2021-sub5k]
GROUP BY CAST(DATEADD(WEEK, DATEDIFF(WEEK, 0, Close_Date), 0) as date)  -- cast as date to match the select cast

-- DROP VIEW view_union_FB_AdsManager
CREATE VIEW view_union_FB_AdsManager AS
SELECT * 
FROM [FB-AdsManagerReportApr5-2021-Dec31-2021]
UNION
SELECT *
FROM [FB-AdsManagerReport-2022]
UNION
SELECT *
FROM [FB-AdsManagerReport-2023]
UNION
SELECT *
FROM [FB-AdsManagerReport-2024-partial]

  --Combine Sprout Social yearly tables
--DROP VIEW IF EXISTS [view_union_sprout]
CREATE VIEW view_union_sprout AS
SELECT * 
FROM [Competitor Performance(Sprout)_2021]
UNION
SELECT *
FROM [Competitor Performance(Sprout)_2022]
UNION
SELECT *
FROM [Competitor Performance(Sprout)_2023]
UNION
SELECT *
FROM [Competitor Performance(Sprout)_2024-partial]

  --ORGANIC FB
--DROP VIEW IF EXISTS [view_fb_Org_weekly]
CREATE VIEW view_fb_Org_weekly AS
 SELECT 
  DATEADD(WEEK, DATEDIFF(WEEK, 0, [Date]), 0) [DATE], SUM(Audience) [fb_org_I]
 FROM view_union_sprout
 WHERE (Profile LIKE '%company%') AND (Network like 'Facebook')
 GROUP BY DATEADD(WEEK, DATEDIFF(WEEK, 0, [Date]), 0)

   --ORGANIC IG
--DROP VIEW IF EXISTS [view_ig_Org_weekly]
CREATE VIEW view_ig_Org_weekly AS
 SELECT 
  DATEADD(WEEK, DATEDIFF(WEEK, 0, [Date]), 0) [DATE], SUM(Audience) [ig_org_I]
 FROM view_union_sprout
 WHERE (Profile LIKE '%company%') AND (Network like 'Instagram')
 GROUP BY DATEADD(WEEK, DATEDIFF(WEEK, 0, [Date]), 0)

    --ORGANIC X
--DROP VIEW IF EXISTS [view_x_Org_weekly]
CREATE VIEW view_x_Org_weekly AS
 SELECT 
  DATEADD(WEEK, DATEDIFF(WEEK, 0, [Date]), 0) [DATE], SUM(Audience) [x_org_I]
 FROM view_union_sprout
 WHERE (Profile LIKE '%company%') AND (Network like 'X')
 GROUP BY DATEADD(WEEK, DATEDIFF(WEEK, 0, [Date]), 0)

 -- NEW DONATIONS
--DROP VIEW IF EXISTS [new_donations_view]
CREATE VIEW new_donations_view AS
 SELECT CAST(DATEADD(WEEK, 
				DATEDIFF(WEEK, 0, Close_Date), 
				0) as date) AS [DATE],   --cast 'as date' to force the data-type to 'date' and not 'datetime'
	Sum(FirstGiftOnly) AS [donations]
 FROM NewDonationBeginningJan2021
 GROUP BY CAST(DATEADD(WEEK, DATEDIFF(WEEK, 0, Close_Date), 0) as date)  -- cast as date to match the select cast

 -- SUBSCRIBERS
--DROP VIEW IF EXISTS [subscriber_view]
CREATE VIEW subscriber_view AS
 SELECT DATEADD(WEEK, DATEDIFF(WEEK, 0, Created_Date), 0) [DATE], 
		COUNT(Account_ID) [subscribers]
 FROM [Subscribers-2022-2024]
 GROUP BY DATEADD(WEEK, DATEDIFF(WEEK, 0, Created_Date), 0)

 --AGENCY IMPRESSIONS
--DROP VIEW IF EXISTS [view_m_impr]
CREATE VIEW view_m_impr AS
 SELECT DATEADD(WEEK, DATEDIFF(WEEK, 0, Interaction_Date), 0) [DATE], 
		SUM(Impressions) impr
 FROM [m_impressions_2022_2024]
 GROUP BY DATEADD(WEEK, DATEDIFF(WEEK, 0, Interaction_Date), 0)
 
  -- FACEBOOK
--DROP VIEW IF EXISTS [view_facebook_feed]
CREATE VIEW view_facebook_feed AS
 SELECT DATEADD(WEEK, DATEDIFF(WEEK, 0, [DATE]), 0) AS [DATE], 
	SUM(Amount_spent_USD) [fb_spend],  
	SUM(Impressions) AS fb_impr,
	Placement
 FROM [FB-AdsManagerReport_comp-facebook]
 WHERE Placement LIKE 'feed'
 GROUP BY DATEADD(WEEK, DATEDIFF(WEEK, 0, [DATE]), 0), Placement
 
  -- FACEBOOK
--DROP VIEW IF EXISTS [view_facebook_reels]
CREATE VIEW view_facebook_reels AS
 SELECT DATEADD(WEEK, DATEDIFF(WEEK, 0, [DATE]), 0) AS [DATE], 
	SUM(Amount_spent_USD) [fb_spend],  
	SUM(Impressions) AS fb_impr
 FROM [FB-AdsManagerReport_comp-facebook]
 WHERE Placement LIKE '%reels%'
 GROUP BY DATEADD(WEEK, DATEDIFF(WEEK, 0, [DATE]), 0)

 -- FACEBOOK
--DROP VIEW IF EXISTS [view_facebook_video]
CREATE VIEW view_facebook_video AS
 SELECT DATEADD(WEEK, DATEDIFF(WEEK, 0, [DATE]), 0) AS [DATE], 
	SUM(Amount_spent_USD) [fb_spend],  
	SUM(Impressions) AS fb_impr
 FROM [FB-AdsManagerReport_comp-facebook]
 WHERE Placement LIKE '%video%'
 GROUP BY DATEADD(WEEK, DATEDIFF(WEEK, 0, [DATE]), 0)

  -- INSTAGRAM
--DROP VIEW IF EXISTS [view_instagram]
CREATE VIEW view_instagram AS
 SELECT DATEADD(WEEK, DATEDIFF(WEEK, 0, [DATE]), 0) AS [DATE], 
	Sum(Amount_spent_USD) [ig_spend], 
	SUM(Impressions) AS ig_impr
 FROM [FB-AdsManagerReport_comp-instagram]
 GROUP BY DATEADD(WEEK, DATEDIFF(WEEK, 0, [DATE]), 0)

 -- COMPETION-1
--DROP VIEW IF EXISTS [view_comp_1]
CREATE VIEW view_comp_1 AS
 SELECT 
  DATEADD(WEEK, DATEDIFF(WEEK, 0, [Date]), 0) [DATE], SUM(Audience) [comp_1_I]
 FROM [Competitor Performance(SproutScl)Jan12023 Apr222024]
 WHERE (Profile LIKE '%COMP1%')
 GROUP BY DATEADD(WEEK, DATEDIFF(WEEK, 0, [Date]), 0)

 -- COMPETION-2
--DROP VIEW IF EXISTS [view_comp_2]
CREATE VIEW view_comp_2 AS
 SELECT 
  DATEADD(WEEK, DATEDIFF(WEEK, 0, [Date]), 0) [DATE], SUM(Audience) [comp_2_I]
 FROM [Competitor Performance(SproutScl)Jan12023 Apr222024]
 WHERE (Profile LIKE '%COMP2%')
 GROUP BY DATEADD(WEEK, DATEDIFF(WEEK, 0, [Date]), 0)

 -- COMPETION-3
--DROP VIEW IF EXISTS [view_comp_3]
CREATE VIEW view_comp_3 AS
 SELECT 
  DATEADD(WEEK, DATEDIFF(WEEK, 0, [Date]), 0) [DATE], SUM(Audience) [comp_3_I]
 FROM [Competitor Performance(SproutScl)Jan12023 Apr222024]
 WHERE (Profile LIKE '%COMP3%')
 GROUP BY DATEADD(WEEK, DATEDIFF(WEEK, 0, [Date]), 0)

--Need to run DROP separatley first...
--DROP VIEW IF EXISTS [view_joined]

CREATE VIEW view_joined AS
 SELECT d.DATE,
	convert(int, d.donations) as donations,     -- convert to get rid of floating point
	COALESCE(m_spend.mv_S,0) as m_S,			-- Coalesce to replace all NULL with zero
	COALESCE(view_m_impr.impr,0) as m_I,
	COALESCE(view_facebook_feed.fb_spend,0) as fb_feed_S,
	COALESCE(view_facebook_feed.fb_impr, 0) as fb_feed_I,
	COALESCE(view_facebook_video.fb_spend,0) as fb_video_S,
	COALESCE(view_facebook_video.fb_impr, 0) as fb_video_I,
	COALESCE(view_facebook_reels.fb_spend,0) as fb_reels_S,
	COALESCE(view_facebook_reels.fb_impr, 0) as fb_reels_I,
	COALESCE(view_instagram.ig_spend,0) as instagram_S,
	COALESCE(view_instagram.ig_impr, 0) as instagram_I,
	COALESCE(radio_S.radio_S,0) as radio_S,
	COALESCE(radio_I.radio_I,0) as radio_I,
	COALESCE(pr_S.pr_spend,0) as pr_S,
	COALESCE([Youtube_MMM_Jan2021-May2024].Cost,0) as youtube_S,  -- needs [] because of dash in the name
	COALESCE([Youtube_MMM_Jan2021-May2024].Impr,0) as youtube_I,
	COALESCE([GoogleSearch_MMM_Jan2021-May2024].Cost,0) as search_S,  -- needs [] because of dash in the name
	COALESCE([GoogleSearch_MMM_Jan2021-May2024].Clicks,0) as search_clicks_P,
	COALESCE(view_comp_1.[comp_1_I],0) as comp_1_I,
	COALESCE(view_comp_2.[comp_2_I],0) as comp_2_I,
	COALESCE(view_comp_3.[comp_3_I],0) as comp_3_I,
	COALESCE(subscriber_view.subscribers, 0) as subscriber,
	COALESCE(view_fb_Org_weekly.fb_org_I,0) as fb_O_I,
	COALESCE(view_ig_Org_weekly.ig_org_I,0) as ig_O_I,
	COALESCE(view_x_Org_weekly.x_org_I,0) as x_O_I,
	COALESCE([events].event,'') as event	-- Coalesce to replace all NULL with blank text
 FROM new_donations_view AS d				--Use internal view created in other query
 FULL JOIN view_facebook_feed 
	ON d.DATE = view_facebook_feed.DATE
 FULL JOIN view_facebook_video 
	ON d.DATE = view_facebook_video.DATE
 FULL JOIN view_facebook_reels 
	ON d.DATE = view_facebook_reels.DATE
 FULL JOIN view_instagram 
	ON d.DATE = view_instagram.DATE
 FULL JOIN  m_spend
	ON d.DATE = [m_spend].DATE
 FULL JOIN  view_m_impr
	ON d.DATE = view_m_impr.DATE
 FULL JOIN radio_S
	ON d.DATE = [radio_S].DATE
 FULL JOIN radio_I
	ON d.DATE = [radio_I].DATE
 FULL JOIN pr_S
	ON d.DATE = [pr_S].DATE
 FULL JOIN [Youtube_MMM_Jan2021-May2024]				-- both _S and _I
	ON d.DATE = [Youtube_MMM_Jan2021-May2024].DATE
 FULL JOIN [GoogleSearch_MMM_Jan2021-May2024]			-- both _S and _I
	ON d.DATE = [GoogleSearch_MMM_Jan2021-May2024].[Week]
 FULL JOIN [events]
	ON d.DATE = [events].DATE
 FULL JOIN subscriber_view
	ON d.DATE = subscriber_view.DATE
 FULL JOIN view_comp_1
	ON d.DATE = view_comp_1.DATE
 FULL JOIN view_comp_2
	ON d.DATE = view_comp_2.DATE
 FULL JOIN view_comp_3
	ON d.DATE = view_comp_3.DATE
 FULL JOIN view_fb_Org_weekly 
	ON d.DATE = view_fb_Org_weekly.DATE
 FULL JOIN view_ig_Org_weekly 
	ON d.DATE = view_ig_Org_weekly.DATE
 FULL JOIN view_x_Org_weekly 
	ON d.DATE = view_x_Org_weekly.DATE


SELECT *
FROM view_joined
ORDER BY DATE asc

EXEC sp_help view_fb_impr

