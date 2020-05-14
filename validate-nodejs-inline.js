const axios = require('axios');

const SONAR_URL = process.env.SONAR_URL;
const SONAR_ENDPOINT = `${SONAR_URL}/api/qualitygates/project_status`;
const SONAR_PROJECT_KEY = process.env.SONAR_PROJECT_KEY;
const SONAR_LOGIN = process.env.SONAR_LOGIN;

const auth = Buffer.from(`${SONAR_LOGIN}:`).toString('base64');
const authorization = `Basic ${auth}`;

try {
    console.log(`sonar quality gates analize ${process.env.SONAR_URL}/dashboard?id=${process.env.SONAR_PROJECT_KEY}`)
    axios.get(SONAR_ENDPOINT, {
        params: {
            projectKey: SONAR_PROJECT_KEY
        },
        headers: {
            'Authorization': authorization
        }
    }).then((resp => {
        if(resp &&
            resp.data &&
            resp.data.projectStatus.status &&
            resp.data.projectStatus.status != 'OK') {
            console.error(resp.data.projectStatus);
            process.exit(1);
        } else {
            console.log(resp.data.projectStatus);
        }
    })).catch(err => {
        console.error(err.message);
        process.exit(1);
    });
} catch (e) {
    console.error(e.message);
    process.exit(1);
}