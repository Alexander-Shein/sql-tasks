USE [ComissionCalculator]
GO

CREATE TABLE [dbo].[Formula]
(
	[Id] INTEGER NOT NULL IDENTITY(1,1),
	[Code] NVARCHAR(20) NOT NULL DEFAULT(''),
	[Description] NVARCHAR(120) NOT NULL DEFAULT(''),
	[FormulaPurpose] TINYINT NOT NULL DEFAULT(1),
	[FormulaType] TINYINT NOT NULL DEFAULT(1),
	[HasSubExpression] BIT NOT NULL DEFAULT(0),
	[SubExpressionCount] TINYINT NOT NULL DEFAULT(0),
	[EditableExpression] NVARCHAR(MAX) NOT NULL DEFAULT(''),
	[EvalExpression] NVARCHAR(MAX) NOT NULL DEFAULT(''),
	[ActivationDate] DATE NOT NULL,
	[Notes] NVARCHAR(MAX) NOT NULL DEFAULT(''),
	[IsActive] BIT NOT NULL DEFAULT(1),
	[CreatedBy] INTEGER NOT NULL DEFAULT(0),
	[ModifiedBy] INTEGER NOT NULL DEFAULT(0),
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[Ts] TIMESTAMP NOT NULL

	CONSTRAINT [PK_Formula_Id] PRIMARY KEY CLUSTERED ([Id]),

	CONSTRAINT [IDX_Formula_Code_U_N] UNIQUE([Code])
)

CREATE TABLE [dbo].[FormulaSubExpression]
(
	[Id] INTEGER NOT NULL IDENTITY(1,1),
	[FormulaId] INTEGER NOT NULL,
	[Description] NVARCHAR(80) NOT NULL DEFAULT(''),
	[SubExprIndex] TINYINT NOT NULL DEFAULT(0),
	[EditableSubExpression] NVARCHAR(2000) NOT NULL DEFAULT(''),
	[EvalSubExpression] NVARCHAR(2000) NOT NULL DEFAULT(''),
	[CreatedBy] INTEGER NOT NULL DEFAULT(0),
	[ModifiedBy] INTEGER NOT NULL DEFAULT(0),
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[Ts] TIMESTAMP NOT NULL

	CONSTRAINT [PK_FormulaSubExpression_Id] PRIMARY KEY CLUSTERED ([Id])

	CONSTRAINT [FK_FormulaSubExpression_FormulaId_Formula_Id] FOREIGN KEY ([FormulaId]) REFERENCES [dbo].[Formula]([Id])
)

CREATE TABLE [dbo].[FormulaVariableSet]
(
	[Id] INTEGER NOT NULL IDENTITY(1,1),
	[Code] NVARCHAR(50) NOT NULL DEFAULT(''),
	[Description] NVARCHAR(80) NOT NULL DEFAULT(''),
	[CanonicalDateType] TINYINT NOT NULL DEFAULT(1),
	[ConstantValue] NVARCHAR(2000) NOT NULL DEFAULT(''),
	[ResolutionType] TINYINT NOT NULL DEFAULT(1),
	[SqlExpr] NVARCHAR(4000) NOT NULL DEFAULT(''),
	[EvalExpr] NVARCHAR(4000) NOT NULL DEFAULT(''),
	[ParamsNumberSqlExpr] TINYINT NOT NULL DEFAULT(0),
	[ParamsNumberEvalExpr] TINYINT NOT NULL DEFAULT(0),
	[IsActive] BIT NOT NULL DEFAULT(1),
	[CreatedBy] INTEGER NOT NULL DEFAULT(0),
	[ModifiedBy] INTEGER NOT NULL DEFAULT(0),
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[Ts] TIMESTAMP NOT NULL

	CONSTRAINT [PK_FormulaVariableSet_Id] PRIMARY KEY CLUSTERED ([Id]),

	CONSTRAINT [IDX_FormulaVariableSet_Code_U_N] UNIQUE([Code])
)

CREATE TABLE [dbo].[FormulaVariable]
(
	[Id] INTEGER NOT NULL IDENTITY(1,1),
	[FormulaId] INTEGER NOT NULL,
	[FormulaVariableSetId] INTEGER NOT NULL,
	[DefaultValue] NVARCHAR(2000) NOT NULL DEFAULT(''),
	[MintValue] NVARCHAR(50) NOT NULL DEFAULT(0),
	[MaxValue] NVARCHAR(50) NOT NULL DEFAULT(0),
	[TimePeriod] TINYINT NOT NULL DEFAULT(0),
	[PeriodStartDate] DATE NOT NULL,
	[PeriodEndDate] DATE NOT NULL,
	[CurrencyCode] NVARCHAR(3),
	[CreatedBy] INTEGER NOT NULL DEFAULT(0),
	[ModifiedBy] INTEGER NOT NULL DEFAULT(0),
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[Ts] TIMESTAMP NOT NULL


	CONSTRAINT [PK_FormulaVariable_Id] PRIMARY KEY CLUSTERED ([Id])

	CONSTRAINT [FK_FormulaVariable_Formula] FOREIGN KEY ([FormulaId]) REFERENCES [dbo].[Formula]([Id]),
	CONSTRAINT [FK_FormulaVariable_FormulaVariableSet] FOREIGN KEY ([FormulaVariableSetId]) REFERENCES [dbo].[FormulaVariableSet]([Id]),

	CONSTRAINT [IDX_FormulaVariable_FormulaId_FormualVariableSetId_U_N] UNIQUE([FormulaId], [FormulaVariableSetId])
)

CREATE TABLE [dbo].[FormulaVariabeParam]
(
	[Id] INTEGER NOT NULL IDENTITY(1,1),
	[FormulaVariableId] INTEGER NOT NULL,
	[ParamName] NVARCHAR(120) NOT NULL DEFAULT(''),
	[DefaultName] NVARCHAR(4000) NOT NULL DEFAULT(''),
	[CanonicalDateType] TINYINT NOT NULL DEFAULT(1),
	[isOverridenRuntime] BIT NOT NULL DEFAULT(0),
	[CreatedBy] INTEGER NOT NULL DEFAULT(0),
	[ModifiedBy] INTEGER NOT NULL DEFAULT(0),
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[Ts] TIMESTAMP NOT NULL

	CONSTRAINT [PK_FormulaVariabeParam_Id] PRIMARY KEY CLUSTERED ([Id]),

	CONSTRAINT [FK_FormulaVariabeParam_FormulaVariabled_FormulaVariable_Id] FOREIGN KEY ([FormulaVariableId]) REFERENCES [dbo].[FormulaVariable]([Id]),
)

CREATE TABLE [dbo].[FormulaHistory]
(
	[Id] INTEGER NOT NULL IDENTITY(1,1),
	[FormulaId] INTEGER NOT NULL,
	[Code] NVARCHAR(20) NOT NULL,
	[Description] NVARCHAR(80) NOT NULL DEFAULT(''),
	[FormulaPurpose] TINYINT NOT NULL DEFAULT(1),
	[FormulaType] TINYINT NOT NULL DEFAULT(1),
	[HasSubExpression] BIT NOT NULL DEFAULT(0),
	[SubExpressionCount] TINYINT NOT NULL DEFAULT(0),
	[EditableExpression] NVARCHAR(MAX) NOT NULL DEFAULT(''),
	[EvalExpression] NVARCHAR(MAX) NOT NULL DEFAULT(''),
	[ActivationDate] DATE NOT NULL,
	[Notes] NVARCHAR(MAX) NOT NULL DEFAULT(''),
	[StartValidDate] DATE NOT NULL,
	[EndValidDate] DATE NOT NULL,
	[IsActive] BIT NOT NULL DEFAULT(1),
	[CrudAction] TINYINT NOT NULL DEFAULT(1),
	[CreatedBy] INTEGER NOT NULL DEFAULT(0),
	[ModifiedBy] INTEGER NOT NULL DEFAULT(0),
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[Ts] TIMESTAMP NOT NULL

	CONSTRAINT [PK_FormulaHistory_Id] PRIMARY KEY CLUSTERED ([Id]),
)

CREATE NONCLUSTERED INDEX [IDX_FormulaHistory_FormulaId_N_N] ON [dbo].[FormulaHistory] ([FormulaId])

CREATE TABLE [dbo].[FormulaVariableSetHistory]
(
	[Id] INTEGER NOT NULL IDENTITY(1,1),
	[FormulaVariableSetId] INTEGER NOT NULL ,
	[Code] NVARCHAR(50) NOT NULL DEFAULT(''),
	[Description] NVARCHAR(80) NOT NULL DEFAULT(''),
	[CanonicalDateType] TINYINT NOT NULL DEFAULT(1),
	[EvalScope] TINYINT NOT NULL DEFAULT(1),
	[ConstantValue] NVARCHAR(2000) NOT NULL DEFAULT(''),
	[ResolutionType] TINYINT NOT NULL DEFAULT(1),
	[SqlExpr] NVARCHAR(4000) NOT NULL DEFAULT(''),
	[EvalExpr] NVARCHAR(4000) NOT NULL DEFAULT(''),
	[ParamsNumberSqlExpr] TINYINT NOT NULL DEFAULT(0),
	[ParamsNumberEvalExpr] TINYINT NOT NULL DEFAULT(0),
	[StartValidDate] DATE NOT NULL,
	[EndValidDate] DATE NOT NULL,
	[IsActive] BIT NOT NULL DEFAULT(1),
	[CrudAction] TINYINT NOT NULL DEFAULT(1),
	[CreatedBy] INTEGER NOT NULL DEFAULT(0),
	[ModifiedBy] INTEGER NOT NULL DEFAULT(0),
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[Ts] TIMESTAMP NOT NULL

	CONSTRAINT [PK_FormulaVariableSetHistory_Id] PRIMARY KEY CLUSTERED ([Id]), 
)

CREATE NONCLUSTERED INDEX [IDX_FormulaVariableSetHistory_FormulaVariableSetId_N_N] ON [dbo].[FormulaVariableSetHistory] ([FormulaVariableSetId])

CREATE TABLE [dbo].[FormulaSubExpressionHistory]
(
	[Id] INTEGER NOT NULL IDENTITY(1,1),
	[FormulaHistoryId] INTEGER NOT NULL,
	[FormulaSubExpressionId] INTEGER NOT NULL,
	[Description] NVARCHAR(80) NOT NULL DEFAULT(''),
	[EditableSubExpression] NVARCHAR(2000) NOT NULL DEFAULT(''),
	[EvalSubExpression] NVARCHAR(2000) NOT NULL DEFAULT(''),
	[SubExprIndex] TINYINT NOT NULL DEFAULT(0),
	[CrudAction] TINYINT NOT NULL DEFAULT(1),
	[CreatedBy] INTEGER NOT NULL DEFAULT(0),
	[ModifiedBy] INTEGER NOT NULL DEFAULT(0),
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[Ts] TIMESTAMP NOT NULL

	CONSTRAINT [PK_FormulaSubExpressionHistory_Id] PRIMARY KEY CLUSTERED ([Id])

	CONSTRAINT [FK_FormulaSubExpressionHistory_FormulaHistoryId_FormulaHistory_Id] FOREIGN KEY ([FormulaHistoryId]) REFERENCES [dbo].[FormulaHistory]([Id])
)

CREATE NONCLUSTERED INDEX [IDX_FormulaSubExpressionHistory_FormulaSubExpressionId_N_N] ON [dbo].[FormulaSubExpressionHistory]([FormulaSubExpressionId])

CREATE TABLE [dbo].[FormulaVariableHistory]
(
	[Id] INTEGER NOT NULL IDENTITY(1,1),
	[FormulaHistoryId] INTEGER NOT NULL,
	[FormulaVariableSetHistoryId] INTEGER NOT NULL,
	[FormulaVariableId] INTEGER NOT NULL,
	[FormulaVariableSetId] INTEGER NOT NULL,
	[DefaultValue] NVARCHAR(2000) NOT NULL DEFAULT(''),
	[MintValue] NVARCHAR(50) NOT NULL DEFAULT(0),
	[MaxValue] NVARCHAR(50) NOT NULL DEFAULT(0),
	[TimePeriod] TINYINT NOT NULL DEFAULT(0),
	[PeriodStartDate] DATE NOT NULL,
	[PeriodEndDate] DATE NOT NULL,
	[CurrencyCode] NVARCHAR(3),
	[CreatedBy] INTEGER NOT NULL DEFAULT(0),
	[ModifiedBy] INTEGER NOT NULL DEFAULT(0),
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[Ts] TIMESTAMP NOT NULL


	CONSTRAINT [PK_FormulaVariableHistory_Id] PRIMARY KEY CLUSTERED ([Id])

	CONSTRAINT [FK_FormulaVariableHistory_FormulaHistoryId_FormulaHistory_Id] FOREIGN KEY ([FormulaHistoryId]) REFERENCES [dbo].[FormulaHistory]([Id]),
	CONSTRAINT [FK_FormulaVariableHistory_FormulaVariableSetHistoryId_FormulaVariableSetHistory_Id] FOREIGN KEY ([FormulaVariableSetHistoryId]) REFERENCES [dbo].[FormulaVariableSetHistory]([Id]),
)

CREATE NONCLUSTERED INDEX [IDX_FormulaVariableHistory_FormulaVariableId_N_N] ON [dbo].[FormulaVariableHistory]([FormulaVariableId])
CREATE NONCLUSTERED INDEX [IDX_FormulaVariableHistory_FormulaVariableSetId_N_N] ON [dbo].[FormulaVariableHistory]([FormulaVariableSetId])

CREATE TABLE [dbo].[FormulaVariabeParamHistory]
(
	[Id] INTEGER NOT NULL IDENTITY(1,1),
	[FormulaVariableHistoryId] INTEGER NOT NULL,
	[FormulaVariableParamId] INTEGER NOT NULL,
	[ParamName] NVARCHAR(120) NOT NULL DEFAULT(''),
	[FormulaVariableId] INTEGER NOT NULL,
	[DefaultValue] NVARCHAR(4000) NOT NULL DEFAULT(''),
	[CanonicalDateType] TINYINT NOT NULL DEFAULT(1),
	[CreatedBy] INTEGER NOT NULL DEFAULT(0),
	[isOverridenRuntime] BIT NOT NULL DEFAULT(0),
	[ModifiedBy] INTEGER NOT NULL DEFAULT(0),
	[CrudAction] TINYINT NOT NULL DEFAULT(1),
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT(GETDATE()),
	[Ts] TIMESTAMP NOT NULL

	CONSTRAINT [PK_FormulaVariabeParamHistory_Id] PRIMARY KEY CLUSTERED ([Id]),

	CONSTRAINT [FK_FormulaVariabeParamHistory_FormulaVariableHistoryId_FormulaVariableHistory_Id] FOREIGN KEY ([FormulaVariableHistoryId]) REFERENCES [dbo].[FormulaVariableHistory]([Id]),
)

CREATE NONCLUSTERED INDEX [IDX_FormulaVariableParamHistory_FormulaVariableParamId_N_N] ON [dbo].[FormulaVariabeParamHistory]([FormulaVariableParamId])
CREATE NONCLUSTERED INDEX [IDX_FormulaVariableParamHistory_FormulaVariableId_N_N] ON [dbo].[FormulaVariabeParamHistory]([FormulaVariableId])

