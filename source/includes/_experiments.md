# Experiments

## Get Experiments

shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments"
  -H "Authorization: Bearer qwerty123456..."


> The above command returns JSON structured like this:

json
{
  "data": [
    {
      "id": "1",
      "type": "experiments",
      "attributes": {
        "name": "My first experiment",
        "description": "This is my very first experiment",
        "archived": false
      }
    }
  ],
  "links": {
    "self": "http://<server-name>/api/v1/teams/1/projects/1/experiments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/1/experiments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/projects/1/experiments?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}


This endpoint retrieves all experiments from the specified project.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments(?filter%5Barchived%5D=<ARCHIVED>&filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter  | Description                                                                                          |
| ---------- | ---------------------------------------------------------------------------------------------------- |
| TEAM_ID    | The ID of the team to retrieve project from                                                          |
| PROJECT_ID | The ID of the project to retrieve experiments from                                                   |
| ARCHIVED   | If set to `true` return only archived experiments. If set to `false` return only active experiments. |
| FROM       | If present will filter experiments corresponding timestamp above or equals value                     |
| TO         | If present will filter experiments corresponding timestamp below or equals value                     |

## Get Experiment

shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1"
  -H "Authorization: Bearer qwerty123456..."


> The above command returns JSON structured like this:

json
{
  "data": {
    "id": "1",
    "type": "experiments",
    "attributes": {
      "name": "My first experiment",
      "description": "This is my very first experiment",
      "archived": false
    }
  }
}


This endpoint retrieves a specific experiment from the specified project.

### HTTP Request

`GET http://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve              |

## Create Experiment

shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/experiments \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "type": "experiments",
      "attributes": {
        "name": "My experiment 1",
        "description": "This is my very first experiment",
        "archived": false
      }
    }
  }'


> The above command returns JSON structured like this:

json
{
  "data": {
    "id": "1",
    "type": "experiments",
    "attributes": {
      "name": "My first experiment",
      "description": "This is my very first experiment",
      "status": "completed",
      "due_date": "2025-11-11T13:25:53.910Z",
      "start_date": "2025-12-11",
      "started_at": "2025-12-11T13:25:53.910Z",
      "completed_at": "2025-12-17T13:25:53.910Z",
      "archived": false
    }
  }
}


This endpoint creates a new experiment in the team. Please note that we will create the user assignments for this experiment asynchronous.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments`

### URL Parameters

| Parameter  | Description                                       |
| ---------- | ------------------------------------------------- |
| TEAM_ID    | The ID of the team to retrieve projects from      |
| PROJECT_ID | The ID of the project to retrieve experiment from |

> Request body

json
{
  "data": {
    "type": "experiments",
    "attributes": {
      "name": "My first experiment",
      "description": "This is my very first experiment",
      "archived": false
    }
  }
}


### Experiment attributes

| Attribute   | Mandatory | Description                                            |
| ----------- | --------- | ------------------------------------------------------ |
| name        | yes       | Name of the experiment                                 |
| description | no        | Description of the experiment                          |
| archived    | no        | Archived flag                                          |
| status      | no        | Status of experiment (not_started, started, completed) |
| description | no        | Description of the experiment                          |
| due_date    | no        | Due date of experiment                                 |
| start_date  | no        | Planned start date of experiment                       |
| archived    | no        | Archived flag                                          |

## Update Experiment

shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "id": "1",
          "type": "experiments",
          "attributes": {
            "name": "Experiment 2",
            "description": "New description",
            "archived": true
          }
      }
  }'


> The above command returns JSON structured like this:

json
{
  "data": {
    "id": "1",
    "type": "experiments",
    "attributes": {
      "name": "Experiment 2",
      "description": "New description",
      "archived": true
    }
  }
}


This endpoint updates existing experiment in the selected project.
If submitted attributes are the same and no changes are made for the experiment, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<ID>`

### URL Parameters

| Parameter  | Description                                       |
| ---------- | ------------------------------------------------- |
| TEAM_ID    | The ID of the team to retrieve project from       |
| PROJECT_ID | The ID of the project to retrieve experiment from |
| ID         | The ID of the experiment                          |

### Request body
```json
{
  "data": {
    "id": "1",
    "type": "experiments",
    "attributes": {
      "name": "Experiment 2",
      "description": "New description",
      "archived": true,
      "metadata": {
        "status": "processing"
      }
    }
  }
}
```

### Experiment attributes

| Attribute   | Mandatory | Description                                               |
| ----------- | --------- | --------------------------------------------------------- |
| name        | yes       | Name of the experiment                                    |
| description | no        | Description of the experiment                             |
| archived    | no        | Archived flag                                             |
| status      | no        | Status of experiment (not_started, started, completed)    |
| description | no        | Description of the experiment                             |
| due_date    | no        | Due date of experiment                                    |
| start_date  | no        | Planned start date of experiment                          |
| archived    | no        | Archived flag                                             |
| matadata    | no        | A JSON format metadata object, for storing arbitrary data |

## Experiment Metadata

This API supports advanced filtering using metadata fields embedded in each experiment record. These metadata fields can be used as dynamic filters via the filter[metadata] parameter in the query string. Additionally, metadata can be explicitly returned in API responses by using the query parameter with-metadata=true.

### Filtering Experiments by Metadata

You can filter experiments using custom metadata key-value pairs by including them in the filter[metadata] query parameter. The value should be a JSON object encoded in the query string.

Note: All metadata keys and values must be strings.

### Example HTTP Request

Example filtering experiments where metadata contains key status with the value processin

`GET https://<server-name>/api/v1/teams/1/projects/1/experiments?filter[metadata][status]=processing`

You can also include multiple metadata key-value pair

`GET https://<server-name>/api/v1/teams/1/projects/1/experiments?filter[metadata][status]=processing&filter[metadata][external_id]=E1337`

This will return experiments where metadata includes both "status": "processing" and "external_id": "P1337".
Including Metadata in the Response
To include the metadata field in the JSON response, use the query parameter
`with-metadata=true`

### Combined Example

`GET https://<server-name>/api/v1/teams/1/projects/1/experiments?filter[metadata][priority]=high&with-metadata=true`

This will return all experiments that contain metadata with key priority set to high, and also include the metadata field in the experiment response.

If with-metadata is not set to true, metadata fields will not be shown in the response, even if data exists.
