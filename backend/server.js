// /home/abc/backend/server.js
const express = require('express');
const app = express();

// Use API_PORT from environment, default to 8080 (matching compose file)
const PORT = process.env.API_PORT || 8080; 

app.get('/', (req, res) => {
  res.json({
    status: 'OK',
    service: 'DevOps Backend API (Node.js)',
    message: 'Deployment check successful.',
    running_on_port: PORT
  });
});

// Endpoint used by the Docker Swarm healthcheck
app.get('/health', (req, res) => {
  res.status(200).send('healthy');
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Node.js API running on port ${PORT}`);
});
