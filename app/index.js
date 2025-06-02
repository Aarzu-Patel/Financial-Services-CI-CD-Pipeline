
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.post('/loan-check', (req, res) => {
  const { income, creditScore } = req.body;
  if (income > 30000 && creditScore > 600) {
    return res.status(200).json({ eligible: true });
  } else {
    return res.status(200).json({ eligible: false });
  }
});

app.listen(PORT, () => {
  console.log(`Financial service running on port ${PORT}`);
});
