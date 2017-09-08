USE ComissionCalculator;

CREATE TABLE [Formula] (
	[Id] INT NOT NULL IDENTITY(1,1),
	[Code] NVARCHAR(20) NOT NULL DEFAULT '',
	[Description] NVARCHAR(120) NOT NULL DEFAULT '',
	[FormulaType] TINYINT NOT NULL DEFAULT 1,
	[HasSubExpression] BIT NOT NULL DEFAULT 0,
	[SubExpressionCount] TINYINT NOT NULL DEFAULT 0,
	[EditableExpression] NVARCHAR(MAX) NOT NULL DEFAULT '',
	[EvalExpression] NVARCHAR(MAX) NOT NULL DEFAULT '',
	[ActivationDate] DATE NOT NULL,
    [Notes] NVARCHAR(MAX) NOT NULL DEFAULT '',
    [IsActive] BIT NOT NULL DEFAULT 1,
    [CreatedBy] INT NOT NULL DEFAULT 0,
    [ModifiedBy] INT NOT NULL DEFAULT 0,
    [DataCreated] DATETIME2(7) DEFAULT GETDATE(),
    [DataModified] DATETIME2(7) DEFAULT GETDATE(),
    [Ts] TIMESTAMP,
    CONSTRAINT [PK_Formula_Id] PRIMARY KEY (Id),
    CONSTRAINT [IDX_Formula_Code_U_N] UNIQUE (Code)
);

CREATE TABLE [FormulaSubExpression] (
	[Id] INT NOT NULL IDENTITY(1,1),
	[FormulaId] INT NOT NULL,
	[Description] NVARCHAR(80) NOT NULL DEFAULT '',
	[SubExprIndex] TINYINT NOT NULL DEFAULT 0,
	[EditableSubExpression] NVARCHAR(2000) NOT NULL DEFAULT '',
	[EvalSubExpression] NVARCHAR(2000) NOT NULL DEFAULT '',
	[CreatedBy] INT NOT NULL DEFAULT 0,
	[ModifiedBy] INT NOT NULL DEFAULT 0,
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[Ts] TIMESTAMP NOT NULL,
	CONSTRAINT [FK_FormulaSubExpression_FormulaId_Formula_Id] FOREIGN KEY (FormulaId)
	REFERENCES Formula(Id),
	CONSTRAINT [PK_FormulaSubExpression_Id] PRIMARY KEY (Id)
);

CREATE TABLE [FormulaVariableSet] (
	[Id] INT NOT NULL IDENTITY(1,1),
	[Code] NVARCHAR(50) NOT NULL DEFAULT '',
	[Description] NVARCHAR(80) NOT NULL DEFAULT '',
	[CanonicalDataType] TINYINT NOT NULL DEFAULT 1,
	[EvalScope] TINYINT NOT NULL DEFAULT 1,
	[ConstantValue] NVARCHAR(2000) NOT NULL DEFAULT '',
	[ResolutionType] TINYINT NOT NULL DEFAULT 1,
	[SqlExpr] NVARCHAR(4000) NOT NULL DEFAULT '',
	[EvalExpr] NVARCHAR(4000) NOT NULL DEFAULT '',
	[ParamsNumberSqlExpr] TINYINT NOT NULL DEFAULT 0,
	[ParamsNumberEvalExpr] TINYINT NOT NULL DEFAULT 0,
	[isActive] BIT NOT NULL DEFAULT 1,
	[CreatedBy] INT NOT NULL DEFAULT 0,
	[ModifiedBy] INT NOT NULL DEFAULT 0,
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[Ts] TIMESTAMP,
	CONSTRAINT [PK_FormulaVariableSet_Id] PRIMARY KEY (Id),
	CONSTRAINT [IDX_FormulaVariableSet_Code_U_N] UNIQUE (Code)
);

CREATE TABLE [FormulaHistory] (
	[Id] INT NOT NULL IDENTITY(1,1),
	[FormulaId] INT NOT NULL,
	[Code] NVARCHAR(20) NOT NULL DEFAULT '',
	[Description] NVARCHAR(80) NOT NULL DEFAULT '',
	[FormulaPurpose] TINYINT NOT NULL DEFAULT 1,
	[FormulaType] TINYINT NOT NULL DEFAULT 1,
	[HasSubExpression] BIT NOT NULL DEFAULT 0,
	[SubExpressionCount] TINYINT NOT NULL DEFAULT 0,
	[EditableExpression] NVARCHAR(MAX) NOT NULL DEFAULT '',
	[EvalExpression] NVARCHAR(MAX) NOT NULL DEFAULT '',
	[ActivationDate] DATE NOT NULL,
	[Notes] NVARCHAR(MAX) NOT NULL DEFAULT '',
	[StartValidDate] DATE NOT NULL,
	[EndValidDate] DATE NOT NULL,
	[IsActive] BIT NOT NULL DEFAULT 1,
	[CrudAction] TINYINT NOT NULL DEFAULT 1,
	[CreatedBy] INT NOT NULL DEFAULT 0,
	[ModifieldBy] INT NOT NULL DEFAULT 0,
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[TS] TIMESTAMP NOT NULL,
	CONSTRAINT [PK_FormulaHistory_Id] PRIMARY KEY (Id)
);

CREATE INDEX [IDX_FormulaHistory_FormulaId_N_N] ON FormulaHistory(FormulaId);

CREATE TABLE [FormulaVariableSetHistory] (
	[Id] INT NOT NULL IDENTITY(1,1),
	[FormulaVariableSetId] INT NOT NULL,
	[Code] NVARCHAR(50) NOT NULL DEFAULT '',
	[Description] NVARCHAR(80) NOT NULL DEFAULT '',
	[CanonicalDataType] TINYINT NOT NULL DEFAULT 1,
	[EvalScope] TINYINT NOT NULL DEFAULT 1,
	[ConstantValue] NVARCHAR(2000) NOT NULL DEFAULT '',
	[ResolutionType] TINYINT NOT NULL DEFAULT 1,
	[SqlExpr] NVARCHAR(4000) NOT NULL DEFAULT '',
	[EvalExpr] NVARCHAR(4000) NOT NULL DEFAULT '',
	[ParamsNumberSqlExpr] TINYINT NOT NULL DEFAULT 0,
	[ParamsNumberEvalExpr] TINYINT NOT NULL DEFAULT 0,
	[StartValidDate] DATE NOT NULL,
	[EndValidDate] DATE NOT NULL,
	[IsActive] BIT NOT NULL DEFAULT 1,
	[CrudAction] TINYINT NOT NULL DEFAULT 1,
	[CreatedBy] INT NOT NULL DEFAULT 0,
	[ModifieldBy] INT NOT NULL DEFAULT 0,
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[TS] TIMESTAMP NOT NULL,
	CONSTRAINT [PK_FormulaVariableSetHistory_Id] PRIMARY KEY (Id)
);

CREATE INDEX [IDX_FormulaVariableSetHistory_FormulaVariableSetId_N_N] ON FormulaHistory(FormulaId);

CREATE TABLE [FormulaVariable] (
	[Id] INT NOT NULL IDENTITY(1,1),
	[FormulaId] INT NOT NULL,
	[FormulaVariableSetId] INT NOT NULL,
	[DefaultValue] NVARCHAR(2000) NOT NULL DEFAULT '',
	[MinValue] NVARCHAR(50) NOT NULL DEFAULT 0,
	[MaxValue] NVARCHAR(50) NOT NULL DEFAULT 0,
	[TimePeriod] TINYINT NOT NULL DEFAULT 0,
	[PeriodStartDate] DATE NOT NULL,
	[PeriodEndDate] DATE NOT NULL,
	[CurrencyCode] NCHAR(3),
	[CreatedBy] INT NOT NULL DEFAULT 0,
	[ModifieldBy] INT NOT NULL DEFAULT 0,
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[TS] TIMESTAMP NOT NULL,
	CONSTRAINT [PK_FormulaVariable_Id] PRIMARY KEY (Id),
	CONSTRAINT [FK_FormulaVariable_Formula] FOREIGN KEY (FormulaId)
	REFERENCES Formula(Id),
	CONSTRAINT [FK_FormulaVariable_FormulaVariableSet] FOREIGN KEY (FormulaId)
	REFERENCES FormulaVariableSet(Id),
	CONSTRAINT [IDX_FormulaVariable_FormulaId_FormulaVariableSetId_U_N] UNIQUE (FormulaId, FormulaVariableSetId)
);

CREATE TABLE [FormulaVariableParam] (
	[Id] INT NOT NULL IDENTITY(1,1),
	[FormulaVariableId] INT NOT NULL,
	[ParamName] NVARCHAR(120) NOT NULL DEFAULT '',
	[DefaultValue] NVARCHAR(4000) NOT NULL DEFAULT '',
	[CanonicalDataType] TINYINT NOT NULL DEFAULT 1,
	[IsOverridenRuntime] BIT NOT NULL DEFAULT 0,
	[CreatedBy] INT NOT NULL DEFAULT 0,
	[ModifiedBy] INT NOT NULL DEFAULT 0,
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[Ts] TIMESTAMP,
	CONSTRAINT [PK_FormulaVariableParam_Id] PRIMARY KEY (Id),
	CONSTRAINT [FK_FormulaVariableParam_FormulaVariebleId_FormulaVariable_Id] FOREIGN KEY (FormulaVariableId)
	REFERENCES FormulaVariable(Id)
);

CREATE TABLE [FormulaVariableHistory] (
	[Id] INT NOT NULL IDENTITY(1,1),
	[FormulaHistoryId] INT NOT NULL,
	[FormulaVariableSetHistoryId] INT NOT NULL,
	[FormulaVariableId] INT NOT NULL,
	[DefaultValue] NVARCHAR(2000) NOT NULL DEFAULT '',
	[MinValue] NVARCHAR(50) NOT NULL DEFAULT 0,
	[MaxValue] VARCHAR(50) NOT NULL DEFAULT 0,
	[TimePeriod] TINYINT NOT NULL DEFAULT 0,
	[PeriodStartDate] DATE NOT NULL,
	[PeriodEndDate] DATE NOT NULL,
	[CurrencyCode] NCHAR(3),
	[CrudAction] TINYINT NOT NULL DEFAULT 1,
	[CreatedBy] INT NOT NULL DEFAULT 0,
	[ModifiedBy] INT NOT NULL DEFAULT 0,
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[Ts] TIMESTAMP,
	CONSTRAINT [PK_FormulaVariableHistory_Id] PRIMARY KEY (Id),
	CONSTRAINT [FK_FormulaVariableHistory_FormulaHistoryId_FormulaHistory_Id] FOREIGN KEY (FormulaHistoryId)
	REFERENCES FormulaHistory(Id),
	CONSTRAINT [FK_FormulaVariableHistory_FormulaVariableSetHistoryId_FormulaVariableSetHistory_id] FOREIGN KEY (FormulaVariableSetHistoryId)
	REFERENCES FormulaVariableSetHistory(Id)
);
CREATE INDEX [IDX_FormulaVariableHistory_FormulaVariableId_N_N] ON FormulaVariableHistory(FormulaVariableId);
CREATE INDEX [IDX_FormulaVariableHistory_FormulaVariableSetHistoryId_N_N] ON FormulaVariableHistory(FormulaVariableSetHistoryId);

CREATE TABLE [FormulaSubExpressionHistory] (
	[Id] INT NOT NULL IDENTITY(1,1),
	[FormulaHistoryId] INT NOT NULL,
	[Description] NVARCHAR(80) NOT NULL DEFAULT '',
	[EditableSubExpression] NVARCHAR(2000) NOT NULL DEFAULT '',
	[EvalSubExpression] NVARCHAR(2000) NOT NULL DEFAULT '',
	[SubExprIndex] TINYINT NOT NULL DEFAULT 0,
	[CrudAction] TINYINT NOT NULL DEFAULT 1,
	[ModifiedBy] INT NOT NULL DEFAULT 0,
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[Ts] TIMESTAMP,
	CONSTRAINT [PK_FormulaSubExpressionHistory_Id] PRIMARY KEY (Id),
	CONSTRAINT [FK_FormulaSubExpressionHistory_FormulaHistoryId_FormulaHistory_Id] FOREIGN KEY (FormulaHistoryId)
	REFERENCES FormulaHistory(Id)
);

CREATE INDEX [IDX_FormulaSubExpressionHistory_FormulaSubExpression_N_N] ON FormulaSubExpressionHistory(FormulaHistoryId);

CREATE TABLE [FormulaVariableParamHistory] (
	[Id] INT NOT NULL IDENTITY(1,1),
	[FormulaVariableHistoryId] INT NOT NULL,
	[FormulaVariableParamId] INT NOT NULL,
	[ParamName] NVARCHAR(120) NOT NULL DEFAULT '',
	[FormulaVariableId] INT NOT NULL,
	[DefaultValue] NVARCHAR(4000) NOT NULL DEFAULT '',
	[CanonicalDataType] TINYINT NOT NULL DEFAULT 1,
	[CreatedBy] INT NOT NULL DEFAULT 0,
	[IsOverridenRuntime] BIT NOT NULL DEFAULT 0,
	[ModifiedBy] INT NOT NULL DEFAULT 0,
	[CrudAction] TINYINT NOT NULL DEFAULT 1,
	[DateCreated] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[DateModified] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[Ts] TIMESTAMP,
	CONSTRAINT [PK_FormulaVariableParamHistory_Id] PRIMARY KEY (Id),
	CONSTRAINT [FK_FormulaVariableParamHistory_FormulaVariableHistoryId_FormulaVariableHistory_Id] FOREIGN KEY (FormulaVariableHistoryId)
	REFERENCES FormulaVariableHistory(Id)
);

CREATE INDEX [IDX_FormulaVariableParamHistory_FormulaVariableParamId_N_N] ON FormulaVariableParamHistory(FormulaVariableParamId);
CREATE INDEX [IDX_FormulaVariableParamHistory_FormulaVariableId_N_N] ON FormulaVariableParamHistory(FormulaVariableId);
