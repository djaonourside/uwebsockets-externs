package;

import uwebsockets.js.UWebSockets;

class HelloWorld 
{
	static function main() 
	{
		final port = 9001;
		UWebSockets.App({
			key_file_name: 'misc/key.pem',
  			cert_file_name: 'misc/cert.pem',
  			passphrase: '1234'
		}).get('/*', (res, req) -> {
			res.end('Hello World!');
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

