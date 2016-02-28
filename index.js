var title = process.env.SHORTURL_TITLE;
process.env.NODE_ENV = "production";

require("@mrgalaxy/shorturl")({
	title: title,
	redis: {
		host: process.env.DB_PORT_6379_TCP_ADDR,
		port: process.env.DB_PORT_6379_TCP_PORT
	}
}).listen(80, function() {
	var addr = this.address();
	console.log("Short URL service%s listening at http://%s:%s", title ? " '" + title + "'" : "", addr.address, addr.port);
	console.log("Enter Ctrl-C to stop the server.");
}).on("error", function(e) {
	console.error(e.stack || e);
	process.exit(1);
});
