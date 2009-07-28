= AvantiConveniences

http://www.pervasivecode.com/blog/avanticonveniences/
Author: Jamie Flournoy (jamie@pervasivecode.com)

== DESCRIPTION:

AvantiConveniences is a set of convenience code for Ruby on Rails applications.

== FEATURES/PROBLEMS:

ArgChecks helps you implement simple sanity-checking of arguments, like
permanent assertions or a poor man's Design by Contract facility, so you can
write code that will Fail Fast (see http://c2.com/cgi/wiki?FailFast).

HashExtensions adds a few methods that help you easily replace all the keys
and/or values at once.

StringExtensions provides String quoting (not escaping) with single quotes,
double quotes, or a caller-specified quoting character, and a String#dehumanize
method to do the reverse of the String#humanize method provided by ActiveSupport.

TextFormatter provides methods for hyphenating words for word-wrapping.

URIExtensions provides URI::Generic#query_from_hash, which will create a URI
query string from a Hash.

== SYNOPSIS:

See individual classes for details. All of them are single method invocations
that are very simple to use. For additional examples look in the test/
directory.

== REQUIREMENTS:

Ruby 1.8.5 (might work with earlier versions), ActiveSupport 1.2.6, Text-Hyphen
1.0.0, and Hoe 1.7.0.

== INSTALL:

If you haven't done this before: 
  gem sources -a http://gems.github.com

Then: 
  sudo gem install JamieFlournoy-AvantiConveniences

== LICENSE:

(The MIT License)

Copyright (c) 2008 Pervasive Code

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
