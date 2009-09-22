%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: CosPropertyService_PropertyModes
%% Source: /net/isildur/ldisk/daily_build/otp_prebuild_r13b02.2009-09-21_11/otp_src_R13B02/lib/cosProperty/src/CosProperty.idl
%% IC vsn: 4.2.22
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module('CosPropertyService_PropertyModes').
-ic_compiled("4_2_22").


-include("CosPropertyService.hrl").

-export([tc/0,id/0,name/0]).



%% returns type code
tc() -> {tk_sequence,
            {tk_struct,"IDL:omg.org/CosPropertyService/PropertyMode:1.0",
                "PropertyMode",
                [{"property_name",{tk_string,0}},
                 {"property_mode",
                  {tk_enum,
                      "IDL:omg.org/CosPropertyService/PropertyModeType:1.0",
                      "PropertyModeType",
                      ["normal","read_only","fixed_normal","fixed_readonly",
                       "undefined"]}}]},
            0}.

%% returns id
id() -> "IDL:omg.org/CosPropertyService/PropertyModes:1.0".

%% returns name
name() -> "CosPropertyService_PropertyModes".



