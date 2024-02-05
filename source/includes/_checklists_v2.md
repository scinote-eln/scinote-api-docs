# Step checklists V2

## Get Checklists

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "checklists",
      "attributes": {
        "name": "Checklist 1",
        "position": 0
      },
      "relationships": {
        "checklist_items": {
          "data": []
        }
      }
    },
    {
      "id": "2",
      "type": "checklists",
      "attributes": {
        "name": "Checklist 2",
        "position": 1
      },
      "relationships": {
        "checklist_items": {
          "data": []
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves checklists from specific step. It also supports inclusion of these elements: checklist_items.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/checklists(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                     |
| ------------- | ------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                     |
| PROJECT_ID    | The ID of the project to retrieve experiment from                               |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                  |
| TASK_ID       | The ID of the task to retrieve protocol from                                    |
| PROTOCOL_ID   | The ID of the protocol to retrieve step from                                    |
| STEP_ID       | The ID of the step to retrieve checklists from                                  |
| FROM          | If present will filter checklists corresponding timestamp above or equals value |
| TO            | If present will filter checklists corresponding timestamp below or equals value |

## Get Checklist

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists/1"
  -H "Authorization: Bearer qwerty123456..."

```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "checklists",
    "attributes": {
      "name": "Checklist 1",
      "position": 0
    },
    "relationships": {
      "checklist_items": {
        "data": []
      }
    }
  }
}
```

This endpoint retrieves specific checklist from the step. It also supports inclusion of these elements: checklist_items.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/checklists/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve checklist from     |
| ID            | The ID of the checklist                           |

## Create Checklist

```shell
curl -X POST \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"data": {
		"type": "checklists",
		"attributes": {
			"name": "New checklist"
		}
	}
}'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "3",
    "type": "checklists",
    "attributes": {
      "name": "Checklist 3",
      "position": 0
    },
    "relationships": {
      "checklist_items": {
        "data": []
      }
    }
  }
}
```

This endpoint creates new checklist in the step.

### HTTP Request

`POST https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to create checklist in         |

> Request body

```json
{
  "data": {
    "type": "checklists",
    "attributes": {
      "name": "New checklist",
      "position": 0
    }
  }
}
```

### Checklist attributes

| Attribute | Mandatory | Description           |
| --------- | --------- | --------------------- |
| name      | yes       | Name of the checklist |

## Update Checklist

```shell
curl -X PATCH \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "id": "1",
          "type": "checklists",
          "attributes": {
            "name": "Checklist 2"
          }
      }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "checklists",
    "attributes": {
      "name": "Checklist 2",
      "position": 0
    }
  }
}
```

This endpoint updates existing checklist in the selected step.
If submitted attributes are the same and no changes are made for the checklist, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/checklists/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve checklist from     |
| ID            | The ID of the checklist                           |

### Request body

```json
{
  "data": {
    "id": "1",
    "type": "checklists",
    "attributes": {
      "name": "Checklist 2"
    }
  }
}
```

### Checklist attributes

| Attribute | Mandatory | Description           |
| --------- | --------- | --------------------- |
| name      | yes       | Name of the checklist |

## Delete Checklist

```shell
curl -X DELETE \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific checklist from the step.

### HTTP Request

`DELETE https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/checklists/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve checklists from    |
| ID            | The ID of the checklist                           |
