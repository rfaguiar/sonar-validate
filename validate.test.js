const sonarValidate = require('./validate');

test(`sonar quality gates analize ${process.env.SONAR_URL}/dashboard?id=${process.env.SONAR_PROJECT_KEY}`, async () => {
  const data = await sonarValidate();
  expect(data).toBe('OK');
});
