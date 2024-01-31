# Step texts

## Get step texts

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts"
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
        "text": "<p>Some text.</p>",
        "position": 0
      }
    },
    {
      "id": "2",
      "type": "step_texts",
      "attributes": {
        "text": "<p>Some text.</p>",
        "position": 1
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves step_texts from specific step.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/step_texts(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                            |
| ------------- | -------------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                            |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                      |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                         |
| TASK_ID       | The ID of the task to retrieve protocol from                                           |
| PROTOCOL_ID   | The ID of the protocol to retrieve step from                                           |
| STEP_ID       | The ID of the step to retrieve step_texts from                                         |
| FROM          | If present will filter steps' step_text, corresponding timestamp above or equals value |
| TO            | If present will filter steps' step_text, corresponding timestamp below or equals value |

## Get step_text

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts/1"
  -H "Authorization: Bearer qwerty123456..."

```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "step_texts",
    "attributes": {
      "text": "<p>Some text.</p>",
      "position": 0
    }
  }
}
```

This endpoint retrieves specific step_text from the step.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/step_texts/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve step_text from     |
| ID            | The ID of the step_text                           |

## Create step_text

```shell
curl -X POST \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"data": {
		"type": "step_texts",
		"attributes": {
			"text": "<p>Some text.</p>"
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
      "text": "<p>Some text.</p>",
      "position": 0
    }
  }
}
```

This endpoint creates new step_text in the step.

### HTTP Request

`POST https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to create step_text in         |

> Request body

```json
{
  "data": {
    "type": "step_texts",
    "attributes": {
      "text": "<p>Some text.</p>"
    }
  }
}
```

### Step_text attributes

| Attribute | Mandatory | Description                                 |
| --------- | --------- | ------------------------------------------- |
| text      | yes       | String representation of the step_text data |

## Update step_text

```shell
curl -X PATCH \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts/1 \
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
      "text": "<p>Some text.</p>",
      "position": 0
    }
  }
}
```

This endpoint updates existing step_Text in the selected step.
If submitted attributes are the same and no changes are made for the step_text, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/step_texts/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve step_text from     |
| ID            | The ID of the step_text                           |

### Request body

```json
{
  "data": {
    "id": "1",
    "type": "step_texts",
    "attributes": {
      "text": "<p>Some text.</p>"
    }
  }
}
```

### Step_text attributes

| Attribute | Mandatory | Description                                 |
| --------- | --------- | ------------------------------------------- |
| text      | yes       | String representation of the step_text data |

## Delete step_text

```shell
curl -X DELETE \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/step_texts/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific step_text from the step.

### HTTP Request

`DELETE https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/step_texts/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve step_texts from    |
| ID            | The ID of the step_text                           |
