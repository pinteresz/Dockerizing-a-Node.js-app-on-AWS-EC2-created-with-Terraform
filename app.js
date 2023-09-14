const express = require('express');
const app = express();

const port = 3000;

// Respond with "Hello, DevOps!" at the root endpoint
app.get('/', (req, res) => {
  res.send('Hello, DevOps!');
});


app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});

