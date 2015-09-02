var 
    node_static = require('node-static'),
    work_dir = process.env.WORKDIR || '/var/www',
    file_server = new node_static.Server(work_dir),
    port = process.env.PORT || 3000;

require('http').createServer(function(request, response) {
    request.addListener('end', function() {
        file_server.serve(request, response);
    }).resume();
}).listen(port, function() {
    console.log('Running node-static server on port: ' + port);
});
