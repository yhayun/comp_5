#ifndef __ATTRIBUTES_H
#define __ATTRIBUTES_H
#include <vector>	
#include <string>

using namespace std;

typedef enum {
	T_VAL,
	F_VAL,
	UNDEFINED
} check_bool;

typedef struct
{
	int type;
	string name;
	int value;
	vector<int> exp_list;
	vector<string> id_list;
	bool insert;
	vector<pair<string,int> > formal_list;
	bool have_sure_exit;
	check_bool is_true;

	string quad;
	string reg;
	vector<int> true_list;
	vector<int> false_list;
	vector<int> next_list;
	vector<int> break_list;
	vector<int> reg_list;
	vector<int> switch_list;
	vector<vector<int> > prepare_call_list;
} STYPE;

#define YYSTYPE STYPE	// Tell Bison to use STYPE as the stack type

#endif

