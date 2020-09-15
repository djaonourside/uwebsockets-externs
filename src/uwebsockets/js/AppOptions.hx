package uwebsockets.js;

/** Options used when constructing an app. Especially for SSLApp.
 * These are options passed directly to uSockets, C layer.
 */
extern typedef AppOptions =
{
	var ?key_file_name: RecognizedString;
    var ?cert_file_name: RecognizedString;
    var ?passphrase: RecognizedString;
    var ?dh_params_file_name: RecognizedString;
    /** This translates to SSL_MODE_RELEASE_BUFFERS */
    var ?ssl_prefer_low_memory_usage: Bool;
}