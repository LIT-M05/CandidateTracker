USE [CandidateTracker]
GO
/****** Object:  Table [dbo].[Candidates]    Script Date: 5/28/18 10:31:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[Notes] [varchar](4000) NOT NULL,
 CONSTRAINT [PK_Candidates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetCandidateCounts]    Script Date: 5/28/18 10:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetCandidateCounts]
AS
BEGIN
	SELECT SUM(case when status = 0 then 1 else 0 end) as 'Pending', 
		   SUM(case when status = 1 then 1 else 0 end) as 'Confirmed',
		   SUM(case when status = 2 then 1 else 0 end) as 'Refused'
	FROM Candidates 
END
GO
