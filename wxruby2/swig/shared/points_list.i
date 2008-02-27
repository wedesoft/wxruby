// Copyright 2004-2008, wxRuby development team
// released under the MIT-like wxRuby2 license

// These typemaps create lists of wxPoints from ruby arrays. They are
// used by DC in methods like draw_lines, draw_polygon etc

%{
  // Helper function to convert an array of Wx::Points or two-integer
  // ruby arrays (as a terser representation of a Point) into a C++
  // array. The C++ array should be already created with the correct
  // length
  static void wxRuby_PointArrayRubyToC(VALUE rb_arr, wxPoint wx_arr[]) {
    wxPoint *wx_point;
    VALUE rb_item;
    for (int i = 0; i < RARRAY(rb_arr)->len; i++)
      {
        rb_item = rb_ary_entry(rb_arr, i);
        SWIG_ConvertPtr(rb_item, (void **) &wx_point, 
                        SWIGTYPE_p_wxPoint, 1);
        if ( wx_point == NULL )
            rb_raise(rb_eTypeError, "Failed to create point %i", i);
        wx_arr[i] = *wx_point;
    }
  }
%}


%typemap(in,numinputs=1) (int n, wxPoint points[]) (wxPoint *arr)
{
  if ( ($input == Qnil) || (TYPE($input) != T_ARRAY) )
  {
    $1 = 0;
    $2 = NULL;
  }
  else
  {
    $1 = RARRAY($input)->len;
    arr = new wxPoint[RARRAY($input)->len];
    wxRuby_PointArrayRubyToC($input, arr);
    $2 = arr;
  }
}

%typemap(default,numinputs=1) (int n, wxPoint points[]) 
{
    $1 = 0;
    $2 = NULL;
}

%typemap(freearg) (int n , wxPoint points [])
{
    if ($2 != NULL) delete [] $2;
}

%typemap(typecheck) (int n , wxPoint points[])
{
   $1 = (TYPE($input) == T_ARRAY);
}

%apply (int n, wxPoint points []) { (int n, wxPoint* points),(int nItems, wxPoint *points) }

