# README for wxRuby version 2.0

## Introduction

wxRuby is a cross-platform GUI library for Ruby, based on the wxWidgets
GUI toolkit for C++. It uses native widgets wherever possible, providing
the correct look, feel and behaviour to GUI applications on Windows, OS
X and Linux/GTK. wxRuby aims to provide a comprehensive solution to
developing professional-standard desktop applications in Ruby. 

## Installing wxRuby

wxRuby is distributed as pre-compiled binaries and source from the
project's site on Rubyforge: http://wxruby.rubyforge.org/

For the majority of users, installation simply requires running 'gem
install wxruby' on the command line. See INSTALL for further
information.

## Build from source

```
sudo apt-get install build-essential libwxgtk2.8-dev libwxbase2.8-dev libglu1-mesa-dev libgtk2.0-dev libpangox-1.0-dev libwxgtk-media2.8-dev
wget http://sourceforge.net/projects/swig/files/swig/swig-1.3.38/swig-1.3.38.tar.gz/download -O swig-1.3.38.tar.gz
tar xzf swig-*.tar.gz
cd swig-*
./configure
make
sudo make install

cd wxruby
rake
gem build wxruby.gemspec
```

## wxRuby licence

wxRuby is free and open-source. It is distributed under a liberal
licence which is compatible with both free and commercial development.
See LICENSE for more details.

## FAQ

### What platforms and operating systems are supported in wxRuby2?

Currently the following are fully supported:

* Windows NT/2000/XP/Vista (i686, MSVC and MingW)
* OS X 10.4+ (i686 and PowerPc)
* Linux (i686 + AMD-64)

Support for other platforms is not being actively developed at present,
but patches are welcome. It is likely to be much simpler to get wxRuby
working on similar modern systems (eg FreeBSD or Solaris with GTK) than
on legacy systems (eg Windows 98, Mac OS 9).

### Why would I choose wxruby over FXRuby, Ruby/GTK, Shoes etc?
   
There are several fine GUI toolkits available for Ruby, but we consider
that wxRuby offers a combination of features that no other toolkit can match:
   
* Cross-platform (MS Windows, Mac OS X, Linux)
* Real native widgets wherever possible
* Provides a comprehensive selection of widgets and other GUI features
* Useful non-GUI support classes, eg for Images and internationalisation
* Simple licence that is compatible with proprietary and Free Software 
* Mature and actively developed foundation in wxWidgets
* Easy to install and redistribute
   
### Why are native widgets important or helpful?

The really important feature among the above is, for many people, native
widgets. Several toolkits are to some degree able to simulate the native
appearance of widgets, but wxRuby widgets are actually native widgets -
so they behave and interact exactly according to the desktop's GUI
conventions.

For one thing, this means that end-users do not have to adjust to a
"foreign" interface. It ensures maximum compatibility with "assistive
technology" such as screen readers for blind users.  It also allows apps
to respect any themes the user may have chosen through their operating
system. 

Desktop conventions go beyond widget appearance, to the labelling and
positioning of items in standard dialogs and menus. wxRuby offers
features to help with these too.

## Where can I ask a question, or report a bug?

The main mailing list for those using wxRuby for GUI development is
wxruby-users. General questions and queries of all sorts are appropriate
for this list, and new users are welcome.

When asking a question, if something is not working as you expect,
please provide a *minimal*, *runnable* sample of code that demonstrates
the problem, and say what you expected to happen, and what actually
happened. Please also provide basic details of your platform, ruby and
wxruby version, and make a reasonable effort to find answers in the
archive and documentation before posting. People on the list are happy
to help, but it's too much to expect them to guess what you're trying to
do, or try and debug 1,000 lines of your application.

There is a bug-tracker and feature-request system on the rubyforge
project pages for wxRuby. Using these helps ensure that a bug is
followed through and resolved. You're strongly encouraged to post to
these logged-in to rubyforge and not anonymously. You won't receive any
requests for follow-up information on anonymous items, and so these can
end up being closed without being resolved if needed information isn't
supplied.

wxruby-development is a secondary mailing list for all those interested
in the current and future development of wxRuby. The discussion on this
list tends to deal more with the internals of the library.

## How can I learn to use wxRuby?

wxRuby is a large API and takes some time to learn. The wxRuby
distribution comes with numerous samples which illustrate how to use
many specific parts of the API. A good one to start with is the
'minimal' sample, which provides an application skeleton. All the
bundled samples are expected to work with current wxRuby 2.0, although
some use a more modern coding style than others.

Complete wxRuby API documentation can downloaded separately; this tends
to focus on how to use specific classes and methods, rather than on how
to construct an application overall.

There are also tutorials on the wiki, as well as on third-party
websites. These typically provide in-depth view of a particular topic,
but some may be out-of-date.

One of the advantages of wxRuby is the much larger ecosystem of
wxWidgets and wxPython resources out there. There is a book for
wxWidgets,"Cross-Platform Programming in wxWidgets", whcih can be freely
downloaded as a PDF. This provides very comprehensive coverage of the
wxWidgets API in C++. The code may not be directly useful, but the
descriptions of how widgets and events and so forth work are almost
always relevant to wxRuby.

When using a search engine to find answers about a wxRuby class, it can
be worth searching for the same term but with 'wx' prepended. For
example, if you wanted answers about the "Grid" class, try searching for
"wxGrid" as this will turn up results relating to wxWidgets and wxPython
which may be relevant.

## What wxWidgets features are supported by wxRuby?

wxRuby supports almost all of the wxWidgets 2.8.9 GUI API, around 300
classes in total. wxWidgets classes that provide general programming
support features, such as strings, networking, threading and database
access are not and will never be ported, as it's assumed that in all
these cases it's preferable to use a Ruby library.

If you know of a feature in wxWidgets that you would like to see
supported in wxRuby

## How does wxRuby 2.0 relate to the wxruby 0.6.0 release?

wxRuby 0.6.0 was the last in a series of releases developed using a
different approach in the early days of wxRuby. Work on this series
stopped in early 2005, in favour of what is now wxRuby 2.0. Several
years of development have gone into wxRuby since, making it vastly more
capable and correct than the 0.6.0 release, which is only offered for
legacy applications. 

## I am getting an error trying to install or compile wxRuby

Please double-check the INSTALL documents, and search the mailing list
archives. If this doesn't help, please post your question on the wxruby
mailing list (http://wxruby.rubyforge.org/wiki/wiki.pl?MailingLists)

# Credits 

Kevin Smith established the wxRuby 2.0 project using SWIG in 2005. Since
then it has benefitted from the input of dozens of volunteers, who have
contributed code, documentation, testing, bug reports and feature
requests. 

The alphabetic list shows (some of) those who've contributed code to
wxRuby 2.0.

Albin Holmgren
Alex Fenton
Artur Kuptel
Cezar Espinola
Chauk-Mean Proum
Christophe Bludau
Curt Hibbs
Dale Edmons
Daniel Savarese
David Whetstone
Dirk Traulsen
Hawley Waldman
Jani Monoses
Joe Seeley
Jonathan Maasland
Kevin Smith
Mario Steele
Nic
Pascal Hurni
Robert Carlin
Roy Sutton
Ryuichi Sakamoto
Sean Lindsay
Sean Long
Tobias Gruetzmacher
Zach Dennis

If your name is missing and should be here, please get in touch
with the current development team.

## Lead Maintainer

Alex Fenton: alex at pressure dot to
