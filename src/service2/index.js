import { createServer } from 'http';

const server = createServer(handleRequests);

const port = process.env.SERVER1_PORT || 5002;
server.listen(port, () => console.log('Listing port ' + port));

function handleRequests(req, res) {

    res.end(JSON.stringify({
        message: 'Server 2 ON'
    }));
}