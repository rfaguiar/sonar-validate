const sonarValidate = require('./index');

test('sonar quality gates analize', async () => {
  const data = await sonarValidate();
  expect(data).toBe('OK');
});
