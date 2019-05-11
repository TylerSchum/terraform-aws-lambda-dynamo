const AWS = require('aws-sdk');
const docClient = new AWS.DynamoDB.DocumentClient({region: 'us-east-1'});
const axios = require('axios');
const apiKey = process.env.APIKEY;
const zipCode = process.env.ZIP_CODE

function chunk(arr, length) {
  const chunks = [];
  let i = 0;
  while (i < arr.length) {
    chunks.push(arr.slice(i, i += length));
  }
  return chunks;
}

async function getWeather(zipCode, apiKey) {
  const baseUrl = 'https://api.openweathermap.org/data/2.5/forecast?';
  let weatherData;
  try {
    weatherData = (await axios.get(`${baseUrl}zip=${zipCode}&APPID=${apiKey}`)).data;
  } catch (e) {
    console.error("Unable to fetch weather: ", JSON.stringify(e, null, 2));
  }
  return weatherData.list;
}

function createParams(weatherArray) {
  const formattedItems = weatherArray.map(weather => {
    return {
      PutRequest: {
        Item: weather
      }
    }
  });
  return {
    RequestItems: {
      Weather: formattedItems
    }
  }
}

function insertWeather(params) {
  return new Promise((resolve, reject) => {
    docClient.batchWrite(params, (err, data) => {
      if (err) {
        console.error(JSON.stringify(err, null, 2))
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

exports.handler = async (event, context) => {
  console.log('processing: ', event);
  const weatherForecast = await getWeather(zipCode, apiKey);
  const forecastChunks = chunk(weatherForecast, 25);
  for (const forecast of forecastChunks) {
    const formattedItem = createParams(forecast);
    let result;
    try {
      result = await insertWeather(formattedItem);
    } catch (e) {
      console.error("Unable to add/update item. ERR: ", JSON.stringify(e, null, 2));
      context.fail(e);
    }
    console.log("Added/Updated: ", JSON.stringify(result, null, 2));
  }
}
