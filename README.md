# Haxe externs for uWebSockets/uWebSockets.js

[µWebSockets](https://github.com/uNetworking/uWebSockets) is a simple to use yet thoroughly optimized implementation of HTTP and WebSockets. It is fast enough to do encrypted TLS 1.3 messaging quicker than most alternative servers can do even unencrypted, cleartext messaging.

[µWebSockets.js](https://github.com/uNetworking/uWebSockets.js) is a C++ implementation of the Http/WebSocket protocols for Node.js. It is a faster Express.js/Socket.IO/any JavaScript implementation.

The project is externs of it for a strictly-typed multi-target programming language [haxe](https://haxe.org/). Now js target externs are only implemented falling back into µWebSockets.js. Any help in cpp and hashlink externs implementation is appreciated.

## Installation

1. install `node.js` >= 10
2. install `haxe` >= 4
3. install `hxnodejs`:
```
haxelib install hxnodejs
```
4. install `uwebsockets`:
```
haxelib install uwebsockets
```
5. install npm dependency of the necessary uWebSockets.js version. Externs correspond at least to 18.5.0 version of uWebSockets.js
```
npm install uNetworking/uWebSockets.js#v18.5.0
```
## Usage 

```haxe
import uwebsockets.js.UWebSockets;

class Example 
{
	static function main() 
	{
		UWebSockets.SSLApp({
			key_file_name: 'misc/key.pem',
			cert_file_name: 'misc/cert.pem',
		}).ws('/*', {
			idleTimeout: 30,
			maxBackpressure: 1024,
			maxPayloadLength: 512,
			compression: UWebSockets.DEDICATED_COMPRESSOR_3KB,
			/* For brevity we skip the other events (upgrade, open, ping, pong, close) */
			message: (ws, data, isBinary) -> {
			/* You can do app.publish('sensors/home/temperature', '22C') kind of pub/sub as well */

			/* Here we echo the message back, using compression if available */
				final ok = ws.send(data, isBinary);
			}
		}).get('/*', (res, req) -> { 
			/* It does Http as well */
			res.writeStatus('200 OK').writeHeader('IsExample', 'Yes').end('Hello there!');
		}).listen(9001, (listenSocket) -> {
			if (listenSocket) 
			{
				trace('Listening to port 9001');
			} 
		});
	}
}
```
### Install examples dependencies
```
npm install
```
### Compile examples 
```
npm run compile:examples
```
or 
```
haxe build-examples.hxml
```
### Run an example
```
node examples/bin/HelloWorld.js
```
