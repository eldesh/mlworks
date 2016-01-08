(*  ==== Testing ====
 *
 *  Result: OK
 *
 *  Revision Log
 *  ------------
 *  $Log: word8arrays.sml,v $
 *  Revision 1.8  1997/11/21 10:51:19  daveb
 *  [Bug #30323]
 *
 *  Revision 1.7  1997/08/11  09:38:03  brucem
 *  [Bug #30086]
 *  Stop printing structure contents to prevent spurious failure.
 *
 *  Revision 1.6  1997/05/28  11:26:45  jont
 *  [Bug #30090]
 *  Remove uses of MLWorks.IO
 *
 *  Revision 1.5  1997/01/30  16:39:03  andreww
 *  [Bug #1904]
 *  monovectors no longer equality types.
 *
 *  Revision 1.4  1997/01/15  16:03:04  io
 *  [Bug #1892]
 *  rename __word{8,16,32}{array,vector} to __word{8,16,32}_{array,vector}
 *
 *  Revision 1.3  1996/11/06  12:06:20  matthew
 *  [Bug #1728]
 *  __integer becomes __int
 *
 *  Revision 1.2  1996/10/22  13:23:04  jont
 *  Remove references to toplevel
 *
 *  Revision 1.1  1996/05/22  15:04:08  matthew
 *  new unit
 *  New test
 *
*)

(* test/word8array.sml -- some test cases for Word8Array 
   PS 1994-12-21, 1995-05-11 *)



infix 1 seq
fun e1 seq e2 = e2;
fun check b = if b then "OK" else "WRONG";
fun check' f = (if f () then "OK" else "WRONG") handle _ => "EXN";

fun range (from, to) p = 
    let open Int
    in
	(from > to) orelse (p from) andalso (range (from+1, to) p)
    end;

fun checkrange bounds = check o range bounds;
  
local
    open Word8Array 
    infix 9 sub;
    val array0 = fromList [];

  infix ==;
  fun a == b =
    let
      val len = Word8Vector.length a
      fun scan i = if i=len then true
                   else (Word8Vector.sub(a,i) = Word8Vector.sub(b,i)
                         andalso scan (i+1))
    in
      len = Word8Vector.length b
      andalso scan 0
    end

  val extract = Word8ArraySlice.vector o Word8ArraySlice.slice

in

val i2w = Word8.fromInt;

val w127 = i2w 127;

val a = fromList (map i2w [0,1,2,3,4,5,6]);
val b = fromList (map i2w [44,55,66]);
val c = fromList (map i2w [0,1,2,3,4,5,6]);

val test1 = 
    check'(fn () => a<>c);
val test2 = 
    check'(fn () => 
	   array(0, w127) <> array0
	   andalso array(0, w127) <> tabulate(0, fn _ => w127)
	   andalso tabulate(0, fn _ => w127) <> fromList []
	   andalso array(0, w127) <> array(0, w127)
	   andalso tabulate(0, fn _ => w127) <> tabulate(0, fn _ => w127)
	   andalso fromList [] <> fromList []);

val d = tabulate(100, fn i => i2w (i mod 7));

val test3 = check' (fn () => d sub 27 = i2w 6);


val test4a = (tabulate(maxLen+1, i2w) seq "WRONG")
            handle Size => "OK" | _ => "WRONG";

val test4b = (tabulate(~1, i2w)       seq "WRONG")
            handle Size => "OK" | _ => "WRONG";

val test4c = 
    check'(fn () => length (tabulate(0, fn i => i2w (i div 0))) = 0);

val test5a = check'(fn () => length (fromList []) = 0 andalso length a = 7);
val test5b = check'(fn () => length array0 = 0);

val test6a = (c sub ~1 seq "WRONG") handle Subscript => "OK" | _ => "WRONG";
val test6b = (c sub 7  seq "WRONG") handle Subscript => "OK" | _ => "WRONG";
val test6c = check'(fn () => c sub 0 = i2w 0);

val e = array(203, i2w 0);
val _ = (copy{src=d, dst=e, di=0};
	 copy{src=b, dst=e, di=length d};
	 copy{src=d, dst=e, di=length d + length b});

fun a2v a = extract(a, 0, NONE);
val ev = Word8Vector.concat [a2v d, a2v b, a2v d];

val test7 = check'(fn () => length e = 203);

val test8a = (update(e, ~1, w127); "WRONG")
             handle Subscript => "OK" | _ => "WRONG";
val test8b = (update(e, length e, w127); "WRONG")
             handle Subscript => "OK" | _ => "WRONG";

val f = extract (e, 100, SOME 3);

val test9 = check'(fn () => f == a2v b);

val test9a = check'(fn () => ev == extract(e, 0, NONE)
		    andalso ev == extract(e, 0, SOME (length e)));
val test9b = 
    check'(fn () => Word8Vector.fromList [] == extract(e, 100, SOME 0));
val test9c = (extract(e, ~1, SOME (length e))  seq "WRONG") 
             handle Subscript => "OK" | _ => "WRONG"
val test9d = (extract(e, length e+1, SOME 0) seq "WRONG") 
             handle Subscript => "OK" | _ => "WRONG"
val test9e = (extract(e, 0, SOME (length e+1)) seq "WRONG") 
             handle Subscript => "OK" | _ => "WRONG"
val test9f = (extract(e, 20, SOME ~1)        seq "WRONG") 
             handle Subscript => "OK" | _ => "WRONG"
val test9g = (extract(e, ~1, NONE)  seq "WRONG") 
             handle Subscript => "OK" | _ => "WRONG"
val test9h = (extract(e, length e+1, NONE) seq "WRONG") 
             handle Subscript => "OK" | _ => "WRONG"
val test9i = 
    check'(fn () => a2v (fromList []) == extract(e, length e, SOME 0)
	   andalso a2v (fromList []) == extract(e, length e, NONE));

val _ = copy{src=e, dst=e, di=0};
val g = array(203, w127);
val _ = copy{src=e, dst=g, di=0};

val test10a = check'(fn () => ev == extract(e, 0, NONE)
		      andalso ev == extract(e, 0, SOME (length e)));
val test10b = check'(fn () => ev == extract(g, 0, NONE)
		     andalso ev == extract(g, 0, SOME (length g)));

val test10h = check'(fn () =>
		     (copy{src=array0, dst=array0, di=0}; 
		      array0 <> array(0, w127)));

val test11b = (copy{src=g, dst=g, di= ~1}; "WRONG") 
              handle Subscript => "OK" | _ => "WRONG"
val test11d = (copy{src=g, dst=g, di=1}; "WRONG") 
              handle Subscript => "OK" | _ => "WRONG"

val test11i = (copy{src=g, dst=g, di=1}; "WRONG") 
              handle Subscript => "OK" | _ => "WRONG"
end;
