#   Copyright 2004-2005 by Kevin Smith
#   released under the MIT-style wxruby2 license

%include "../common.i"

%module wxGridCellEditor

%{
#include <wx/grid.h>
%}

%ignore wxGridCellEditor::wxGridCellEditor();

%include "include/wxGridCellEditor.h"
