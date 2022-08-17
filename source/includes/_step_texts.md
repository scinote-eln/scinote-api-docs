# Step step_texts

## Get step_texts

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "step_texts",
      "attributes": {
        "text":  "<p>Some text.</p>"
      }
    },
    {
      "id": "2",
      "type": "step_texts",
      "attributes": {
        "text": "<p>Some text.</p>"
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves step_texts from specific step.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/step_texts`
### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
PROTOCOL_ID     | The ID of the protocol to retrieve step from
STEP_ID         | The ID of the step to retrieve step_texts from

## Get Table

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts/1"
  -H "Authorization: Bearer qwerty123456..."

```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "step_texts",
    "attributes": {
      "text":  "{\"data\":[[\"1\",\"2\",\"3\"],[\"4\",\"5\",\"6\"]]}"
    }
  }
}
```

This endpoint retrieves specific table from the step.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/step_texts/<ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
PROTOCOL_ID     | The ID of the protocol to retrieve steps from
STEP_ID         | The ID of the step to retrieve table from
ID              | The ID of the table

## Create Table

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"data": {
		"type": "step_texts",
		"attributes": {
			"name": "New table",
			"text":  "{\"data\":[[\"1\",\"2\",\"3\"],[\"4\",\"5\",\"6\"]]}"
		}
	}
}'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "3",
    "type": "step_texts",
    "attributes": {
      "name": "New table",
      "text":  "{\"data\":[[\"1\",\"2\",\"3\"],[\"4\",\"5\",\"6\"]]}"
    }
  }
}
```

This endpoint creates new table in the step.

### HTTP Request

`POST https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
PROTOCOL_ID     | The ID of the protocol to retrieve steps from
STEP_ID         | The ID of the step to create table in

> Request body

```json
{
  "data": {
    "type": "step_texts",
    "attributes": {
      "name": "New table",
			"text":  "{\"data\":[[\"1\",\"2\",\"3\"],[\"4\",\"5\",\"6\"]]}"
    }
  }
}
```

### Table attributes

Attribute   | Mandatory| Description
---------   | -------- | -----------
name        | yes      | Name of the table
text    | no       | Serialized JSON representation of the table data


## Update Table

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "id": "1",
          "type": "step_texts",
          "attributes": {
            "text":  "<p>Some text.</p>"
          }
      }
  }'
```

> The above command returns JSON structured like this:

```json
{
    "data": {
      "id": "1",
      "type": "step_texts",
      "attributes": {
        "text":  "<p>Some text.</p>"
      }
    }
}
```

This endpoint updates existing table in the selected step.
If submitted attributes are the same and no changes are made for the table, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/step_texts/<ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
PROTOCOL_ID     | The ID of the protocol to retrieve steps from
STEP_ID         | The ID of the step to retrieve table from
ID              | The ID of the table

### Request body

```json
{
  "data": {
    "id": "1",
    "type": "step_texts",
    "attributes": {
      "text":  "<p>Some text.</p>"
    }
  }
}
```

### Table attributes

Attribute   | Mandatory| Description
----------- | -------- | -----------
name        | no      | Name of the table
text    | no       | Serialized JSON representation of the table data

## Delete Table

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific table from the step.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/step_texts/<ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
PROTOCOL_ID     | The ID of the protocol to retrieve steps from
STEP_ID         | The ID of the step to retrieve step_texts from
ID              | The ID of the table