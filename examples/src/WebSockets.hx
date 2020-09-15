package;

import js.node.Buffer;
import uwebsockets.js.UWebSockets;

class WebSockets 
{
	static function main() 
	{
		final port = 9001;
		UWebSockets.App({
			key_file_name: 'misc/key.pem',
			cert_file_name: 'misc/cert.pem',
			passphrase: '1234'
		}).ws('/*', {
			compression: UWebSockets.SHARED_COMPRESSOR,
			maxPayloadLength: 16 * 1024 * 1024,
			open: (ws) -> {
				trace('A WebSocket connected!');
			},
			message: (ws, data, isBinary) -> {
				final msgStr = Buffer.from(data).toString();
				trace("Message recieved", msgStr);
				/* Ok is false if backpressure was built up, wait for drain */
				final ok = ws.send(data, isBinary);
			},
			drain: (ws) -> {
				trace('WebSocket backpressure: ' + ws.getBufferedAmount());
			},
			close: (ws, code, message) -> {
				trace('WebSocket closed');
			}
		}).any('/*', (res, req) -> { 
			res.end('Nothing to see here!');
		}).listen(port, (listenSocket) -> {
			if (listenSocket) 
			{
				trace('Listening to port ' + port);
			} 
			else 
			{
				trace('Failed to listen to port ' + port);
			}
		});
	}
}

