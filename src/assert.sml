exception ERROR of string option;

fun throwError msg = raise ERROR (SOME msg);

fun throws (msg, func, e) =
    (func (); throwError msg) handle e' =>
        if exnName e = exnName e'
        then ()
        else raise throwError msg

fun bthrows (func, e) = (func (); false) handle e' => exnName e = exnName e'