#   Copyright 2004 by Kevin Smith
#   released under the wxWidgets license
#   as part of the wxRuby project
%include "../common.i"

%module(directors="1") wxToolBar;

%{
#include <wx/toolbar.h>

typedef wxControl wxToolBarTool ;
%}

typedef wxControl wxToolBarTool;
%ignore wxToolBar::AddTool(int toolId, const wxString& label, const wxBitmap& bitmap1, const wxBitmap& bitmap2 = wxNullBitmap, wxItemKind kind = wxITEM_NORMAL, const wxString& shortHelpString = "", const wxString& longHelpString = "", wxObject* clientData = NULL);

# under GTK, this doesn't exist
#ifndef SWIGMAC
 #ifndef SWIGWIN
  %ignore SetMargins(const wxSize&);
 #endif
#endif

GC_NEVER(wxToolBar);

%include "include/wxToolBar.h"

 