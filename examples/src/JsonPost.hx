package;

import haxe.Json;
import js.node.Buffer;
import uwebsockets.js.HttpResponse;
import uwebsockets.js.UWebSockets;

class JsonPost 
{
	static function main() 
	{
		final port = 9001;
		UWebSockets.App({
			key_file_name: 'misc/key.pem',
  			cert_file_name: 'misc/cert.pem',
  			passphrase: '1234'
		}).post('/*', (res, req) -> {
			/* Note that you cannot read from req after returning from here */
			final url = req.getUrl();
			/* Read the body until done or error */
  			readJson(res, (obj) -> {
   				trace('Posted to ' + url + ': ');
    			trace(obj);
			    res.end('Thanks for this json!');
 			}, () -> {
    			/* Request was prematurely aborted or invalid or missing, stop reading */
    			trace('Invalid JSON or no data at all!');
 			 });  
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

	static function readJson(res: HttpResponse, cb: (data: Dynamic) -> Void, errCb: () -> Void) 
	{
		var buffer: Buffer = null;
		/* Register data cb */
		res.onData((arrayBuffer, isLast) -> {
			var chunk = Buffer.from(arrayBuffer);
		 	if (isLast) 
			{
				var json: Dynamic;
				if (buffer != null) 
				{
					try 
					{
						json = Json.parse(Buffer.concat([buffer, chunk]).toString());
					} 
					catch (e: Dynamic) 
					{
						/* res.close calls onAborted */
						res.close();
						return;
					}
			  		cb(json);
				} 
				else 
				{
					try 
					{
						json = Json.parse(chunk.toString());
					} 
					catch (e: Dynamic) 
					{
						/* res.close calls onAborted */
						res.close();
						return;
					}
					cb(json);
				}
			} 
			else 
			{
				if (buffer != null) 
				{
					buffer = Buffer.concat([buffer, chunk]);
				} 
				else 
				{
					buffer = Buffer.concat([chunk]);
				}
			}
		});
	  
		/* Register error cb */
		res.onAborted(errCb);
	}
}

