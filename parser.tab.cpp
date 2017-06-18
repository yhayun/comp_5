/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



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




/* Copy the first part of user declarations.  */
#line 1 "parser.ypp"

#define YYDEBUG 1
#define YYERROR_VERBOSE 1
#define NUM_REGS 18
#include "attributes.h"
#include "output.hpp"
#include "bp.hpp"
#include <iostream>
#include <stdlib.h>
#include <stack>
#include <vector>
#include <string.h>
#include <stdio.h>
#include <algorithm>
#include <sstream>
using namespace std;	
using namespace output;
extern int yylex();
extern int yylineno;
extern char* yytext;

//DONT PUT ANY NON FUNCTION TYPES BELOW BYTE!!!!!	
	enum ttypes{
//EVERY TIME YOU TOUCH SOMETHING HERE U NEED TO CHANGE STUFF LIKE INT TO NAME
//JOHN IF U WANT TO CHANGE SOMETHING DON TDO IT WITH ASKING ME 
	 	TYPE_INT,
		TYPE_BOOL,
		TYPE_BYTE,
		TYPE_STRING,
		TYPE_FUNC_INT,
		TYPE_FUNC_BOOL,
		TYPE_FUNC_BYTE,
		TYPE_FUNC_VOID,
		TYPE_MAX
	};

//****************************************************************************************************
//                                   symblo table implementation:
//****************************************************************************************************
void int_to_name_push(int i, vector<const char*>& proto_names);
class info {
public:	
	string name;
	int offset;
	bool is_func;
	int type;
	vector<int> params;

//Methods:	
	info(string xname, int xoffset, int xtype){
		is_func = false;
		name = string(xname);
		offset = xoffset;
		type = xtype; 
		params = vector<int>();
	}

	/**
	 * compares this info with another
	 * @param  x [another info]
	 * @return   [bool]
	 */
	bool compare(info& x){
		if (name == x.name && is_func == x.is_func)
		return true;
	return false;
	}

	/**
	 * Compares between infos - returns true if equal.
	 * @param  a [left info]
	 * @param  b [right info]
	 * @return   [bool]
	 */
	bool info_compare(info& a, info& b){
		if (a.name == b.name && a.is_func == b.is_func)
			return true;
		return false;
	}
};








class glob_data {
    //symbol table main stack:
    vector<vector<info> > symb_stack;
    //track the offset of vars in the symbol stack global:
    stack<int> offset_stack;
public:
    //stores the current function declartions vars:
    //to keep track of the return type of function:
    int func_return;
    //Counts how many while loops so far:
    int is_while;
    //bad way(didn't find another) to handle a corner case: random ID string cause program -> to fail without proper error;
    bool big_scope_flag;
    vector<bool> reg_pool;
    CodeBuffer& cb = CodeBuffer::instance();
//Methods:
	glob_data(){
		big_scope_flag = false;
		is_while = 0;
		func_return = -1;
		symb_stack = vector<vector<info> >();
		symb_stack.push_back(vector<info>());
		offset_stack.push(0);
		info print_info("print",0,TYPE_FUNC_VOID);
		info printI_info("printi",0,TYPE_FUNC_VOID);
		print_info.is_func = 1;
		print_info.params.push_back(TYPE_STRING);
		printI_info.is_func = 1;
		printI_info.params.push_back(TYPE_INT);
		symb_stack.back().push_back(print_info);
		symb_stack.back().push_back(printI_info);
		for (int i = 0; i < NUM_REGS; ++i)
			reg_pool.push_back(false);
	}
	const char* int_to_name(int i){
      		if (i == TYPE_BYTE) return "BYTE";
        	if (i == TYPE_INT)  return "INT";
        	if (i == TYPE_BOOL) return "BOOL";
        	if (i == TYPE_STRING)  return "STRING";
                if (i == TYPE_FUNC_BYTE) return "BYTE";
                if (i == TYPE_FUNC_INT)  return "INT";
                if (i == TYPE_FUNC_BOOL) return "BOOL";
		if (i == TYPE_FUNC_VOID) return "VOID";
		return "";
	}
	int type_to_ret_type(int i){
                if (i == TYPE_INT) return TYPE_FUNC_INT;
                if (i == TYPE_BOOL) return TYPE_FUNC_BOOL;
                if (i == TYPE_BYTE) return TYPE_FUNC_BYTE;
                return -1;
	}
	/**
	 * push a new scope to global symbol table.
	 */
	void push_table(){
		vector<info> new_stack = vector<info>();
		symb_stack.push_back(new_stack);
		offset_stack.push(offset_stack.top());
	}

	/**
	 * removes the current scope and prints its content.
	 */
	void pop_table(){
		//NOT COMPLETE:
		endScope();
		for (vector<info>::iterator it = symb_stack.back().begin(); it !=symb_stack.back().end(); ++it){
			if ((*it).is_func == 0)
				 printID((*it).name.c_str(), (*it).offset, int_to_name((*it).type));
			else{
				if ((*it).name == "print" || (*it).name == "printi") continue;
                                vector<const char*> proto_names = vector<const char*>();
                                for (vector<int>::iterator it1 = (*it).params.begin();it1 != (*it).params.end();++it1){
                                      int_to_name_push(*it1, proto_names);
				}
				cout<<(*it).name<<" "<<makeFunctionType(int_to_name((*it).type), proto_names)<<" "<<(*it).offset<<endl;
				
			}
		}
		symb_stack.pop_back();	

		
		offset_stack.pop();
	}
	void pop_params(){
		for (int i = 0; i < symb_stack.back().size(); ++i)
			cb.emit("addu	$sp, $sp, 4");
	}
	/**
	 * Pushes info into current scope for normal vars
	 * @param x [info]
	 */
	void add_symbol( info& x ){
		symb_stack.back().push_back(x);
		offset_stack.top()++;
	}

	/**
	 * Pushes info into current scope for FUNCTION vars
	 * @param x [info]
	 */
	void add_symbol_func( info x){
		symb_stack.back().push_back(x);
	}

	/**
	 * finds info inside a vector and stores it in 'store_found' if found :: used by find_in_table.
	 * @param  v           [vector]
	 * @param  x           [info]
	 * @param  store_found [res info placement]
	 * @return             [bool]
	 */
	bool vector_contains (vector<info>& v, info& x, info& store_found){
		vector<info>::iterator it;
		for (it = v.begin(); it != v.end(); it++){
			if (x.compare(*it)){
				store_found = (*it);
				return true;
			}
		}
		return false;
	}

	/**
	 * looks for a symbol with given name in global symbol table.
	 * @param  name    [ifo's name]
	 * @param  value   [placement to store info]
	 * @param  is_func [boolean - search for function if true, else var]
	 * @return         [info.type or -1 if not found]
	 */
	int find_in_table (string name, info& value, bool is_func)
	{
	  vector<vector<info> >::reverse_iterator rit;
	  for( rit = symb_stack.rbegin(); rit != symb_stack.rend(); ++rit)
		{
			info temp(name, 0, 0);
			temp.is_func = is_func;
			if (vector_contains((*rit), temp, value)){
				return value.type;
			}
		}
	  return -1;
	}

	int get_var_offset(string name){
		info new_info("dummy", 0, 0);
		int res = find_in_table(name, new_info, false);
		if((res < 0)){
			cout<<"Assertion failed !!! res != 0 "<< endl;
			exit(1);
		}
		return new_info.offset;
	}

	/**
	 * finds var with given name.
	 * @param  name  [info's name]
	 * @param  value [placement to store info]
	 * @return       [info.type or -1 if not found]
	 */
	int find_var (string name, info& value){
		//range of vars in the global enum.
		return find_in_table(name, value, false);
	}

	/**
	 *  finds function with given name.
	 * @param  name  [info's name]
	 * @param  value [placement to store info]
	 * @return       [info.type or -1 if not found]
	 */
	int find_func (string name, info& value){
		//range of functions in the global enum.
		return find_in_table(name, value, true);
	}

	/**
	 *  check if function with given name exists.
	 * @param  name  [info's name]
	 * @return       [info.type or -1 if not found]
	 */
	int has_func(string name){
		info value("dummy", 0, 0);
		//range of functions in the global enum.
		return find_in_table(name, value, true);
	}

	/**
	 * check if var with given name exists.
	 * @param  name  [info's name]
	 * @return       [info.type or -1 if not found]
	 */
	int has_var(string name){
		info value("dummy", 0, 0);
		//range of vars in the global enum.
		return find_in_table(name, value, false);
	}

	/**
	 * handles 'Statement' insertion to symbol table.
	 * @param x         [Statement's STYPE]
	 * @param new_scope [bool]
	 */
	void manage_insert( STYPE& x , bool new_scope){
		if (x.insert == false)
			return;	
		x.insert = false;

		info new_info(x.name, offset_stack.top(), x.type);

		if (new_scope){
			//single var in scope:
			push_table();
			add_symbol(new_info);
			pop_table();
			return;
		}
		//push into current table:
		add_symbol(new_info);
		//cb.emit("subu $sp, $sp ,4");
		return;
	}
	bool is_same_list(vector<int>& v1, vector<int>& v2){
             vector<int>::iterator it1 = (v1).begin();
             vector<int>::iterator it2 = v2.begin();
             for(;   it1 != v1.end() || it2 != v2.end(); ++it1, ++it2) {
             if (*it1 != *it2 && !(*it2 == TYPE_BYTE && *it1 == TYPE_INT))
            	 {
			return false;
             	 }
             }
             if (it1 != v1.end() || it2 != v2.end())
             {
		return false;
             }
	     return true;
	}
	void add_func_symbol_to_table(vector<pair<string,int> >& symb_vec){
                vector<pair<string,int> >::iterator it;
                int i = -1;
                for( it = symb_vec.begin(); it != symb_vec.end(); ++it){
                         info new_info = info((*it).first, i--,(*it).second);
                         add_symbol_func(new_info);
                }
	}

	/**
	 * Compare values with the operand in the relop string
	 * @param  val1  [left operand]
	 * @param  relop [comparsion string]
	 * @param  val2  [right operand]
	 * @return       [bool result]
	 */
	bool check_relop(int val1, string relop, int val2){
			if (relop == "==")
				return val1 == val2;
			else if (relop == "!=")
				return val1 != val2;
			else if (relop == "<")
				return val1 < val2;
			else if (relop == ">")
				return val1 > val2;	
			else if (relop == "<=")
				return val1 <= val2;
			else if (relop == ">=")
				return val1 >= val2;	
			else{
				cout << "ERROR  <>---- RELOP COMMAND NOT FOUND ---- <>  ERROR";	
				exit(1);	
			}
	}

	string relop_to_string(string r){
			if ( r == "==" ) return "beq";
			if ( r == "!=" ) return "bne";
			if ( r == "<" )	 return "blt";
			if ( r == ">" )	 return "bgt";
			if ( r == ">=" ) return "bge";
			if ( r == "<=" ) return "ble";
			cout<< "invalid relop what the shit: " << endl;
			exit(1);
	}

	/**
	 * cacluates the binop result if the operands are constant numbers.
	 * @param  val1  [left operand]
	 * @param  binop [operand string]
	 * @param  val2  [right operand]
	 * @return       [operation value]
	 */
	int calc_binop(int val1, string binop, int val2){ 
			if (binop == "+")
				return val1 + val2;
			else if (binop == "-")
				return val1 - val2;
			else if (binop == "*")
				return val1 * val2;
			else if (binop == "/")
				return val1 / val2;		
			else{
				cout << "ERROR  <>---- BINOP NOT FOUND ---- <>  ERROR";	
				exit(1);	
			}
	}	

	void emit_calc(string val1, string binop, string val2, string val3){ 
			if (binop == "+")
				cb.emit("addu	" + val1 + ", " + val2 + ", " + val3);
			else if (binop == "-")
				cb.emit("subu	" + val1 + ", " + val2 + ", " + val3);
			else if (binop == "*")
				cb.emit("mulu	" + val1 + ", " + val2 + ", " + val3);
			else if (binop == "/"){
				cb.emit("divu	" + val1 + ", " + val2 + ", " + val3);
			}
			else{
				cout << "ERROR  <>---- BINOP NOT FOUND ---- <>  ERROR";	
				exit(1);	
			}
	}	
	int convert_type_func_to_var( int func_type){
		//This is a quick fix. that relys on the distance between
		//functions types and var types inside the enum.
		//might needed to be repaired later.
		return func_type -4;
	}

	void check_for_main(){
		info func_info("dummy", -1, -1);
		if (find_func("main",func_info) < 0 || func_info.type != TYPE_FUNC_VOID || func_info.params.size() ){
			errorMainMissing(); 
			exit(1);
		}
	}

	string reg_alloc(){
		for (int i = 0; i < reg_pool.size(); ++i)
			if (!reg_pool[i]){
				reg_pool[i] = true;
				return "$" + to_string(i + 8);
			}
		cout << "unable to alloc another reg !" << endl;
		exit(1);
		return "";
	}

	void reg_free(string reg){
		if (reg.size() == 0)
			return ;
		reg.erase(0,1);
		reg_pool[stoi(reg) - 8] = false;
	}

	void reg_push(string reg){
		cb.emit("subu $sp, $sp ,4");
		cb.emit("sw	" + reg + ", ($sp)");
	}

	void reg_pushall(){
		for (int i = 0; i < reg_pool.size(); ++i){
			std::stringstream label;
			label << "$";
			label << (i + 8);
			reg_push(label.str());
		}
	}

	void reg_pop(string reg){
		cb.emit("lw	" + reg + ", ($sp)");
		cb.emit("addu	$sp, $sp, 4");
	}

	void reg_popall(){
		for (int i = reg_pool.size() - 1; i >= 0; --i){
			std::stringstream label;
			label << "$";
			label << (i + 8);
			reg_pop(label.str());
		}
	}
	void function_call(){
		reg_pushall();
		reg_push("$fp");
		reg_push("$ra");

	}
	void function_return(){

	}
	void bpatch_one(int i, string s){
		vector<int> v = vector<int>();
		v.push_back(i);
		cb.bpatch(v,s);
	}
};


//****************************************************************************************************
//                                   Other functions:
//****************************************************************************************************
	int yyerror(char const * message);
	void int_to_name_push(int i, vector<const char*>& proto_names);

//****************************************************************************************************
//                                   Globals:
//****************************************************************************************************
	glob_data st;







/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 678 "parser.tab.cpp"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  11
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   186

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  36
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  26
/* YYNRULES -- Number of rules.  */
#define YYNRULES  60
/* YYNRULES -- Number of states.  */
#define YYNSTATES  125

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   290

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint8 yyprhs[] =
{
       0,     0,     3,     5,     8,     9,    14,    20,    22,    24,
      25,    27,    29,    33,    36,    38,    41,    46,    50,    56,
      61,    64,    67,    71,    79,    83,    87,    90,    96,   101,
     107,   112,   113,   116,   118,   127,   137,   138,   139,   145,
     149,   150,   152,   156,   158,   160,   162,   166,   170,   172,
     174,   176,   179,   181,   183,   185,   188,   193,   198,   202,
     203
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      37,     0,    -1,    38,    -1,    39,    38,    -1,    -1,    40,
      22,    45,    23,    -1,    41,    25,    20,    42,    21,    -1,
      58,    -1,     3,    -1,    -1,    43,    -1,    44,    -1,    44,
      19,    43,    -1,    58,    25,    -1,    46,    -1,    45,    46,
      -1,    22,    61,    45,    23,    -1,    58,    25,    18,    -1,
      58,    25,    24,    59,    18,    -1,    25,    24,    59,    18,
      -1,    55,    18,    -1,    10,    18,    -1,    10,    59,    18,
      -1,    47,    60,    46,    29,    54,    60,    46,    -1,    47,
      60,    46,    -1,    48,    60,    46,    -1,    16,    18,    -1,
      49,    22,    51,    23,    18,    -1,    11,    20,    59,    21,
      -1,    13,    50,    20,    59,    21,    -1,    14,    20,    59,
      21,    -1,    -1,    52,    51,    -1,    52,    -1,    15,    12,
      17,    53,    46,    54,    16,    18,    -1,    15,    12,     6,
      17,    53,    46,    54,    16,    18,    -1,    -1,    -1,    25,
      20,    56,    57,    21,    -1,    25,    20,    21,    -1,    -1,
      59,    -1,    59,    19,    57,    -1,     4,    -1,     5,    -1,
       7,    -1,    20,    59,    21,    -1,    59,    34,    59,    -1,
      25,    -1,    55,    -1,    12,    -1,    12,     6,    -1,    26,
      -1,     8,    -1,     9,    -1,    35,    59,    -1,    59,    31,
      60,    59,    -1,    59,    32,    60,    59,    -1,    59,    33,
      59,    -1,    -1,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   540,   540,   547,   551,   559,   569,   587,   595,   598,
     599,   602,   603,   606,   609,   615,   623,   630,   641,   679,
     708,   712,   720,   733,   742,   750,   763,   771,   789,   804,
     818,   827,   833,   837,   843,   854,   868,   872,   876,   894,
     910,   914,   922,   933,   934,   935,   938,   947,   964,   987,
     996,  1009,  1026,  1027,  1032,  1037,  1051,  1066,  1082,  1102,
    1106
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "VOID", "INT", "BYTE", "B", "BOOL",
  "TRUE", "FALSE", "RETURN", "IF", "NUM", "WHILE", "SWITCH", "CASE",
  "BREAK", "COLON", "SC", "COMMA", "LPAREN", "RPAREN", "LBRACE", "RBRACE",
  "ASSIGN", "ID", "STRING", "whitespace", "comment", "ELSE", "then", "AND",
  "OR", "RELOP", "BINOP", "NOT", "$accept", "Program", "Funcs", "FuncDecl",
  "FuncDecl1", "RetType", "Formals", "FormalsList", "FormatDecl",
  "Statements", "Statement", "IFPART1", "WHILEPART1", "SWITCH1part",
  "Mark2", "CaseList", "CaseStat", "QUAD_CASE", "MARK_BRK", "Call",
  "Mark1", "ExpList", "Type", "Exp", "MQUAD", "PushMark", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    36,    37,    38,    38,    39,    40,    41,    41,    42,
      42,    43,    43,    44,    45,    45,    46,    46,    46,    46,
      46,    46,    46,    46,    46,    46,    46,    46,    47,    48,
      49,    50,    51,    51,    52,    52,    53,    54,    55,    55,
      56,    57,    57,    58,    58,    58,    59,    59,    59,    59,
      59,    59,    59,    59,    59,    59,    59,    59,    59,    60,
      61
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     0,     4,     5,     1,     1,     0,
       1,     1,     3,     2,     1,     2,     4,     3,     5,     4,
       2,     2,     3,     7,     3,     3,     2,     5,     4,     5,
       4,     0,     2,     1,     8,     9,     0,     0,     5,     3,
       0,     1,     3,     1,     1,     1,     3,     3,     1,     1,
       1,     2,     1,     1,     1,     2,     4,     4,     3,     0,
       0
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,     8,    43,    44,    45,     0,     2,     4,     0,     0,
       7,     1,     3,     0,     0,     0,     0,    31,     0,     0,
      60,     0,     0,    14,    59,    59,     0,     0,     0,     9,
      53,    54,    50,    21,     0,    48,    52,     0,    49,     0,
       0,     0,     0,    26,     0,    40,     0,     5,    15,     0,
       0,     0,    20,     0,     0,    10,    11,     0,    51,     0,
      55,    22,    59,    59,     0,     0,     0,     0,     0,     0,
      39,     0,     0,    24,    25,     0,     0,    33,    17,     0,
       6,     0,    13,    46,     0,     0,    58,    47,    28,     0,
      30,    16,     0,    41,    19,    37,     0,     0,    32,     0,
      12,    56,    57,    29,    38,     0,    59,     0,    36,    27,
      18,    42,     0,    36,     0,    23,     0,    37,    37,     0,
       0,     0,     0,    34,    35
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     5,     6,     7,     8,     9,    54,    55,    56,    22,
      23,    24,    25,    26,    41,    76,    77,   114,   106,    38,
      71,    92,    28,    93,    49,    44
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -68
static const yytype_int16 yypact[] =
{
      93,   -68,   -68,   -68,   -68,     5,   -68,    93,    -9,    -3,
     -68,   -68,   -68,   144,    10,    -1,    13,   -68,    24,    40,
     -68,    -6,   100,   -68,   -68,   -68,    39,    41,    44,    16,
     -68,   -68,    58,   -68,    37,    47,   -68,    37,   -68,    42,
      37,    50,    37,   -68,   144,    57,    37,   -68,   -68,   144,
     144,    64,   -68,   -12,    60,   -68,    52,    67,   -68,    21,
     -68,   -68,   -68,   -68,    37,    37,    56,    37,   109,   122,
     -68,    37,   141,    53,   -68,    82,    79,    64,   -68,    37,
     -68,    16,   -68,   -68,    37,    37,    74,   -68,   -68,   149,
     -68,   -68,    88,    87,   -68,   -68,    -2,    94,   -68,   145,
     -68,   152,    -7,   -68,   -68,    37,   -68,    98,   -68,   -68,
     -68,   -68,   144,   -68,   144,   -68,   144,   -68,   -68,   101,
     108,   110,   113,   -68,   -68
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -68,   -68,   127,   -68,   -68,   -68,   -68,    65,   -68,    95,
     -21,   -68,   -68,   -68,   -68,    73,   -68,    43,   -67,   -13,
     -68,    32,     3,     1,   -23,   -68
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      27,    48,    50,    10,   107,    11,    78,    30,    31,    27,
      10,    32,    79,    13,    45,   108,    39,    33,    46,    34,
       2,     3,    14,     4,    35,    36,    64,    65,    73,    74,
      29,    27,    57,    40,    37,    59,    27,    27,    60,    84,
      85,    66,    83,    68,    42,    30,    31,    72,    48,    32,
     119,   120,    62,    63,    64,    65,    27,    34,    43,    52,
      61,    51,    35,    36,    58,    86,    87,    45,    89,    53,
      67,    81,    37,    62,    63,    64,    65,    88,    70,    75,
      99,    80,    95,   112,    57,   101,   102,    62,    63,    64,
      65,   115,    82,   117,    96,   118,     1,     2,     3,    27,
       4,    27,    97,    27,     2,     3,   105,     4,    65,   104,
      15,    16,   109,    17,    18,   113,    19,   121,    62,    63,
      64,    65,    20,    47,   122,    21,     2,     3,   123,     4,
      90,   124,    15,    16,    12,    17,    18,   111,    19,    69,
      62,    63,    64,    65,    20,    91,   100,    21,     2,     3,
      98,     4,     0,     0,    15,    16,   116,    17,    18,    94,
      19,     0,     0,   110,     0,     0,    20,     0,     0,    21,
     103,     0,    62,    63,    64,    65,    62,    63,    64,    65,
      62,    63,    64,    65,    63,    64,    65
};

static const yytype_int8 yycheck[] =
{
      13,    22,    25,     0,     6,     0,    18,     8,     9,    22,
       7,    12,    24,    22,    20,    17,    15,    18,    24,    20,
       4,     5,    25,     7,    25,    26,    33,    34,    49,    50,
      20,    44,    29,    20,    35,    34,    49,    50,    37,    62,
      63,    40,    21,    42,    20,     8,     9,    46,    69,    12,
     117,   118,    31,    32,    33,    34,    69,    20,    18,    18,
      18,    22,    25,    26,     6,    64,    65,    20,    67,    25,
      20,    19,    35,    31,    32,    33,    34,    21,    21,    15,
      79,    21,    29,   106,    81,    84,    85,    31,    32,    33,
      34,   112,    25,   114,    12,   116,     3,     4,     5,   112,
       7,   114,    23,   116,     4,     5,    19,     7,    34,    21,
      10,    11,    18,    13,    14,    17,    16,    16,    31,    32,
      33,    34,    22,    23,    16,    25,     4,     5,    18,     7,
      21,    18,    10,    11,     7,    13,    14,   105,    16,    44,
      31,    32,    33,    34,    22,    23,    81,    25,     4,     5,
      77,     7,    -1,    -1,    10,    11,   113,    13,    14,    18,
      16,    -1,    -1,    18,    -1,    -1,    22,    -1,    -1,    25,
      21,    -1,    31,    32,    33,    34,    31,    32,    33,    34,
      31,    32,    33,    34,    32,    33,    34
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,     4,     5,     7,    37,    38,    39,    40,    41,
      58,     0,    38,    22,    25,    10,    11,    13,    14,    16,
      22,    25,    45,    46,    47,    48,    49,    55,    58,    20,
       8,     9,    12,    18,    20,    25,    26,    35,    55,    59,
      20,    50,    20,    18,    61,    20,    24,    23,    46,    60,
      60,    22,    18,    25,    42,    43,    44,    58,     6,    59,
      59,    18,    31,    32,    33,    34,    59,    20,    59,    45,
      21,    56,    59,    46,    46,    15,    51,    52,    18,    24,
      21,    19,    25,    21,    60,    60,    59,    59,    21,    59,
      21,    23,    57,    59,    18,    29,    12,    23,    51,    59,
      43,    59,    59,    21,    21,    19,    54,     6,    17,    18,
      18,    57,    60,    17,    53,    46,    53,    46,    46,    54,
      54,    16,    16,    18,    18
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 540 "parser.ypp"
    {
					//st.check_for_main();
                    if (st.big_scope_flag) st.pop_table();
                    st.cb.printCodeBuffer();
				;}
    break;

  case 3:
#line 547 "parser.ypp"
    {
	                         st.check_for_main();
                             st.big_scope_flag = true;
							;}
    break;

  case 4:
#line 551 "parser.ypp"
    {
                                        //check if file is empty - error is missing main;
                                        if(strlen(yytext) == 0 ){
                                                st.check_for_main();
                                        }
                                ;}
    break;

  case 5:
#line 559 "parser.ypp"
    {	
			     if (!(yyvsp[(3) - (4)]).have_sure_exit && st.func_return != TYPE_FUNC_VOID){
			     	errorNotAllPaths(yylineno, (yyval).name.c_str()); 
			     	exit(1);
			     }			
                st.pop_table();
			 	st.func_return = -1;
               ;}
    break;

  case 6:
#line 569 "parser.ypp"
    {  
                    // first we check if the func we just declared is already declared ?
                    if (st.has_func((yyvsp[(2) - (5)]).name) >= 0){
                    	errorDef(yylineno, (yyvsp[(2) - (5)]).name.c_str()); 
                    	exit(1);
                    }
                    info new_info((yyvsp[(2) - (5)]).name, 0, (yyvsp[(1) - (5)]).type);
                    new_info.is_func = 1;
                    for (vector<pair<string,int> >::iterator it = (yyvsp[(4) - (5)]).formal_list.begin(); it != (yyvsp[(4) - (5)]).formal_list.end(); ++it){
                        new_info.params.push_back((*it).second);
                    }
                    st.add_symbol_func(new_info);
                    st.push_table();
                    st.add_func_symbol_to_table((yyvsp[(4) - (5)]).formal_list);			   				
				;}
    break;

  case 7:
#line 587 "parser.ypp"
    {
					int t = -1;
					if ((yyvsp[(1) - (1)]).type == TYPE_INT) t = TYPE_FUNC_INT;
					if ((yyvsp[(1) - (1)]).type == TYPE_BOOL) t = TYPE_FUNC_BOOL;
					if ((yyvsp[(1) - (1)]).type == TYPE_BYTE) t = TYPE_FUNC_BYTE;
					st.func_return = t;
					(yyval).type = t;
			     ;}
    break;

  case 8:
#line 595 "parser.ypp"
    {st.func_return = (TYPE_FUNC_VOID) ; (yyval).type = TYPE_FUNC_VOID;;}
    break;

  case 9:
#line 598 "parser.ypp"
    {(yyval).formal_list = vector<pair<string,int> >();;}
    break;

  case 10:
#line 599 "parser.ypp"
    {(yyval).formal_list = (yyvsp[(1) - (1)]).formal_list;;}
    break;

  case 11:
#line 602 "parser.ypp"
    {(yyval).formal_list.insert((yyval).formal_list.begin()  ,make_pair((yyvsp[(1) - (1)]).name ,(yyvsp[(1) - (1)]).type));;}
    break;

  case 12:
#line 603 "parser.ypp"
    {(yyval).formal_list = (yyvsp[(3) - (3)]).formal_list; (yyval).formal_list.insert((yyval).formal_list.begin(), make_pair((yyvsp[(1) - (3)]).name,(yyvsp[(1) - (3)]).type));;}
    break;

  case 13:
#line 606 "parser.ypp"
    {(yyval).type = (yyvsp[(1) - (2)]).type; (yyval).name = (yyvsp[(2) - (2)]).name;;}
    break;

  case 14:
#line 609 "parser.ypp"
    {
								(yyval).next_list = (yyvsp[(1) - (1)]).next_list;
								(yyval).have_sure_exit = (yyvsp[(1) - (1)]).have_sure_exit;
								st.manage_insert( (yyvsp[(1) - (1)]) , false);

							;}
    break;

  case 15:
#line 615 "parser.ypp"
    { 
											(yyval).next_list = st.cb.merge((yyvsp[(1) - (2)]).next_list, (yyvsp[(2) - (2)]).next_list);
											(yyval).have_sure_exit = ((yyvsp[(1) - (2)]).have_sure_exit || (yyvsp[(2) - (2)]).have_sure_exit) ? true : false; // doing or between of them
											st.manage_insert( (yyvsp[(2) - (2)]) , false);

									;}
    break;

  case 16:
#line 623 "parser.ypp"
    {
								  						  (yyval).next_list = (yyvsp[(3) - (4)]).next_list;
														  (yyval).have_sure_exit = (yyvsp[(3) - (4)]).have_sure_exit;
														  (yyval).insert = false;
														  st.pop_params();
														  st.pop_table();
							    ;}
    break;

  case 17:
#line 630 "parser.ypp"
    {
								if (st.has_func((yyvsp[(2) - (3)]).name) >= 0|| st.has_var((yyvsp[(2) - (3)]).name) >= 0) {
									errorDef(yylineno, (yyvsp[(2) - (3)]).name.c_str()); 
									exit(1);
								}
						     	(yyval).type = (yyvsp[(1) - (3)]).type;
								(yyval).name = (yyvsp[(2) - (3)]).name;
								(yyval).insert = true;
								(yyval).have_sure_exit = false;
								st.cb.emit("subu $sp, $sp, 4 # inserting var = " + (yyvsp[(2) - (3)]).name);
							  ;}
    break;

  case 18:
#line 641 "parser.ypp"
    {
					if (st.has_func((yyvsp[(2) - (5)]).name) >= 0|| st.has_var((yyvsp[(2) - (5)]).name) >= 0) {
						errorDef(yylineno, (yyvsp[(2) - (5)]).name.c_str()); 
						exit(1);
					}
					if ((yyvsp[(1) - (5)]).type != (yyvsp[(4) - (5)]).type && !((yyvsp[(4) - (5)]).type == TYPE_BYTE && (yyvsp[(1) - (5)]).type == TYPE_INT)) { 
						errorMismatch(yylineno); 
						exit(1);
					}
					if ((yyvsp[(1) - (5)]).type == TYPE_BYTE && (yyvsp[(4) - (5)]).value > 255){
						errorByteTooLarge(yylineno, (yyvsp[(4) - (5)]).name.c_str()); 
						exit(1);
					}
					if ( (yyvsp[(1) - (5)]).type == TYPE_BYTE && (yyvsp[(4) - (5)]).type == TYPE_INT){
						errorMismatch(yylineno); 
						exit(1);
					}
                    (yyval).type = (yyvsp[(1) - (5)]).type;
                    (yyval).name = (yyvsp[(2) - (5)]).name;
                    (yyval).insert = true;
					(yyval).have_sure_exit = false;
					if ((yyvsp[(1) - (5)]).type != TYPE_BOOL){
						st.cb.emit("# inserting var = " + (yyval).name);
						st.reg_push((yyvsp[(4) - (5)]).reg);
					}else{
						string true_label = st.cb.next();
						string reg = st.reg_alloc();
						st.cb.emit("li	" + reg + ", 1");

						int temp = st.cb.emit("j ");
						string false_label = st.cb.next();
						st.cb.emit("li	" + reg + ", 0");
						string next_label = st.cb.next();
						st.bpatch_one(temp, next_label);
						st.cb.bpatch((yyvsp[(4) - (5)]).true_list, true_label);
						st.cb.bpatch((yyvsp[(4) - (5)]).false_list, false_label);
					}
				;}
    break;

  case 19:
#line 679 "parser.ypp"
    {
						(yyval).insert = false;
						int res = -1;
						if ((res = st.has_var((yyvsp[(1) - (4)]).name)) < 0){ 
							errorUndef(yylineno, (yyvsp[(1) - (4)]).name.c_str()); 
							exit(1);
						}
						if (res != (yyvsp[(3) - (4)]).type && !(res == TYPE_INT && (yyvsp[(3) - (4)]).type == TYPE_BYTE)){
							errorMismatch(yylineno); 
							exit(1);
						}
						if (res == TYPE_BYTE && (yyvsp[(3) - (4)]).value > 255){
							errorByteTooLarge(yylineno, (yyvsp[(3) - (4)]).name.c_str()); 
							exit(1);
						}
						if ( (yyvsp[(1) - (4)]).type == TYPE_BYTE && (yyvsp[(4) - (4)]).type == TYPE_INT){
							errorMismatch(yylineno); 
							exit(1);
						}
						if ((yyvsp[(3) - (4)]).type != TYPE_BOOL){
							(yyval).have_sure_exit = false;
							std::stringstream ass;
							ass << ((st.get_var_offset((yyvsp[(1) - (4)]).name) + 1)  * 4);
							ass << "($sp)";
							st.cb.emit("sw	" + (yyvsp[(3) - (4)]).reg + ", " + ass.str());
						}else{ // DO BOOLBOOL

						}
					;}
    break;

  case 20:
#line 708 "parser.ypp"
    {
					(yyval).insert = false;
					(yyval).have_sure_exit = false;
				  ;}
    break;

  case 21:
#line 712 "parser.ypp"
    {
					(yyval).have_sure_exit = true;
					(yyval).insert = false;
					if (st.func_return != TYPE_FUNC_VOID){
						errorMismatch(yylineno);
						exit(1);
					}
				;}
    break;

  case 22:
#line 720 "parser.ypp"
    {
					(yyval).have_sure_exit = true;
					(yyval).insert = false;
					if (st.func_return != st.type_to_ret_type((yyvsp[(2) - (3)]).type) && !(st.func_return == TYPE_FUNC_INT && (yyvsp[(2) - (3)]).type == TYPE_BYTE)) {
						errorMismatch(yylineno);
						exit(1);
					}
					if (st.func_return == TYPE_FUNC_BYTE && (yyvsp[(2) - (3)]).value > 255){
						errorByteTooLarge(yylineno, (yyvsp[(2) - (3)]).name.c_str()); 
						exit(1);
					};
					st.cb.emit("move $v0" + (yyvsp[(2) - (3)]).reg);
				;}
    break;

  case 23:
#line 733 "parser.ypp"
    {
							(yyval).have_sure_exit = ((yyvsp[(2) - (7)]).have_sure_exit && (yyvsp[(4) - (7)]).have_sure_exit) ? true : false;
							(yyval).insert = false;
							st.manage_insert( (yyvsp[(2) - (7)]) , true);
							st.manage_insert( (yyvsp[(4) - (7)]) , true);
							st.cb.bpatch((yyvsp[(1) - (7)]).true_list,(yyvsp[(2) - (7)]).quad );
							st.cb.bpatch((yyvsp[(1) - (7)]).false_list,(yyvsp[(6) - (7)]).quad );
							st.cb.bpatch((yyvsp[(5) - (7)]).next_list, st.cb.next());
						;}
    break;

  case 24:
#line 742 "parser.ypp"
    {	
								(yyval).have_sure_exit = false;
								(yyval).insert = false;
								st.manage_insert((yyvsp[(2) - (3)]), true);
								st.cb.bpatch((yyvsp[(1) - (3)]).true_list,(yyvsp[(2) - (3)]).quad );
								st.cb.bpatch((yyvsp[(1) - (3)]).false_list, st.cb.next());
					 		 ;}
    break;

  case 25:
#line 750 "parser.ypp"
    {
												(yyval).insert = false;
												st.manage_insert( (yyvsp[(2) - (3)]) , true);
												st.is_while--;
												(yyval).have_sure_exit = false;
												st.cb.bpatch((yyvsp[(1) - (3)]).true_list, (yyvsp[(2) - (3)]).quad);
												st.bpatch_one(st.cb.emit("j "), (yyvsp[(1) - (3)]).quad);
												string label = st.cb.next();
												st.cb.bpatch((yyvsp[(1) - (3)]).false_list, label);
												st.cb.bpatch((yyvsp[(3) - (3)]).next_list, label);
												st.cb.bpatch((yyvsp[(1) - (3)]).false_list , (yyvsp[(2) - (3)]).reg);
												st.cb.emit("# End While Loop");
							;}
    break;

  case 26:
#line 763 "parser.ypp"
    {
						(yyval).insert = false;	
						if (!st.is_while) {
							errorUnexpectedBreak(yylineno); 
							exit(1);
						}
						(yyval).next_list = st.cb.makelist(st.cb.emit("j "));
					;}
    break;

  case 27:
#line 771 "parser.ypp"
    {
														(yyval).insert = false;
														(yyval).have_sure_exit = false; 

														st.cb.bpatch((yyvsp[(3) - (5)]).true_list, (yyvsp[(1) - (5)]).reg + ", ");
														for(int i=0; i < (yyvsp[(3) - (5)]).true_list.size() - 1; i ++){
															std::stringstream label;
															label << "label_";
															label << (yyvsp[(3) - (5)]).true_list[i + 1] - 1;
															st.bpatch_one((yyvsp[(3) - (5)]).true_list[i], label.str());
														}
														vector<int> v = vector<int>();
														v.push_back((yyvsp[(3) - (5)]).true_list.back());
														st.cb.bpatch(st.cb.merge((yyvsp[(3) - (5)]).next_list, v), st.cb.next());
														st.reg_free((yyvsp[(1) - (5)]).reg);
												    ;}
    break;

  case 28:
#line 789 "parser.ypp"
    {
										if ((yyvsp[(3) - (4)]).type != TYPE_BOOL){
											errorMismatch(yylineno);
											exit(1);
										}
										if ((yyvsp[(3) - (4)]).is_true == F_VAL){
											errorDeadCode(yylineno); 
											exit(1);
										}
										(yyval).true_list = (yyvsp[(3) - (4)]).true_list;
										(yyval).false_list = (yyvsp[(3) - (4)]).false_list;
										(yyval).next_list = (yyvsp[(3) - (4)]).next_list;

								;}
    break;

  case 29:
#line 804 "parser.ypp"
    {
												if ((yyvsp[(4) - (5)]).type != TYPE_BOOL){
													errorMismatch(yylineno);
													exit(1);
												}
												if ((yyvsp[(4) - (5)]).is_true == F_VAL){
													errorDeadCode(yylineno);
													exit(1);
												}
												(yyval).true_list = (yyvsp[(4) - (5)]).true_list;
												(yyval).false_list = (yyvsp[(4) - (5)]).false_list;	
												(yyval).quad = (yyvsp[(2) - (5)]).quad;											
											;}
    break;

  case 30:
#line 818 "parser.ypp"
    {
										if((yyvsp[(3) - (4)]).type != TYPE_BYTE && (yyvsp[(3) - (4)]).type != TYPE_INT){
											errorMismatch(yylineno);
											exit(1);
										}	
										(yyval).reg = (yyvsp[(3) - (4)]).reg;									
									;}
    break;

  case 31:
#line 827 "parser.ypp"
    { 	st.cb.emit("# starting While loop");
								st.is_while++;
 								(yyval).quad = st.cb.next(); // SHOULD BE QUAD NUMBER
						  ;}
    break;

  case 32:
#line 833 "parser.ypp"
    {
									(yyval).true_list = st.cb.merge((yyvsp[(1) - (2)]).true_list, (yyvsp[(2) - (2)]).true_list);
									(yyval).next_list = st.cb.merge((yyvsp[(1) - (2)]).next_list, (yyvsp[(2) - (2)]).next_list);								
								;}
    break;

  case 33:
#line 837 "parser.ypp"
    {
							(yyval).true_list = (yyvsp[(1) - (1)]).true_list;
							(yyval).next_list = (yyvsp[(1) - (1)]).next_list;	
						;}
    break;

  case 34:
#line 843 "parser.ypp"
    {
		                                       	 		  		  		st.manage_insert( (yyvsp[(5) - (8)]) , true); 
																		(yyval).true_list = (yyvsp[(4) - (8)]).true_list;
																		(yyval).next_list = (yyvsp[(6) - (8)]).next_list;
																		//this quad is chainlist of case lables, need to bp in caselist.
																		(yyval).quad = (yyvsp[(4) - (8)]).quad;
																		
												                    	std::stringstream number;
																		number << (yyvsp[(2) - (8)]).value << ",";
																		st.cb.bpatch((yyval).true_list , number.str());
														 	 ;}
    break;

  case 35:
#line 854 "parser.ypp"
    {
			                                                          	st.manage_insert( (yyvsp[(6) - (9)]) , true);
			                                                        	//both lists will get same backpatch to end of switch.
																		(yyval).true_list = (yyvsp[(5) - (9)]).true_list;
																		(yyval).next_list = (yyvsp[(7) - (9)]).next_list;
																		//this quad is chainlist of case lables, need to bp in caselist.
																		(yyval).quad = (yyvsp[(5) - (9)]).quad;

												                    	std::stringstream number;
																		number << (yyvsp[(2) - (9)]).value << ",";
																		st.cb.bpatch((yyval).true_list , number.str());
												  		;}
    break;

  case 36:
#line 868 "parser.ypp"
    {
								(yyval).quad = st.cb.next();
								(yyval).true_list = st.cb.makelist(st.cb.emit("bne	"));
						 ;}
    break;

  case 37:
#line 872 "parser.ypp"
    {
								 (yyval).next_list = st.cb.makelist(st.cb.emit("j "));
						;}
    break;

  case 38:
#line 876 "parser.ypp"
    {
						//first we check that the function is defined
								info func_info("dummy", -1, -1);
								if (st.find_func((yyvsp[(1) - (5)]).name,func_info) < 0){
									errorUndefFunc(yylineno, (yyvsp[(1) - (5)]).name.c_str()); 
									exit(1);
								}

								vector<const char*> proto_names = vector<const char*>();
								for (vector<int>::iterator it1 = (func_info.params).begin();it1 != func_info.params.end();++it1){
									int_to_name_push(*it1, proto_names);
								}
								if (!st.is_same_list(func_info.params, (yyvsp[(4) - (5)]).exp_list)){
									errorPrototypeMismatch(yylineno, (yyvsp[(1) - (5)]).name.c_str(), proto_names);
									exit(1);
								}
								(yyval).type = st.convert_type_func_to_var( func_info.type);
							;}
    break;

  case 39:
#line 894 "parser.ypp"
    {
						//first we check that the function is defined
								info func_info("dummy", -1, -1);
								if (st.find_func((yyvsp[(1) - (3)]).name,func_info) < 0){
									errorUndefFunc(yylineno, (yyvsp[(1) - (3)]).name.c_str()); 
									exit(1);
								}
                                vector<const char*> proto_names = vector<const char*>();
                                for (vector<int>::iterator it1 = (func_info.params).begin();it1 != func_info.params.end();++it1){
              						int_to_name_push(*it1, proto_names);
	                            }

								if (func_info.params.size()) { errorPrototypeMismatch(yylineno, (yyvsp[(1) - (3)]).name.c_str() , proto_names);exit(1);}
								(yyval).type = st.convert_type_func_to_var( func_info.type);
			;}
    break;

  case 40:
#line 910 "parser.ypp"
    {
								st.function_call();
						  ;}
    break;

  case 41:
#line 914 "parser.ypp"
    {
				(yyval).exp_list.insert((yyval).exp_list.begin() ,(yyvsp[(1) - (1)]).type);
				if ((yyvsp[(1) - (1)]).type != TYPE_BOOL)
					st.reg_push((yyvsp[(1) - (1)]).reg);
				else{

				}
			;}
    break;

  case 42:
#line 922 "parser.ypp"
    {
									(yyval).exp_list = (yyvsp[(3) - (3)]).exp_list;
									(yyval).exp_list.insert((yyval).exp_list.begin() , (yyvsp[(1) - (3)]).type);
									if ((yyvsp[(1) - (3)]).type != TYPE_BOOL)
										st.reg_push((yyvsp[(1) - (3)]).reg);
									else{

									}
					    		;}
    break;

  case 43:
#line 933 "parser.ypp"
    {(yyval).type = TYPE_INT;;}
    break;

  case 44:
#line 934 "parser.ypp"
    {(yyval).type = TYPE_BYTE;;}
    break;

  case 45:
#line 935 "parser.ypp"
    {(yyval).type = TYPE_BOOL;;}
    break;

  case 46:
#line 938 "parser.ypp"
    {
									(yyval).is_true = (yyvsp[(2) - (3)]).is_true;
									(yyval).type = (yyvsp[(2) - (3)]).type;
									(yyval).value = (yyvsp[(2) - (3)]).value;
									(yyval).reg = (yyvsp[(1) - (3)]).reg;
									(yyval).true_list = (yyvsp[(2) - (3)]).true_list;
									(yyval).next_list = (yyvsp[(2) - (3)]).next_list;
									(yyval).false_list = (yyvsp[(2) - (3)]).false_list;
							;}
    break;

  case 47:
#line 947 "parser.ypp"
    {
                         if ((yyvsp[(1) - (3)]).is_true != UNDEFINED && (yyvsp[(3) - (3)]).is_true != UNDEFINED){
                         	(yyval).value = st.calc_binop((yyvsp[(1) - (3)]).value,  (yyvsp[(2) - (3)]).name, (yyvsp[(3) - (3)]).value);
                           	(yyval).is_true = ((yyval).value != 0) ? T_VAL : F_VAL ;
                         }else{
                            (yyval).is_true = UNDEFINED;
                         }
                         if (!((yyvsp[(1) - (3)]).type == TYPE_INT || (yyvsp[(1) - (3)]).type == TYPE_BYTE) || !((yyvsp[(3) - (3)]).type == TYPE_INT || (yyvsp[(3) - (3)]).type == TYPE_BYTE)){
                         	errorMismatch(yylineno);
                         	exit(1);
                         }
						
						(yyval).type =( (yyvsp[(1) - (3)]).type == TYPE_INT || (yyvsp[(3) - (3)]).type == TYPE_INT) ? TYPE_INT : TYPE_BYTE;
						(yyval).reg = (yyvsp[(1) - (3)]).reg;
						st.emit_calc((yyvsp[(1) - (3)]).reg, (yyvsp[(2) - (3)]).name, (yyvsp[(1) - (3)]).reg, (yyvsp[(3) - (3)]).reg);
						st.reg_free((yyvsp[(3) - (3)]).reg);
					;}
    break;

  case 48:
#line 964 "parser.ypp"
    {
					int res = -1;
					info new_info("",-1,-1);
					res = st.find_func((yyvsp[(1) - (1)]).name, new_info);
					(yyval).is_true = UNDEFINED;
					if (res >= 0) (yyval).type = res;
					else if ((res = st.find_var((yyvsp[(1) - (1)]).name, new_info)) >= 0) (yyval).type = res;
					else {
						errorUndef(yylineno, (yyvsp[(1) - (1)]).name.c_str()); 
						exit(1);
					}
                    if ((yyvsp[(1) - (1)]).type == TYPE_INT || (yyvsp[(1) - (1)]).type == TYPE_BYTE || (yyvsp[(1) - (1)]).type == TYPE_FUNC_INT ||
                    															 (yyvsp[(1) - (1)]).type == TYPE_FUNC_BYTE){
                    	(yyval).reg = st.reg_alloc();
                    	std::stringstream label;
						label << "lw	";
						label << (yyval).reg;
						label << ", ";
						label << (new_info.offset + 1) * 4;
						label << "($fp)";
                    	st.cb.emit(label.str());
                    }
			     ;}
    break;

  case 49:
#line 987 "parser.ypp"
    {
						(yyval).type = (yyvsp[(1) - (1)]).type;
						(yyval).is_true = UNDEFINED;
                    	if ((yyvsp[(1) - (1)]).type == TYPE_INT || (yyvsp[(1) - (1)]).type == TYPE_BYTE || (yyvsp[(1) - (1)]).type == TYPE_FUNC_INT ||
                    															 (yyvsp[(1) - (1)]).type == TYPE_FUNC_BYTE){
                    		(yyval).reg = st.reg_alloc();
                    		st.cb.emit("lw	" + (yyval).reg + "$v0");
                    	}
				;}
    break;

  case 50:
#line 996 "parser.ypp"
    {
						(yyval).type = TYPE_INT;
						(yyval).name = (yyvsp[(1) - (1)]).name; 
						(yyval).value = (yyvsp[(1) - (1)]).value;
						(yyval).is_true = ((yyvsp[(1) - (1)]).value != 0) ? T_VAL : F_VAL ;
				 		(yyval).reg = st.reg_alloc();
                    	std::stringstream label;
						label << "li	";
						label << (yyval).reg;
						label << ", ";
						label << (yyval).value;	
                    	st.cb.emit(label.str());
				 ;}
    break;

  case 51:
#line 1009 "parser.ypp"
    {
						if ((yyvsp[(1) - (2)]).value > 255 || (yyvsp[(1) - (2)]).value < 0){
							errorByteTooLarge(yylineno, (yyvsp[(1) - (2)]).name.c_str());
							exit(1);
						} 
						(yyval).type = TYPE_BYTE;
						(yyval).name = (yyvsp[(1) - (2)]).name;
						(yyval).value = (yyvsp[(1) - (2)]).value;
						(yyval).is_true = ((yyvsp[(1) - (2)]).value != 0) ? T_VAL : F_VAL ;
						(yyval).reg = st.reg_alloc();
						std::stringstream label;
						label << "li	";
						label << (yyval).reg;
						label << ", ";
						label << (yyval).value;	
		                st.cb.emit(label.str());
			;}
    break;

  case 52:
#line 1026 "parser.ypp"
    {(yyval).type = TYPE_STRING;;}
    break;

  case 53:
#line 1027 "parser.ypp"
    {
						(yyval).true_list = st.cb.makelist(st.cb.emit("j ")); // what should do about false list ? 
						(yyval).type = TYPE_BOOL;
						(yyval).is_true = T_VAL;
				;}
    break;

  case 54:
#line 1032 "parser.ypp"
    {
                        (yyval).false_list = st.cb.makelist(st.cb.emit("j ")); // what should do about false list ? 
						(yyval).type = TYPE_BOOL;
						(yyval).is_true = F_VAL;
				;}
    break;

  case 55:
#line 1037 "parser.ypp"
    {
										(yyval).true_list = (yyvsp[(2) - (2)]).false_list;
										(yyval).false_list = (yyvsp[(2) - (2)]).true_list;
                                        (yyval).type = TYPE_BOOL;
                                        if ((yyvsp[(2) - (2)]).type != TYPE_BOOL) {
                                        	errorMismatch(yylineno); 
                                        	exit(1);
                                        }
                                        if ((yyvsp[(2) - (2)]).is_true != UNDEFINED){
                                        	(yyval).is_true =((yyvsp[(2) - (2)]).is_true == F_VAL) ? T_VAL : F_VAL ;
                                        }else{
                                        	(yyval).is_true = UNDEFINED;
                                        }     
                                  ;}
    break;

  case 56:
#line 1051 "parser.ypp"
    {
										st.cb.bpatch((yyvsp[(1) - (4)]).true_list, (yyvsp[(3) - (4)]).quad);
										(yyval).false_list = st.cb.merge((yyvsp[(1) - (4)]).false_list, (yyvsp[(4) - (4)]).false_list);
                                        (yyval).true_list = (yyvsp[(4) - (4)]).true_list;
                                        (yyval).type = TYPE_BOOL;
                                        if ((yyvsp[(1) - (4)]).type != TYPE_BOOL ||  (yyvsp[(4) - (4)]).type != TYPE_BOOL) {
                                        	errorMismatch(yylineno); 
                                        	exit(1);
                                        }
                                         if ((yyvsp[(1) - (4)]).is_true != UNDEFINED && (yyvsp[(4) - (4)]).is_true != UNDEFINED){
                                        	(yyval).is_true =((yyvsp[(1) - (4)]).is_true == T_VAL && (yyvsp[(4) - (4)]).is_true == T_VAL) ? T_VAL : F_VAL ;
                                        }else{
                                        	(yyval).is_true = UNDEFINED;
                                        }
				     ;}
    break;

  case 57:
#line 1066 "parser.ypp"
    {
										st.cb.bpatch((yyvsp[(1) - (4)]).false_list, (yyvsp[(3) - (4)]).quad);
										(yyval).true_list = st.cb.merge((yyvsp[(1) - (4)]).true_list, (yyvsp[(4) - (4)]).true_list);
                                        (yyval).false_list = (yyvsp[(4) - (4)]).false_list;

                                        (yyval).type = TYPE_BOOL;
                                        if ((yyvsp[(1) - (4)]).type != TYPE_BOOL ||  (yyvsp[(4) - (4)]).type != TYPE_BOOL) {
                                        	errorMismatch(yylineno); 
                                        	exit(1);
                                        }
                                        if ((yyvsp[(1) - (4)]).is_true != UNDEFINED && (yyvsp[(4) - (4)]).is_true != UNDEFINED){
                                        	(yyval).is_true =  ((yyvsp[(1) - (4)]).is_true == T_VAL || (yyvsp[(4) - (4)]).is_true == T_VAL) ? T_VAL : F_VAL ;
                                        }else{
                                        	(yyval).is_true = UNDEFINED;
                                        }
                                     ;}
    break;

  case 58:
#line 1082 "parser.ypp"
    {
								(yyval).type = TYPE_BOOL;
								if (!((yyvsp[(1) - (3)]).type == TYPE_INT || (yyvsp[(1) - (3)]).type == TYPE_BYTE) ||
																	 !((yyvsp[(3) - (3)]).type == TYPE_INT || (yyvsp[(3) - (3)]).type == TYPE_BYTE)){
									errorMismatch(yylineno); 
									exit(1);
								}
                        		if ((yyvsp[(1) - (3)]).is_true != UNDEFINED && (yyvsp[(3) - (3)]).is_true != UNDEFINED){
                        			(yyval).is_true = st.check_relop((yyvsp[(1) - (3)]).value,  (yyvsp[(2) - (3)]).name, (yyvsp[(3) - (3)]).value ) ? T_VAL : F_VAL;
                        		}else{
                        			(yyval).is_true = UNDEFINED;
                        		}
                        		int s =st.cb.emit(st.relop_to_string((yyvsp[(2) - (3)]).name) + ", " + (yyvsp[(1) - (3)]).reg + ", " + (yyvsp[(3) - (3)]).reg + ", ");
                        		(yyval).true_list = st.cb.makelist(s);
								(yyval).false_list = st.cb.makelist(st.cb.emit("j "));
							;}
    break;

  case 59:
#line 1102 "parser.ypp"
    {
					(yyval).quad = st.cb.next(); // SHOULD BE QUAD NUMBER
				;}
    break;

  case 60:
#line 1106 "parser.ypp"
    {
					st.push_table();
                ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2752 "parser.tab.cpp"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 1110 "parser.ypp"


int main()
{
	//yydebug = 1;
	yyparse();

}

int yyerror(char const * message)
{
	errorSyn(yylineno);
	exit(1);
}

void int_to_name_push(int i, vector<const char*>& proto_names){
	if (i == TYPE_BYTE) proto_names.push_back("BYTE");
	if (i == TYPE_INT)  proto_names.push_back("INT");
	if (i == TYPE_BOOL) proto_names.push_back("BOOL");
	if (i == TYPE_STRING)  proto_names.push_back("STRING");
 
}

