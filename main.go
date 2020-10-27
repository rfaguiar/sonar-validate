package main

import (
	"encoding/base64"
	"encoding/json"
	"log"
	"net/http"
	"os"
)

func main() {
	log.Print("Sonar Validation running")

	envSonarURL, _ := os.LookupEnv("SONAR_URL")
	envSonarLogin, _ := os.LookupEnv("SONAR_LOGIN")
	envSonarProjectKey, _ := os.LookupEnv("SONAR_PROJECT_KEY")
	sonarEndPoint := envSonarURL + "/api/qualitygates/project_status"
	authB64 := base64.StdEncoding.EncodeToString([]byte(envSonarLogin + ":"))

	log.Print("sonar quality gates analize " + envSonarURL + "/dashboard?id=" + envSonarProjectKey)

	req, _ := http.NewRequest("GET", sonarEndPoint, nil)
	q := req.URL.Query()

	q.Add("projectKey", envSonarProjectKey)
	req.URL.RawQuery = q.Encode()

	basicAuth := "Basic " + authB64
	req.Header.Add("Authorization", basicAuth)

	client := &http.Client{}

	resp, err := client.Do(req)
	if err != nil {
		log.Print("Error")
		log.Fatalf(err.Error())
	}
	defer resp.Body.Close()

	if resp.StatusCode == http.StatusOK {
		log.Print("Success")
		log.Print(resp.StatusCode)
		var info Quality
		encoder := json.NewDecoder(resp.Body)
		encoder.Decode(&info)
		printJsonPretty(info)

		if info.ProjectStatus.Status != "OK" {
			os.Exit(1)
		}
	} else {
		log.Print("invalid")
		log.Print(resp.StatusCode)
	}
	log.Print("Sonar Validation finish")
}

func printJsonPretty(info Quality) {
	empJSON, _ := json.Marshal(info)
	empJSON, _ = json.MarshalIndent(info, "", "  ")
	log.Print(string(empJSON))
}

type Quality struct {
	ProjectStatus ProjectStatus `json:"projectStatus"`
}

type ProjectStatus struct {
	Status     string       `json:"status"`
	Conditions []Conditions `json:"conditions"`
}

type Conditions struct {
	Status    string `json:"status"`
	MetricKey string `json:"metricKey"`
}
