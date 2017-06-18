/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     VOID = 258,
     INT = 259,
     BYTE = 260,
     B = 261,
     BOOL = 262,
     TRUE = 263,
     FALSE = 264,
     RETURN = 265,
     IF = 266,
     NUM = 267,
     WHILE = 268,
     SWITCH = 269,
     CASE = 270,
     BREAK = 271,
     COLON = 272,
     SC = 273,
     COMMA = 274,
     LPAREN = 275,
     RPAREN = 276,
     LBRACE = 277,
     RBRACE = 278,
     ASSIGN = 279,
     ID = 280,
     STRING = 281,
     whitespace = 282,
     comment = 283,
     ELSE = 284,
     then = 285,
     AND = 286,
     OR = 287,
     RELOP = 288,
     BINOP = 289,
     NOT = 290
   };
#endif
/* Tokens.  */
#define VOID 258
#define INT 259
#define BYTE 260
#define B 261
#define BOOL 262
#define TRUE 263
#define FALSE 264
#define RETURN 265
#define IF 266
#define NUM 267
#define WHILE 268
#define SWITCH 269
#define CASE 270
#define BREAK 271
#define COLON 272
#define SC 273
#define COMMA 274
#define LPAREN 275
#define RPAREN 276
#define LBRACE 277
#define RBRACE 278
#define ASSIGN 279
#define ID 280
#define STRING 281
#define whitespace 282
#define comment 283
#define ELSE 284
#define then 285
#define AND 286
#define OR 287
#define RELOP 288
#define BINOP 289
#define NOT 290




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

