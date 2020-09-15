package uwebsockets.js;

import haxe.extern.EitherType;
import js.lib.ArrayBuffer;
import js.lib.Uint8Array;
import js.lib.Int8Array;
import js.lib.Uint16Array;
import js.lib.Int16Array;
import js.lib.Uint32Array;
import js.lib.Int32Array;
import js.lib.Float32Array;
import js.lib.Float64Array;

/** Recognized string types, things C++ can read and understand as strings.
 * "String" does not have to mean "text", it can also be "binary".
 *
 * Ironically, JavaScript strings are the least performant of all options, to pass or receive to/from C++.
 * This because we expect UTF-8, which is packed in 8-byte chars. JavaScript strings are UTF-16 internally meaning extra copies and reinterpretation are required.
 *
 * That's why all events pass data by ArrayBuffer and not JavaScript strings, as they allow zero-copy data passing.
 *
 * You can always do Buffer.from(arrayBuffer).toString(), but keeping things binary and as ArrayBuffer is preferred.
 */
typedef RecognizedString = Mixed10<
	String,
	ArrayBuffer, 
	Uint8Array, 
	Int8Array, 
	Uint16Array, 
	Int16Array, 
	Uint32Array, 
	Int32Array, 
	Float32Array,
	Float64Array
>;

private typedef Mixed2<T1, T2> = EitherType<T1, T2>;
private typedef Mixed3<T1, T2, T3> = Mixed2<T1, Mixed2<T2, T3>>;
private typedef Mixed4<T1, T2, T3, T4> = Mixed3<T1, T2, Mixed2<T3, T4>>;
private typedef Mixed5<T1, T2, T3, T4, T5> = Mixed4<T1, T2, T3, Mixed2<T4, T5>>;
private typedef Mixed6<T1, T2, T3, T4, T5, T6> = Mixed5<T1, T2, T3, T4, Mixed2<T5, T6>>;
private typedef Mixed7<T1, T2, T3, T4, T5, T6, T7> = Mixed6<T1, T2, T3, T4, T5, Mixed2<T6, T7>>;
private typedef Mixed8<T1, T2, T3, T4, T5, T6, T7, T8> = Mixed7<T1, T2, T3, T4, T5, T6, Mixed2<T7, T8>>;
private typedef Mixed9<T1, T2, T3, T4, T5, T6, T7, T8, T9> = Mixed8<T1, T2, T3, T4, T5, T6, T7, Mixed2<T8, T9>>;
private typedef Mixed10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> = Mixed9<T1, T2, T3, T4, T5, T6, T7, T8, Mixed2<T9, T10>>;