#   Copyright 2004-2005 by Kevin Smith
#   released under the MIT-style wxruby2 license

%include "../common.i"

%module(directors="1") wxRadioBox
%{
#include <wx/wx.h>
#include <wx/radiobox.h>
%}

%ignore wxRadioBox::wxRadioBox();
%ignore wxRadioBox::GetLabel;
%ignore wxRadioBox::SetLabel;
%ignore wxRadioBox::Number;

GC_NEVER(wxRadioBox);
%include "include/wxRadioBox.h"
