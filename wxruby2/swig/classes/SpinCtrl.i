#   Copyright 2004 by Kevin Smith
#   released under the wxWidgets license
#   as part of the wxRuby project
%include "../common.i"

%module(directors="1") wxSpinCtrl

%{
#include <wx/spinctrl.h>
%}

# under GTK, this doesnt exist
%ignore SetSelection; 

%wrapper %{
#ifndef __WXGTK__

static VALUE
_wrap_wxSpinCtrl_SetSelection(int argc, VALUE *argv, VALUE self) {
    wxSpinCtrl *arg1 = (wxSpinCtrl *) 0 ;
    long arg2 ;
    long arg3 ;
    
    if ((argc < 2) || (argc > 2))
    rb_raise(rb_eArgError, "wrong # of arguments(%d for 2)",argc);
    SWIG_ConvertPtr(self, (void **) &arg1, SWIGTYPE_p_wxSpinCtrl, 1);
    arg2 = NUM2LONG(argv[0]);
    arg3 = NUM2LONG(argv[1]);
    (arg1)->SetSelection(arg2,arg3);
    
    return Qnil;
}

#endif


extern "C" void PostInit_wxSpinCtrl(void)
{
#ifndef __WXGTK__
    rb_define_method(cWxSpinCtrl.klass, "set_selection", VALUEFUNC(_wrap_wxSpinCtrl_SetSelection), -1);
#endif
}

%}



%include "include/wxSpinCtrl.h"

 
