package uwebsockets.js;

import js.lib.ArrayBuffer;

/** A WebSocket connection that is valid from open to close event.
 * Read more about this in the user manual.
 * Arbitrary user data may be attached to this object
*/ 
extern class WebSocket implements Dynamic<Dynamic>
{
	/** Sends a message. Make sure to check getBufferedAmount() before sending. Returns true for success, false for built up backpressure that will drain when time is given.
	 * Returning false does not mean nothing was sent, it only means backpressure was built up. This you can check by calling getBufferedAmount() afterwards.
	 *
	 * Make sure you properly understand the contept of backpressure. Check the backpressure example file.
	 */
	function send(message: RecognizedString, ?isBinary: Bool, ?compress: Bool): Bool;

	/** Returns the bytes buffered in backpressure. This is similar to the bufferedAmount property in the browser counterpart.
	 * Check backpressure example.
	 */
	function getBufferedAmount() : Int;

	/** Gracefully closes this WebSocket. Immediately calls the close handler.
	 * A WebSocket close message is sent with code and shortMessage.
	 */
	function end(?code: Int, ?shortMessage: RecognizedString): WebSocket;

	/** Forcefully closes this WebSocket. Immediately calls the close handler.
	 * No WebSocket close message is sent.
	 */
	function close(): WebSocket;

	/** Sends a ping control message. Returns true on success in similar ways as WebSocket.send does (regarding backpressure). This helper function correlates to WebSocket::send(message, uWS::OpCode::PING, ...) in C++. */
	function ping(?message: RecognizedString): Bool;

	/** Subscribe to a topic in MQTT syntax.
	 * 
	 * MQTT syntax includes things like "root/child/+/grandchild" where "+" is a
	 * wildcard and "root/#" where "#" is a terminating wildcard.
	 * 
	 * Read more about MQTT.
	*/
	function subscribe(topic: RecognizedString): WebSocket;

	/** Unsubscribe from a topic. Returns true on success, if the WebSocket was subscribed. */
	function unsubscribe(topic: RecognizedString): Bool;

	/** Unsubscribe from all topics. This is called automatically before any close handler is called, so you never need to call this manually in the close handler of a WebSocket. */
	function unsubscribeAll(): Void;

	/** Publish a message to a topic in MQTT syntax. You cannot publish using wildcards, only fully specified topics. Just like with MQTT.
	 *
	 * "parent/child" kind of tree is allowed, but not "parent/#" kind of wildcard publishing.
	 *
	 * The pub/sub system does not guarantee order between what you manually send using WebSocket.send
	 * and what you publish using WebSocket.publish. WebSocket messages are perfectly atomic, but the order in which they appear can get scrambled if you mix the two sending functions on the same socket.
	 * This shouldn't matter in most applications. Order is guaranteed relative to other calls to WebSocket.publish.
	 * 
	 * Also keep in mind that backpressure will be automatically managed with pub/sub, meaning some outgoing messages may be dropped if backpressure is greater than specified maxBackpressure.
	*/
	function publish(topic: RecognizedString, message: RecognizedString, ?isBinary: Bool, ?compress: Bool): WebSocket;

	/** See HttpResponse.cork. Takes a function in which the socket is corked (packing many sends into one single syscall/SSL block) */
	function cork(cb: () -> Void): Void;

	/** Returns the remote IP address. Note that the returned IP is binary, not text.
	 *
	 * IPv4 is 4 byte long and can be converted to text by printing every byte as a digit between 0 and 255.
	 * IPv6 is 16 byte long and can be converted to text in similar ways, but you typically print digits in HEX.
	 *
	 * See getRemoteAddressAsText() for a text version.
	 */
	function getRemoteAddress(): ArrayBuffer;

	/** Returns the remote IP address as text. See RecognizedString. */
	function getRemoteAddressAsText(): ArrayBuffer;
}