%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: CosNaming_Name
%% Source: /net/isildur/ldisk/daily_build/otp_prebuild_r13b02.2009-09-21_11/otp_src_R13B02/lib/orber/COSS/CosNaming/cos_naming.idl
%% IC vsn: 4.2.22
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module('CosNaming_Name').
-ic_compiled("4_2_22").


-include("CosNaming.hrl").

-export([tc/0,id/0,name/0]).



%% returns type code
tc() -> {tk_sequence,{tk_struct,"IDL:omg.org/CosNaming/NameComponent:1.0",
                                "NameComponent",
                                [{"id",{tk_string,0}},{"kind",{tk_string,0}}]},
                     0}.

%% returns id
id() -> "IDL:omg.org/CosNaming/Name:1.0".

%% returns name
name() -> "CosNaming_Name".



