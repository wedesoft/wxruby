/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.22
 * 
 * This file is not intended to be easily readable and contains a number of 
 * coding conventions designed to improve portability and efficiency. Do not make
 * changes to this file unless you know what you are doing--modify the SWIG 
 * interface file instead. 
 * ----------------------------------------------------------------------------- */

#ifndef SWIG_WxFileDialog_WRAP_H_
#define SWIG_WxFileDialog_WRAP_H_

class Swig::Director;


class SwigDirector_wxFileDialog : public wxFileDialog, public Swig::Director {

public:
    SwigDirector_wxFileDialog(VALUE self, wxWindow *parent, wxString const &message = wxT("Choose"), wxString const &defaultDir = wxT(""), wxString const &defaultFile = wxT(""), wxString const &wildcard = wxT("*.*"), long style = 0, wxPoint const &pos = wxDefaultPosition, bool disown = false);
};


#endif
