{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}
{-# LANGUAGE UndecidableInstances #-}

module Kit.Ast.Expr where

import Kit.Ast.ConcreteType
import Kit.Ast.Definitions
import Kit.Ast.ExprType
import Kit.Ast.Identifier
import Kit.Ast.Metadata
import Kit.Ast.Modifier
import Kit.Ast.Operator
import Kit.Ast.TypeSpec
import Kit.Ast.Value
import Kit.Parser.Span
import Kit.Parser.Token
import Kit.Str

type SyntacticExprType = ExprType Expr (Maybe TypeSpec)

data Expr = Expr {expr :: SyntacticExprType, pos :: Span} deriving (Eq, Show)
ePos = pos

e :: SyntacticExprType -> Expr
e et = ep et NoPos

ep :: SyntacticExprType -> Span -> Expr
ep et p = Expr {expr = et, pos = p}

pe :: Span -> SyntacticExprType -> Expr
pe p et = ep et p

me :: Span -> Expr -> Expr
me p ex = Expr {expr = expr ex, pos = p}
