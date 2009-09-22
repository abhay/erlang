%% -*- erlang-indent-level: 2 -*-
%%-----------------------------------------------------------------------
%% %CopyrightBegin%
%% 
%% Copyright Ericsson AB 2008-2009. All Rights Reserved.
%% 
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%% 
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%% 
%% %CopyrightEnd%

%%%----------------------------------------------------------------------
%%% File    : dialyzer_dataflow.hrl
%%% Author  : Maria Christakis <christakismaria@gmail.com>
%%% Description : Header file for dialyzer_dataflow.erl
%%%
%%% Created : 21 Nov 2008 by Maria Christakis <christakismaria@gmail.com>
%%%----------------------------------------------------------------------

%%-----------------------------------------------------------------------
%% Race warning classification
%%-----------------------------------------------------------------------

-define(WARN_WHEREIS_REGISTER, warn_whereis_register).
-define(WARN_ETS_LOOKUP_INSERT, warn_ets_lookup_insert).
-define(WARN_MNESIA_DIRTY_READ_WRITE, warn_mnesia_dirty_read_write).
-define(WARN_NO_WARN, warn_no_warn).

-type dial_race_warn_tag() :: ?WARN_WHEREIS_REGISTER | ?WARN_ETS_LOOKUP_INSERT
                            | ?WARN_MNESIA_DIRTY_READ_WRITE | ?WARN_NO_WARN.

%%-----------------------------------------------------------------------
%% Basic types used in the race analysis
%%-----------------------------------------------------------------------

-type dep_list()  :: [#dep_call{}].
-type core_args() :: [core_vars()] | 'empty'.
-type table_var() :: label() | ?no_label.
-type table()     :: {'named', table_var(), [string()]}| 'other' | 'no_t'.
-type call()      :: 'whereis' | 'register' | 'ets_new' | 'ets_lookup'
                   | 'ets_insert' | 'mnesia_dirty_read1'
                   | 'mnesia_dirty_read2' | 'mnesia_dirty_write1'
                   | 'mnesia_dirty_write2' | 'function_call'. 

%%----------------------------------------------------------------------
%% Record declarations used by dialyzer_dataflow and dialyzer_races
%%----------------------------------------------------------------------

-record(race_fun,   {mfa        :: mfa(),
                     args       :: args(),
                     arg_types  :: [erl_types:erl_type()],
                     vars       :: [core_vars()],
                     file_line  :: file_line(),
                     index      :: number(),
                     fun_mfa    :: mfa_or_funlbl(),
                     fun_label  :: label()}).

-record(dialyzer_races, {curr_fun              :: mfa_or_funlbl(),
                         curr_fun_label        :: label(),
                         curr_fun_args         :: core_args(),
			 new_table = 'no_t'    :: table(),
			 race_list = []        :: code(),
                         race_list_size = 0    :: number(),
                         race_tags = []        :: [#race_fun{}],
                         %% true for fun types and warning mode
                         race_analysis = false :: boolean(),
			 race_warnings = []    :: [dial_warning()]}).

-record(state, {callgraph            :: #dialyzer_callgraph{},
		envs                 :: dict(),
		fun_tab		     :: dict(),
		plt		     :: dialyzer_plt:plt(),
		opaques              :: [erl_types:erl_type()],
		races                :: #dialyzer_races{},
		records              :: dict(),
		tree_map	     :: dict(),
		warning_mode = false :: boolean(),
		warnings = []        :: [dial_warning()],
		work                 :: {[_], [_], set()}}).
