package uwebsockets.js;

/** An HttpRequest is stack allocated and only accessible during the callback invocation. */
extern class HttpRequest implements Dynamic<Dynamic>
{
	/** Returns the lowercased header value or empty string. */
	function getHeader(lowerCaseKey: RecognizedString): String;
	/** Returns the parsed parameter at index. Corresponds to route. */
	function getParameter(index: Int): String;
	/** Returns the URL including initial /slash */
	function getUrl(): String;
	/** Returns the HTTP method, useful for "any" routes. */
	function getMethod(): String;
	/** Returns the part of URL after ? sign or empty string. */
	function getQuery(): String;
	/** Loops over all headers. */
	function forEach(cb: (key: String, value: String) -> Void): Void;
	/** Setting yield to true is to say that this route handler did not handle the route, causing the router to continue looking for a matching route handler, or fail. */
	function setYield(yield: Bool): HttpRequest;
}