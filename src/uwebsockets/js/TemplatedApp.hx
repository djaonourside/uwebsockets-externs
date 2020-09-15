package uwebsockets.js;

import haxe.extern.EitherType;

/** TemplatedApp is either an SSL or non-SSL app. See App for more info, read user manual. */
extern class TemplatedApp
{
	/** Listens to port. Callback hands either false or a listen socket. */
	@:overload(function (port: Int, cb: ListenCallback): TemplatedApp {})
	/** Listens to hostname & port. Callback hands either false or a listen socket. */
	@:overload(function (host: RecognizedString, port: Int, cb: ListenCallback): TemplatedApp {})
	/** Listens to port and sets Listen Options. Callback hands either false or a listen socket. */
	function listen(port: Int, options: ListenOptions, cb: ListenCallback): TemplatedApp;
	
	/** Registers an HTTP GET handler matching specified URL pattern. */
	function get(pattern: RecognizedString, handler: HttpHandler): TemplatedApp;
	/** Registers an HTTP POST handler matching specified URL pattern. */
	function post(pattern: RecognizedString, handler: HttpHandler): TemplatedApp;
	/** Registers an HTTP OPTIONS handler matching specified URL pattern. */
	function options(pattern: RecognizedString, handler: HttpHandler): TemplatedApp;
	/** Registers an HTTP DELETE handler matching specified URL pattern. */
	function del(pattern: RecognizedString, handler: HttpHandler): TemplatedApp;
	/** Registers an HTTP PATCH handler matching specified URL pattern. */
	function patch(pattern: RecognizedString, handler: HttpHandler): TemplatedApp;
	/** Registers an HTTP PUT handler matching specified URL pattern. */
	function put(pattern: RecognizedString, handler: HttpHandler): TemplatedApp;
	/** Registers an HTTP HEAD handler matching specified URL pattern. */
	function head(pattern: RecognizedString, handler: HttpHandler): TemplatedApp;
	/** Registers an HTTP CONNECT handler matching specified URL pattern. */
	function connect(pattern: RecognizedString, handler: HttpHandler): TemplatedApp;
	/** Registers an HTTP TRACE handler matching specified URL pattern. */
	function trace(pattern: RecognizedString, handler: HttpHandler): TemplatedApp;
	/** Registers an HTTP handler matching specified URL pattern on any HTTP method. */
	function any(pattern: RecognizedString, handler: HttpHandler): TemplatedApp;
	/** Registers a handler matching specified URL pattern where WebSocket upgrade requests are caught. */
	function ws(pattern: RecognizedString, behavior: WebSocketBehavior): TemplatedApp;
	/** Publishes a message under topic, for all WebSockets under this app. See WebSocket.publish. */
	function publish(topic: RecognizedString, message: RecognizedString, ?isBinary: Bool, ?compress: Bool): TemplatedApp;
}

private typedef HttpHandler = (res: HttpResponse, req: HttpRequest) -> Void;
private typedef ListenCallback = (listenSocket: EitherType<USListenSocket, Bool>) -> Void;