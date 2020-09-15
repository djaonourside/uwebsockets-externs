package uwebsockets.js;

@:jsRequire('uWebSockets.js')
extern class UWebSockets 
{
	/** Constructs a non-SSL app. An app is your starting point where you attach behavior to URL routes.
 	* This is also where you listen and run your app, set any SSL options (in case of SSLApp) and the like.
 	*/
	static function App(?options: AppOptions): TemplatedApp;
	/** Constructs an SSL app. See App. */
	static function SSLApp(?options: AppOptions): TemplatedApp;
	/** Closes a uSockets listen socket. */
	static function us_listen_socket_close(listenSocket: USListenSocket): Void;
	/** No compression (always a good idea if you operate using an efficient binary protocol) */
	static var DISABLED(default, null): CompressOptions;
	/** Zero memory overhead compression (recommended for pub/sub where same message is sent to many receivers) */
	static var SHARED_COMPRESSOR(default, null): CompressOptions;
	/** Sliding dedicated compress window, requires 3KB of memory per socket */
	static var DEDICATED_COMPRESSOR_3KB(default, null): CompressOptions;
	/** Sliding dedicated compress window, requires 4KB of memory per socket */
	static var DEDICATED_COMPRESSOR_4KB(default, null): CompressOptions;
	/** Sliding dedicated compress window, requires 8KB of memory per socket */
	static var DEDICATED_COMPRESSOR_8KB(default, null): CompressOptions;
	/** Sliding dedicated compress window, requires 16KB of memory per socket */
	static var DEDICATED_COMPRESSOR_16KB(default, null): CompressOptions;
	/** Sliding dedicated compress window, requires 32KB of memory per socket */
	static var DEDICATED_COMPRESSOR_32KB(default, null): CompressOptions;
	/** Sliding dedicated compress window, requires 64KB of memory per socket */
	static var DEDICATED_COMPRESSOR_64KB(default, null): CompressOptions;
	/** Sliding dedicated compress window, requires 128KB of memory per socket */
	static var DEDICATED_COMPRESSOR_128KB(default, null): CompressOptions;
	/** Sliding dedicated compress window, requires 256KB of memory per socket */
	static var DEDICATED_COMPRESSOR_256KB(default, null): CompressOptions;
}