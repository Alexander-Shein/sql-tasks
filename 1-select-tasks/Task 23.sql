CREATE DATABASE [ComissionCalculator];




GO


/****** Object:  Database [ComissionCalculator]    Script Date: 07.09.2017 15:00:16 ******/

CREATE TABLE [ComissionCalculator].[dbo].[Formula] (
[Id] int IDENTITY(1,1) NOT NULL,
[Code] nvarchar(20) DEFAULT ('') NOT NULL ,
[Description] nvarchar(120) DEFAULT ('') NOT NULL ,
[FormulaPurpouse] tinyint DEFAULT (1) NOT NULL ,
[Formulatype] tinyint DEFAULT (1) NOT NULL ,
[HasSubExpression] bit DEFAULT (0) NOT NULL ,
[SubExpressionCount] tinyint DEFAULT (0) NOT NULL ,
[EditableExpression] nvarchar(max) DEFAULT ('') NOT NULL ,
[EvalExpression] nvarchar(max) DEFAULT ('') NOT NULL ,
[ActivationDate] date NOT NULL ,
[Notes] nvarchar(max) DEFAULT ('') NOT NULL ,
[IsActive] bit DEFAULT (1) NOT NULL,
[CreatedBy] int DEFAULT (0) NOT NULL ,
[DateCreated] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[DateModified] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[Ts] timestamp NOT NULL
CONSTRAINT [PK_Formula_Id] PRIMARY KEY([Id]),
CONSTRAINT [IDX_Formula_Code_U_N] UNIQUE([Code])
);

CREATE TABLE [ComissionCalculator].[dbo].[FormulaSubExpression] (
[Id] int  IDENTITY(1,1) NOT NULL,
[FormulaId] int  NOT NULL,
[Description] nvarchar(80) DEFAULT ('') NOT NULL ,
[SubExprindex] tinyint DEFAULT (0) NOT NULL ,
[EditableSubExpression] nvarchar(2000) DEFAULT ('') NOT NULL ,
[EvalSubExpression] nvarchar(2000) DEFAULT ('') NOT NULL ,
[CreatedBy] int DEFAULT (0) NOT NULL ,
[ModifiedBy] int DEFAULT (0) NOT NULL ,
[DateCreated] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[DateModified] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[Ts] timestamp NOT NULL
CONSTRAINT [PK_FormulasubExpression_Id] PRIMARY KEY ([Formulaid])
CONSTRAINT [FK_FormulasubExpression_Formulaid_Formula_Id] FOREIGN KEY([FormulaId])
REFERENCES [ComissionCalculator].[dbo].[Formula] ([Id])
);

CREATE TABLE [ComissionCalculator].[dbo].[FormulaVariadbleSet](
[Id] int IDENTITY(1,1) NOT NULL,
[Code] nvarchar(50) DEFAULT ('') NOT NULL,
[Description] nvarchar(80) DEFAULT ('') NOT NULL,
[CanonicalDataType] tinyint DEFAULT (1) NOT NULL,
[EvalScope] tinyint DEFAULT (1) NOT NULL,
[ConstanValue] nvarchar(2000) DEFAULT ('') NOT NULL,
[ResolutionType] tinyint DEFAULT (1) NOT NULL,
[SqlExpr] nvarchar(4000) DEFAULT ('') NOT NULL,
[EvalExpr] nvarchar(4000) DEFAULT ('') NOT NULL,
[ParamsNumberSqlExpr] tinyint DEFAULT (0) NOT NULL,
[ParamsNumberEvalExpr] tinyint DEFAULT (0) NOT NULL,
[IsActive] bit DEFAULT (1) NOT NULL,
[CreatedBy] int DEFAULT (0) NOT NULL,
[ModifiedBy] int DEFAULT (0) NOT NULL,
[DateCreated] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[DateModified] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[Ts] timestamp NOT NULL
CONSTRAINT [PK_FormulaVariadbleSet_Id] PRIMARY KEY ([Id]),
CONSTRAINT [PK_FormulaVariadbleSet_Code_U_N] UNIQUE ([Code])

);

CREATE TABLE [ComissionCalculator].[dbo].[FormulaVariadble] (
[Id] int IDENTITY(1,1) NOT NULL,
[FormulaId] int NOT NULL,
[FormulaVariadbleSetId] int NOT NULL,
[DefaultValue] nvarchar(2000) DEFAULT ('') NOT NULL ,
[MinValue] nvarchar(50) DEFAULT (0) NOT NULL ,
[MaxValue] nvarchar(50) DEFAULT (0) NOT NULL ,
[TimePeriod] tinyint DEFAULT (0) NOT NULL ,
[PeriodStartDate] date NOT NULL ,
[PeriodEndDate] date NOT NULL ,
[CurrencyCode] nchar(3) ,
[CreatedBy]  int  DEFAULT (0) NOT NULL,
[ModifiedBy]  int  DEFAULT (0) NOT NULL,
[DateCreated] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[DateModified] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[Ts] timestamp NOT NULL
CONSTRAINT [PK_FormulaVariadble_Id] PRIMARY KEY ([Id]),
CONSTRAINT [FK_FormulaVariadble_Formula] FOREIGN KEY([Formulaid])
REFERENCES [ComissionCalculator].[dbo].[Formula] ([Id]),
CONSTRAINT [FK_FormulaVariadble_FormulaVariableSet] FOREIGN KEY([FormulaVariadbleSetId])
REFERENCES [ComissionCalculator].[dbo].[FormulaVariadbleSet] ([Id]),
CONSTRAINT [IDX_FormulaVariadble_FormulaId_FormualVariableSetId_U_N] UNIQUE ([FormulaId])
);

CREATE TABLE [ComissionCalculator].[dbo].[FormulaVariadbleParam] (
[Id] int IDENTITY(1,1) NOT NULL,
[FormulaVariabled] int NOT NULL,
[ParamName] nvarchar(120) DEFAULT ('') NOT NULL ,
[DefaultValue] nvarchar(4000) DEFAULT ('') NOT NULL ,
[CanonicalDataType] tinyint DEFAULT (1) NOT NULL ,
[IsOverridenRuntime] bit DEFAULT (0) NOT NULL ,
[CreatedBy]  int  DEFAULT (0) NOT NULL,
[ModifiedBy]  int  DEFAULT (0) NOT NULL,
[DateCreated] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[DateModified] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[Ts] timestamp NOT NULL
CONSTRAINT [PK_FormulaVariadbleParam_Id] PRIMARY KEY ([Id]),
CONSTRAINT [FK_FormulaVariadbleParam_FormulaVariabled_FormulaVaribale_Id] FOREIGN KEY([FormulaVariabled])
REFERENCES [ComissionCalculator].[dbo].[FormulaVariadble] ([Id]),
);

CREATE TABLE [ComissionCalculator].[dbo].[FormulaHistory] (
[Id] int IDENTITY(1,1) NOT NULL,
[FormulaId] int NOT NULL,
[Code] nvarchar(20)  NOT NULL ,
[Description] nvarchar(120) DEFAULT ('') NOT NULL ,
[FormulaPurpouse] tinyint DEFAULT (1) NOT NULL ,
[Formulatype] tinyint DEFAULT (1) NOT NULL ,
[HasSubExpression] bit DEFAULT (0) NOT NULL ,
[SubExpressionCount] tinyint DEFAULT (0) NOT NULL ,
[EditableExpression] nvarchar(max) DEFAULT ('') NOT NULL ,
[EvalExpression] nvarchar(max) DEFAULT ('') NOT NULL ,
[ActivationDate] date NOT NULL ,
[Notes] nvarchar(max) DEFAULT ('') NOT NULL ,
[StartValidDate] date NOT NULL ,
[EndValidDate] date NOT NULL ,
[IsActive] bit DEFAULT (1) NOT NULL,
[CurdAction] tinyint DEFAULT (1) NOT NULL,
[CreatedBy] int DEFAULT (0) NOT NULL ,
[ModifiedBy] int DEFAULT (0) NOT NULL ,
[DateCreated] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[DateModified] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[Ts] timestamp NOT NULL
CONSTRAINT [PK_FormulaHistory_Id] PRIMARY KEY ([Id]),
INDEX [IDX_FormulaHistory_FormulaId_N_N]  ([FormulaId])
);

CREATE TABLE [ComissionCalculator].[dbo].[FormulaSubExpressionHistory] (
[Id] int IDENTITY(1,1) NOT NULL,
[FormulaHistoryId] int NOT NULL,
[FormulaSubExprindex] int NOT NULL ,
[Description] nvarchar(80) DEFAULT ('') NOT NULL ,
[EditableSubExpression] nvarchar(2000) DEFAULT ('') NOT NULL ,
[EvalSubExpression] nvarchar(2000) DEFAULT ('') NOT NULL ,
[SubExprIndex] tinyint DEFAULT (0) NOT NULL ,
[CrudAction] tinyint DEFAULT (1) NOT NULL ,
[CreatedBy] int DEFAULT (0) NOT NULL ,
[ModifiedBy] int DEFAULT (0) NOT NULL ,
[DateCreated] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[DateModified] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[Ts] timestamp NOT NULL
CONSTRAINT [PK_FormulaSubExpressionHistory_Id] PRIMARY KEY ([Id])
CONSTRAINT [FK_FormulaSubExpressionHistory_FormulaHistoryId_FormulaHistory_Id] FOREIGN KEY([FormulaHistoryId])
REFERENCES [ComissionCalculator].[dbo].[FormulaHistory] ([Id])
);


CREATE TABLE [ComissionCalculator].[dbo].[FormulaVariableSetHistory] (
[Id] int IDENTITY(1,1) NOT NULL,
[FormulaVariableSetId] int NOT NULL,
[Code] nvarchar(50) DEFAULT ('') NOT NULL ,
[Description] nvarchar(80) DEFAULT ('') NOT NULL ,
[CanonicalDataType] tinyint DEFAULT (1) NOT NULL,
[EvalScope] tinyint DEFAULT (1) NOT NULL,
[ConstanValue] nvarchar(2000) DEFAULT ('') NOT NULL,
[ResolutionType] tinyint DEFAULT (1) NOT NULL,
[SqlExpr] nvarchar(4000) DEFAULT ('') NOT NULL,
[EvalExpr] nvarchar(4000) DEFAULT ('') NOT NULL,
[ParamsNumberSqlExpr] tinyint DEFAULT (0) NOT NULL,
[ParamsNumberEvalExpr] tinyint DEFAULT (0) NOT NULL,
[StartValidDate] date NOT NULL,
[EndValidDate] date NOT NULL,
[IsActive] bit DEFAULT (1) NOT NULL,
[CrudAction] tinyint DEFAULT (1) NOT NULL ,
[CreatedBy] int DEFAULT (0) NOT NULL,
[ModifiedBy] int DEFAULT (0) NOT NULL,
[DateCreated] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[DateModified] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[Ts] timestamp NOT NULL
CONSTRAINT [PK_FormulaVariadbleSetHistory_Id] PRIMARY KEY ([Id]),
INDEX [IDX_FormulaVariadbleSetHistory_FormulaVariableSetId_N_N] ([FormulaVariableSetId])
);

CREATE TABLE [ComissionCalculator].[dbo].[FormulaVariableHistory] (
[Id] int IDENTITY(1,1) NOT NULL,
[FormulaHistoryId] int NOT NULL,
[FormulaVariableSetHistoryId] int NOT NULL,
[FormulaVariabled] int  NOT NULL,
[FormulaVariableSetId] int  NOT NULL,
[DefaultValue] nvarchar(2000) DEFAULT ('') NOT NULL,
[MinValue] nvarchar(50) DEFAULT (0) NOT NULL,
[MaxValue] nvarchar(50) DEFAULT (0) NOT NULL,
[TimePeriod] tinyint DEFAULT (1) NOT NULL,
[PeriodStartDate] date NOT NULL,
[PeriodEndDate] date NOT NULL,
[CurrencyCode] nvarchar(3) ,
[CrudAction] tinyint DEFAULT (1) NOT NULL ,
[CreatedBy] int DEFAULT (0) NOT NULL,
[ModifiedBy] int DEFAULT (0) NOT NULL,
[DateCreated] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[DateModified] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[Ts] timestamp NOT NULL
CONSTRAINT [PK_FormulaVariableHistory_Id] PRIMARY KEY ([Id]),
CONSTRAINT [FK_FormulaVariableHistory_FormulaHistoryId_FormulaHistory_Id] FOREIGN KEY([FormulaHistoryId])
REFERENCES [ComissionCalculator].[dbo].[FormulaHistory] ([Id]),
CONSTRAINT [FK_FormulaVariableHistory_FormulaVariableSetHistoryId_FormulaVariableSetHistory_Id] FOREIGN KEY([FormulaVariableSetHistoryId])
REFERENCES [ComissionCalculator].[dbo].[FormulaVariableSetHistory] ([Id])
);

CREATE TABLE [ComissionCalculator].[dbo].[FormulaVariableParamHistory] (
[Id] int IDENTITY(1,1) NOT NULL,
[FormulaVariableHistoryId] int,
[FormulaVariableParamId] int,
[ParamName] nvarchar(120) DEFAULT ('') NOT NULL ,
[FormulaVariableId] int,
[DefaultValue] nvarchar(4000) DEFAULT ('') NOT NULL ,
[CanonicaDataType] tinyint DEFAULT (1) NOT NULL ,
[CreatedBy] int DEFAULT (1) NOT NULL ,
[IsOverridenRuntime] bit DEFAULT (0) NOT NULL ,
[ModifiedBy] int DEFAULT (0) NOT NULL,
[CrudAction] tinyint DEFAULT (1) NOT NULL ,
[DateCreated] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[DateModified] datetime2(7) DEFAULT(GETDATE()) NOT NULL ,
[Ts] timestamp NOT NULL
CONSTRAINT [PK_FormulaVariableParamHistory_Id] PRIMARY KEY ([Id]),
CONSTRAINT [FK_FormulaVariableParamHistory_FormulaVariableHistoryId_FormulaVariableHistory_Id] 
FOREIGN KEY([FormulaVariableHistoryId])
REFERENCES [ComissionCalculator].[dbo].[FormulaVariableHistory] ([Id]),
INDEX [IDX_FormulaVariableParamHistory_FormulaVariableParamId_N_N] ([FormulaVariableParamId]),
INDEX [IDX_FormulaVariableParamHistory_FormulaVariableId_N_N] ([FormulaVariableId]),
);

