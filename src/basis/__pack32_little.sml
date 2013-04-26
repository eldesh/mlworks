(*  ==== INITIAL BASIS :  PACK WORD 32 (LITTLE) ====
 *
 *  Copyright (C) 1995 Harlequin Ltd.
 *
 *  Implementation
 *  --------------
 *  This is part of the extended Initial Basis.
 *
 *  Revision Log
 *  ------------
 *  $Log: __pack32_little.sml,v $
 *  Revision 1.3  1999/02/17 14:34:08  mitchell
 *  [Bug #190507]
 *  Modify to satisfy CM constraints.
 *
 *  Revision 1.2  1999/02/02  15:57:53  mitchell
 *  [Bug #190500]
 *  Remove redundant require statements
 *
 *  Revision 1.1  1997/01/15  11:49:47  io
 *  new unit
 *  [Bug #1892]
 *  rename __pack{8,16,32}{big,little} to __pack{8,16,32}_{big,little}
 *
 * Revision 1.2  1996/05/15  13:37:23  jont
 * pack_words moved to pack_word
 *
 * Revision 1.1  1996/04/18  11:32:27  jont
 * new unit
 *
 *  Revision 1.2  1995/09/12  10:06:54  daveb
 *  words.sml replaced with word.sml.
 *
 *  Revision 1.1  1995/03/22  20:16:34  brianm
 *  new unit
 *  New file.
 *
 *
 *)

require "pack_word";
require "_pack_words_little";
require "__pre_word32";

structure Pack32Little : PACK_WORD =
   PackWordsLittle(
     structure Word = PreWord32
);