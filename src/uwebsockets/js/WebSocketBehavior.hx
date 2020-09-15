package uwebsockets.js;

import js.lib.ArrayBuffer;
import uwebsockets.js.USSocketContextT;

/** A structure holding settings and handlers for a WebSocket URL route handler. */
extern typedef WebSocketBehavior =
{
	/** Maximum length of received message. If a client tries to send you a message larger than this, the connection is immediately closed. */
	var ?maxPayloadLength: Int;
	/** Maximum amount of seconds that may pass without sending or getting a message. Connection is closed if this timeout passes. Resolution (granularity) for timeouts are typically 4 seconds, rounded to closest.
	* Disable by leaving 0.
	*/
	var ?idleTimeout: Int;
	/** What permessage-deflate compression to use. uWS.DISABLED, uWS.SHARED_COMPRESSOR or any of the uWS.DEDICATED_COMPRESSOR_xxxKB. */
	var ?compression: CompressOptions;
	/** Maximum length of allowed backpressure per socket when PUBLISHING messages (does not apply to ws.send). Slow receivers with too high backpressure will be skipped until they catch up or timeout. */
	var ?maxBackpressure: Int;
	/** Upgrade handler used to intercept HTTP upgrade requests and potentially upgrade to WebSocket.
	* See UpgradeAsync and UpgradeSync example files.
	*/
	var ?upgrade: (res: HttpResponse, req: HttpRequest, context: USSocketContextT) -> Void;
	/** Handler for new WebSocket connection. WebSocket is valid from open to close, no errors. */
	var ?open: (ws: WebSocket) -> Void;
	/** Handler for a WebSocket message. Messages are given as ArrayBuffer no matter if they are binary or not. Given ArrayBuffer is valid during the lifetime of this callback (until first await or return) and will be neutered. */
	var ?message: (ws: WebSocket, message: ArrayBuffer, isBinary: Bool) -> Void;
	/** Handler for when WebSocket backpressure drains. Check ws.getBufferedAmount(). Use this to guide / drive your backpressure throttling. */
	var ?drain: (ws: WebSocket) -> Void;
	/** Handler for close event, no matter if error, timeout or graceful close. You may not use WebSocket after this event. Do not send on this WebSocket from within here, it is closed. */
	var ?close: (ws: WebSocket, code: Int, message: ArrayBuffer) -> Void;
	/** Handler for received ping control message. You do not need to handle this, pong messages are automatically sent as per the standard. */
	var ?ping: (ws: WebSocket) -> Void;
	/** Handler for received pong control message. */
	var ?pong: (ws: WebSocket) -> Void;
}