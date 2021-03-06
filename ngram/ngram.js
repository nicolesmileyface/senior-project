const fetch = require('node-fetch');

const regexp = /var data = (.*);/;

async function fetchNgram(phrases) {
  console.log("ngram(", phrases, ")");
  const params = new URLSearchParams();
  params.set('content', phrases.join(','));
  params.set('year_start', '1800');
  params.set('year_end', '2000');
  params.set('corpus', '15');  // English
  params.set('smoothing', '0');
  const response = await fetch('https://books.google.com/ngrams/graph?' + params.toString());
  const responseText = await response.text();
  const match = regexp.exec(responseText);
  const json = match[1];
  return JSON.parse(json); 
}

module.exports = { fetchNgram };
