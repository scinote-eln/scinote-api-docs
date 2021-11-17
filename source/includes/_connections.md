# Connections

## Get connections

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/connections"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "connections",
      "relationships": {
        "from": {
          "data": {
            "id": "1",
            "type": "tasks"
          }
        },
        "to": {
          "data": {
            "id": "2",
            "type": "tasks"
          }
        }
      }
    },
    {
      "id": "2",
      "type": "connections",
      "relationships": {
        "from": {
          "data": {
            "id": "2",
            "type": "tasks"
          }
        },
        "to": {
          "data": {
            "id": "3",
            "type": "tasks"
          }
        }
      }
    }
  ],
  "links": {
    "self": "http://<server-name></server-name>/api/v1/teams/43/projects/399/experiments/1204/connections?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/43/projects/399/experiments/1204/connections?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/43/projects/399/experiments/1204/connections?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all connections from a specific experiment. Connection to/from can be included as relationships.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/connections(?include=<INCLUDES>)`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve project from
PROJECT_ID | The ID of the project to retrieve experiment from
EXPERIMENT_ID | The ID of the experiment to retrieve connections from
INCLUDES | if set to `to` and/or `from`, connection input or output tasks are also included

## Get connection

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/connections/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "connections",
    "relationships": {
      "from": {
        "data": {
          "id": "1",
          "type": "tasks"
        }
      },
      "to": {
        "data": {
          "id": "2",
          "type": "tasks"
        }
      }
    }
  }
}
```

This endpoint retrieves a specific connection from a specific experiment. Connection to/from can be included as relationships.
### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/connections/<connection_ID>(?include=<INCLUDES>)`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve project from
PROJECT_ID | The ID of the project to retrieve experiment from
EXPERIMENT_ID | The ID of the experiment to retrieve connection from.
connection_ID | The ID of the connection to retrieve
INCLUDES | if set to `to` and/or `from`, connection input or output tasks are also included


## Create connection

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/connections \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "type": "connections",
      "attributes": {
        "output_id": 1,
        "input_id": 2
      }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "7354",
    "type": "connections",
    "relationships": {
      "from": {
        "data": {
          "id": "1",
          "type": "tasks"
        }
      },
      "to": {
        "data": {
          "id": "2",
          "type": "tasks"
        }
      }
    }
  }
}

```

This endpoint creates new connection in the experiment.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/connections`

### URL Parameters

Parameter     | Description
------------- | -----------
TEAM_ID       | The ID of the team to retrieve projects from
PROJECT_ID    | The ID of the project to retrieve experiments from
EXPERIMENT_ID | The ID of the experiment

> Request body

```json
{
  "data": {
    "type": "connections",
    "attributes": {
      "output_id": 1,
      "input_id": 2
    }
  }
}
```

### Connection attributes

Attribute   | Mandatory | Description
----------- | --------- | -----------
output_id   | yes       | Output task id
input_id    | yes       | Input task id


## Delete connection

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/connections/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  }'
```

This endpoint deletes a specific connection from the experiment.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/connections/1`

### URL Parameters

Parameter     | Description
------------- | -----------
TEAM_ID       | The ID of the team to retrieve projects from
PROJECT_ID    | The ID of the project to retrieve experiments from
EXPERIMENT_ID | The ID of the experiment
