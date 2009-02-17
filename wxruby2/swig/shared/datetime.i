// Copyright 2004-2009, wxRuby development team
// released under the MIT-like wxRuby2 license

// Typemaps for converting between wxDateTime and Ruby's Date and Time
// classes. These are used in CalendarCtrl etc

// TODO - these would be better bundled up into separate functions to be
// called by the typemaps.

%{
#include <wx/datetime.h>
%}

// Accepts any Time-like object from Ruby and creates a wxDateTime
%typemap(in) wxDateTime& {
    int y       = NUM2INT(rb_funcall($input, rb_intern("year"), 0));
    int rMonth  = NUM2INT(rb_funcall($input, rb_intern("month"), 0));
    int rDay    = NUM2INT(rb_funcall($input, rb_intern("mday"), 0));
    int rHour   = NUM2INT(rb_funcall($input, rb_intern("hour"), 0));
    int rMinute = NUM2INT(rb_funcall($input, rb_intern("min"), 0));
    int rSecond = NUM2INT(rb_funcall($input, rb_intern("sec"), 0));

    wxDateTime::Month mon        = (wxDateTime::Month)(rMonth-1);
    wxDateTime::wxDateTime_t d   = (wxDateTime::wxDateTime_t)rDay;
    wxDateTime::wxDateTime_t h   = (wxDateTime::wxDateTime_t)rHour;
    wxDateTime::wxDateTime_t min = (wxDateTime::wxDateTime_t)rMinute;
    wxDateTime::wxDateTime_t s   = (wxDateTime::wxDateTime_t)rSecond;
    
	$1 = new wxDateTime(d, mon, y, h, min, s, 0);
}

%typemap(freearg) wxDateTime& "if ( argc > $argnum - 2 ) delete $1;"

// Converts a return value of wxDateTime& to a Ruby Time object
%typemap(out) wxDateTime& {
    VALUE y   = INT2NUM($1->GetYear());
    VALUE mon = INT2NUM($1->GetMonth() + 1);
    VALUE d   = INT2NUM($1->GetDay());
    VALUE h   = INT2NUM($1->GetHour());
    VALUE min = INT2NUM($1->GetMinute());
    VALUE s   = INT2NUM($1->GetSecond());
    
    VALUE cTime = rb_iv_get(rb_cObject, "Time");
    $result = rb_funcall(cTime, rb_intern("local"), 6, y, mon, d, h, min, s);
}

// Converts a return value of wxDateTime to a Ruby Time object
%typemap(out) wxDateTime {
    VALUE y   = INT2NUM($1.GetYear());
    VALUE mon = INT2NUM($1.GetMonth() + 1);
    VALUE d   = INT2NUM($1.GetDay());
    VALUE h   = INT2NUM($1.GetHour());
    VALUE min = INT2NUM($1.GetMinute());
    VALUE s   = INT2NUM($1.GetSecond());
    
    VALUE cTime = rb_iv_get(rb_cObject, "Time");
    $result = rb_funcall(cTime, rb_intern("local"), 6, y, mon, d, h, min, s);
}

// Need to have this to over-ride the default which does not work
%typemap(typecheck) wxDateTime& "$1 = (TYPE($input) != T_NONE);"


%typemap(in) wxDateTime::WeekDay "$1 = (wxDateTime::WeekDay)NUM2INT($input);"
%typemap(out) wxDateTime::WeekDay "$result = INT2NUM($1);"
