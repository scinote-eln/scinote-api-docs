# Result texts V2

## Get texts

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/texts"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "result_texts",
      "attributes": {
        "text": "<p>Some text.</p>"
      }
    },
    {
      "id": "2",
      "type": "result_texts",
      "attributes": {
        "text": "<p>Some text.</p>"
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/texts?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/texts?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/texts?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves texts from specific result.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<RESULT_ID>/texts(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                            |
| ------------- | -------------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                            |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                      |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                         |
| TASK_ID       | The ID of the task to retrieve protocol from                                           |
| RESULT_ID     | The ID of the result to retrieve texts from                                            |
| FROM          | If present will filter results' text, corresponding timestamp above or equals value    |
| TO            | If present will filter results' text, corresponding timestamp below or equals value    |

## Get result text

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/texts/1"
  -H "Authorization: Bearer qwerty123456..."

```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "result_texts",
    "attributes": {
      "text": "<p>Some text.</p>"
    }
  }
}
```

This endpoint retrieves specific text from the result.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<RESULT_ID>/texts/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| RESULT_ID     | The ID of the result to retrieve texts from       |
| ID            | The ID of the text                                |

## Create result text

```shell
curl -X POST \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/texts \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"data": {
		"type": "result_texts",
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
    "type": "result_texts",
    "attributes": {
      "text": "<p>Some text.</p>"
    }
  }
}
```

This endpoint creates new text in the result.

### HTTP Request

`POST https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |

> Request body

```json
{
  "data": {
    "type": "result_texts",
    "attributes": {
      "text": "<p>Some text.</p>"
    }
  }
}
```

### Result text attributes

| Attribute | Mandatory | Description                                 |
| --------- | --------- | ------------------------------------------- |
| text      | yes       | String representation of the text data      |

## Update result text

```shell
curl -X PATCH \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/texts/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "id": "1",
          "type": "result_texts",
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
    "type": "result_texts",
    "attributes": {
      "text": "<p>Some text.</p>"
    }
  }
}
```

This endpoint updates existing Text in the selected result.
If submitted attributes are the same and no changes are made for the text, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<RESULT_ID>/texts/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| RESULT_ID     | The ID of the result to retrieve texts from       |
| ID            | The ID of the text                                |

### Request body

```json
{
  "data": {
    "id": "1",
    "type": "result_texts",
    "attributes": {
      "text": "<p>Some text.</p>"
    }
  }
}
```

### Result text attributes

| Attribute | Mandatory | Description                                 |
| --------- | --------- | ------------------------------------------- |
| text      | yes       | String representation of the text data      |

## Delete result text

```shell
curl -X DELETE \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/texts/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific text from the result.

### HTTP Request

`DELETE https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<RESULT_ID>/texts/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| RESULT_ID     | The ID of the result to retrieve texts from       |
| ID            | The ID of the text                                |
