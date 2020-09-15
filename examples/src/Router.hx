package;

import uwebsockets.js.UWebSockets;

class Router 
{
	static function main() 
	{
		final port = 9001;
		UWebSockets.App({
			key_file_name: 'misc/key.pem',
			cert_file_name: 'misc/cert.pem',
			passphrase: '1234'
		}).any('/anything', (res, req) -> {
			res.end('Any route with method: ' + req.getMethod());
		}).get('/user/agent', (res, req) -> {
			res.end('Your user agent is: ' + req.getHeader('user-agent') + ' thank you, come again!');
		}).get('/static/yes', (res, req) -> {
			res.end('This is very static');
		}).get('/candy/:kind', (res, req) -> {
			/* Parameters */
			res.end('So you want candy? Have some ' + req.getParameter(0) + '!');
		}).get('/*', (res, req) -> {
			/* Wildcards - make sure to catch them last */
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
