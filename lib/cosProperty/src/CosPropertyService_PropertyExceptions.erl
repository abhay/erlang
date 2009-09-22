%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: CosPropertyService_PropertyExceptions
%% Source: /net/isildur/ldisk/daily_build/otp_prebuild_r13b02.2009-09-21_11/otp_src_R13B02/lib/cosProperty/src/CosProperty.idl
%% IC vsn: 4.2.22
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module('CosPropertyService_PropertyExceptions').
-ic_compiled("4_2_22").


-include("CosPropertyService.hrl").

-export([tc/0,id/0,name/0]).



%% returns type code
tc() -> {tk_sequence,
            {tk_struct,
                "IDL:omg.org/CosPropertyService/PropertyException:1.0",
                "PropertyException",
                [{"reason",
                  {tk_enum,
                      "IDL:omg.org/CosPropertyService/ExceptionReason:1.0",
                      "ExceptionReason",
                      ["invalid_property_name","conflicting_property",
                       "property_not_found","unsupported_type_code",
                       "unsupported_property","unsupported_mode",
                       "fixed_property","read_only_property"]}},
                 {"failing_property_name",{tk_string,0}}]},
            0}.

%% returns id
id() -> "IDL:omg.org/CosPropertyService/PropertyExceptions:1.0".

%% returns name
name() -> "CosPropertyService_PropertyExceptions".



