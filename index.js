const axios = require('axios');

const sonarValidate = async () => {
  const SONAR_URL = process.env.SONAR_URL;
  const SONAR_ENDPOINT = `${SONAR_URL}/api/qualitygates/project_status`;
  const SONAR_PROJECT_KEY = process.env.SONAR_PROJECT_KEY;
  const SONAR_LOGIN = process.env.SONAR_LOGIN;

  console.log(SONAR_URL);
  console.log(SONAR_PROJECT_KEY);
  console.log(SONAR_LOGIN);

  const auth = Buffer.from(`${SONAR_LOGIN}:`).toString('base64');
  const authorization = `Basic ${auth}`;

  try {
    const prom = await axios.get(SONAR_ENDPOINT, {
      params: {
        projectKey: SONAR_PROJECT_KEY
      },
      headers: {
        'Authorization': authorization
      }
    });
    return prom.data.projectStatus.status;
  } catch (e) {
    return e.toJSON().message;
  }
};

module.exports = sonarValidate;