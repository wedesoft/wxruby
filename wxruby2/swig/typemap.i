#   Copyright 2004 by Kevin Smith
#   released under the wxWidgets license
#   as part of the wxRuby project


##############################################################
%typemap(in) wxString& {
	$1 = new wxString(STR2CSTR($input));
}

%typemap(in) const wxString& {
	$1 = new wxString(STR2CSTR($input));
}

%typemap(in) wxString* {
	$1 = new wxString(STR2CSTR($input));
}
/**
%typemap(freearg) wxString & {
	delete $1;
}

%typemap(freearg) const wxString& {
	delete $1;
}

%typemap(freearg) wxString* {
	delete $1;
}
*/
%typemap(directorin) wxString, const wxString &, wxString & "$input = rb_str_new2($1.c_str());";

%typemap(directorin) wxString *, const wxString * "TODO: $1_name->c_str()";
                                                                                                   
%typemap(out) wxString {
	$result = rb_str_new2($1.c_str());
}

%typemap(out) wxString& {
	$result = rb_str_new2($1.c_str());
}

%typemap(out) const wxString& {
	$result = rb_str_new2($1.c_str());
}

%apply wxString& { wxString* }
                                                                               
%typemap(varout) wxString {
	$result = rb_str_new2($1.c_str());
}

%typemap(typecheck) wxString {
	$1 = (TYPE($input) == T_STRING);
}

%typemap(typecheck) wxString & {
	$1 = (TYPE($input) == T_STRING);
}

%typemap(typecheck) wxString *{
	$1 = (TYPE($input) == T_STRING);
}

##############################################################

%typemap(in) void* {
	$1 = (void*)($input);
}

%typemap(out) void* {
    $result = (VALUE)($1);
}

##############################################################

%typemap(in) wxItemKind {
	$1 = (wxItemKind)NUM2INT($input);
}

%typemap(out) wxItemKind {
    $result = INT2NUM((int)$1);
}

##############################################################

%typemap(in) wxCalendarDateBorder {
	$1 = (wxCalendarDateBorder)NUM2INT($input);
}

%typemap(out) wxCalendarDateBorder {
    $result = INT2NUM((int)$1);
}

##############################################################

%{
#include <wx/datetime.h>
%}

%typemap(in) const wxDateTime& {
    int y = NUM2INT(rb_funcall($input, rb_intern("year"), 0));
    int rMonth = NUM2INT(rb_funcall($input, rb_intern("month"), 0));
    int rDay = NUM2INT(rb_funcall($input, rb_intern("mday"), 0));
    int rHour = NUM2INT(rb_funcall($input, rb_intern("hour"), 0));
    int rMinute = NUM2INT(rb_funcall($input, rb_intern("min"), 0));
    int rSecond = NUM2INT(rb_funcall($input, rb_intern("sec"), 0));
    wxDateTime::Month mon = (wxDateTime::Month)(rMonth-1);
    wxDateTime::wxDateTime_t d = (wxDateTime::wxDateTime_t)rDay;
    wxDateTime::wxDateTime_t h = (wxDateTime::wxDateTime_t)rHour;
    wxDateTime::wxDateTime_t min = (wxDateTime::wxDateTime_t)rMinute;
    wxDateTime::wxDateTime_t s = (wxDateTime::wxDateTime_t)rSecond;
    
	$1 = new wxDateTime(d, mon, y, h, min, s, 0);
}

%typemap(out) wxDateTime& {
    VALUE y = INT2NUM($1->GetYear());
    VALUE mon = INT2NUM($1->GetMonth() + 1);
    VALUE d = INT2NUM($1->GetDay());
    VALUE h = INT2NUM($1->GetHour());
    VALUE min = INT2NUM($1->GetMinute());
    VALUE s = INT2NUM($1->GetSecond());
    
    VALUE cDateTime = rb_iv_get(rb_cObject, "DateTime");
    $result = rb_funcall(cDateTime, rb_intern("new"), 6, y, mon, d, h, min, s);
}

%apply int { wxDateTime::WeekDay  }

##############################################################
