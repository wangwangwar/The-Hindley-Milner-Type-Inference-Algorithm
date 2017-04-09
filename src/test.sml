use "unification.sml";
use "assert.sml";

(* Utils *)
fun apply s l = Tyapp (s, l)

(* Defines *)
val x = Tyvar "x";
val y = Tyvar "y";
val z = Tyvar "z";
val a = apply "a" [];
fun j (x, y, z) = apply "j" [x, y, z];
fun f (x, y) = apply "f" [x, y];

(* Tests *)

(* Test condition 1 *)
ppsubs (unify x x);
ppsubs (unify x y);

(* Test condition 2 *)
ppsubs (unify x a);

(* Test condition 3 *)
ppsubs (unify a x);

(* Test condition 4 *)
bthrows(fn () => unify x t1, Unify "");
ppsubs (unify x t2);

(* Test condition 5 *)
bthrows(fn () => unify t1 x, Unify "");
ppsubs (unify t2 x);

(* Test condition 6 *)
val t1 = j (x, y, z);
val t2 = j (f (y, y), f (z, z), f (a, a));
ppsubs (unify t1 t2);