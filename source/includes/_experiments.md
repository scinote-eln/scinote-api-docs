# Experiments

## Get Experiments

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments"
  -H "Authorization: Bearer qwerty123456..."
```
> The above command returns JSON structured like this:

```json
{
  "data":[
    {
      "id": "1",
      "type": "experiments",
      "attributes":{
        "name": "My first experiment",
        "description": "This is my very first experiment",
        "archived": false
      }
    }
  ],
  "links":{
    "self": "http://<server-name>/api/v1/teams/1/projects/1/experiments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/1/experiments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/projects/1/experiments?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all experiments from the specified project.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments(?filter%5Barchived%5D=<ARCHIVED>)`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve project from
PROJECT_ID | The ID of the project to retrieve experiments from
ARCHIVED | If set to `true` return only archived experiments. If set to `false` return only active experiments.

## Get Experiment

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data":{
    "id": "1",
    "type": "experiments",
    "attributes":{
      "name": "My first experiment",
      "description": "This is my very first experiment",
      "archived": false
    }
  }
}
```

This endpoint retrieves a specific experiment from the specified project.

### HTTP Request

`GET http://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve project from
PROJECT_ID | The ID of the project to retrieve experiment from
EXPERIMENT_ID | The ID of the experiment to retrieve

## Create Experiment

```shell
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
```

> The above command returns JSON structured like this:
```json
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
```

This endpoint creates a new experiment in the team. Please note that we will create the user assignments for this experiment asynchronous.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments`

### URL Parameters

Parameter     | Description
------------- | -----------
TEAM_ID       | The ID of the team to retrieve projects from
PROJECT_ID    | The ID of the project to retrieve experiment from

> Request body
```json
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
```

### Experiment attributes

Attribute   | Mandatory | Description
----------- | --------- | -----------
name        | yes       | Name of the experiment
description | no        | Description of the experiment
archived    | no        | Archived flag

## Update Experiment

```shell
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
```

> The above command returns JSON structured like this:
```json
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
```

This endpoint updates existing experiment in the selected project.
If submitted attributes are the same and no changes are made for the experiment, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
ID              | The ID of the experiment

### Request body

```json
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
```

### Experiment attributes

Attribute   | Mandatory | Description
----------- | --------- | -----------
name        | yes       | Name of the experiment
description | no        | Description of the experiment
archived    | no        | Archived flag
