(* __types.sml the structure *)
(*
$Log: __types.sml,v $
Revision 1.11  1995/03/24 14:50:22  matthew
Adding Stamp structure

Revision 1.10  1995/02/02  13:59:52  matthew
Removing debug stuff

Revision 1.9  1993/05/18  18:20:54  jont
Removed integer parameter

Revision 1.8  1992/09/25  12:30:54  jont
Removed simpletypes and its structures, they're in datatypes

Revision 1.7  1992/08/11  13:04:19  jont
Removed some redundant structure arguments and sharing
Converted where relevant to use NewMap.{forall,exists,iterate}

Revision 1.6  1992/08/04  15:47:20  davidt
Took out redundant Array argument and require.

Revision 1.5  1992/07/16  18:45:41  jont
added btree parameter

Revision 1.4  1992/02/14  12:19:57  jont
Changed requires to __ident and __identprint. Added require for __ty_debug

Revision 1.3  1992/01/27  18:44:21  jont
Added ty_debug parameter

Revision 1.2  1991/11/21  16:42:25  jont
Added copyright message

Revision 1.1  91/06/07  11:29:38  colin
Initial revision

Copyright 2013 Ravenbrook Limited <http://www.ravenbrook.com/>.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*)

require "../utils/__lists";
require "../utils/__print";
require "../utils/__crash";
require "../basics/__identprint";
require "__datatypes";
require "__stamp";

require "_types";

structure Types_ = Types(
  structure Lists     = Lists_
  structure Print     = Print_
  structure Crash     = Crash_
  structure IdentPrint = IdentPrint_
  structure Datatypes  = Datatypes_
  structure Stamp  = Stamp_
);
