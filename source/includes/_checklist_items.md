# Step checklist items

## Get Checklist Items

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists/1/items"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "checklist_items",
      "attributes": {
        "text": "Item 1",
        "checked": false,
        "position": 0
      }
    },
    {
      "id": "2",
      "type": "checklist_items",
      "attributes": {
        "text": "Item 2",
        "checked": false,
        "position": 1
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists/1/item?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists/1/item?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists/1/items?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves items from the specific checklist.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/checklists/<CHECKLIST_ID>/items(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                          |
| ------------- | ------------------------------------------------------------------------------------ |
| TEAM_ID       | The ID of the team to retrieve project from                                          |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                    |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                       |
| TASK_ID       | The ID of the task to retrieve protocol from                                         |
| PROTOCOL_ID   | The ID of the protocol to retrieve step from                                         |
| STEP_ID       | The ID of the step to retrieve checklists from                                       |
| CHECKLIST_ID  | The ID of the checklist to retrieve items from                                       |
| FROM          | If present will filter checklist items corresponding timestamp above or equals value |
| TO            | If present will filter checklist items corresponding timestamp below or equals value |

## Get Checklist Item

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists/1/items/1"
  -H "Authorization: Bearer qwerty123456..."

```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "checklist_items",
    "attributes": {
      "text": "Item 1",
      "checked": false,
      "position": 0
    }
  }
}
```

This endpoint retrieves specific item from the checklist.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/checklists/<CHECKLIST_ID>/items/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve checklist from     |
| CHECKLIST_ID  | The ID of the checklist to retrieve item from     |
| ID            | The ID of the checklist                           |

## Create Checklist Item

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists/1/items \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"data": {
		"type": "checklist_items",
		"attributes": {
      "text": "Item 3",
      "checked": false,
      "position": 2
		}
	}
}'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "3",
    "type": "checklist_items",
    "attributes": {
      "text": "Item 3",
      "checked": false,
      "position": 2
    }
  }
}
```

This endpoint creates new item in the checklist.

### HTTP Request

`POST https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists/1/items`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve checklist from     |
| CHECKLIST_ID  | The ID of the checklist to create item in         |

> Request body

```json
{
  "data": {
    "type": "checklist_items",
    "attributes": {
      "text": "Item 3",
      "checked": false,
      "position": 2
    }
  }
}
```

### Checklist item attributes

| Attribute | Mandatory | Description                           |
| --------- | --------- | ------------------------------------- |
| text      | yes       | Label text of the item                |
| checked   | no        | Item checked or unchecked             |
| position  | no        | Position of the item in the checklist |

## Update Checklist Item

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "id": "1",
          "type": "checklist_items",
          "attributes": {
            "text": "Item 2",
            "checked": true
          }
      }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "checklist_items",
    "attributes": {
      "text": "Item 2",
      "checked": true,
      "position": 0
    }
  }
}
```

This endpoint updates existing item in the selected checklist.
If submitted attributes are the same and no changes are made for the item, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/checklists/<CHECKLIST_ID>/items/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve checklist from     |
| CHECKLIST_ID  | The ID of the checklist to retrieve item from     |
| ID            | The ID of the checklist                           |

### Request body

```json
{
  "data": {
    "id": "1",
    "type": "checklist_items",
    "attributes": {
      "text": "Item 2",
      "checked": true
    }
  }
}
```

### Checklist item attributes

| Attribute | Mandatory | Description                           |
| --------- | --------- | ------------------------------------- |
| text      | no        | Label text of the item                |
| checked   | no        | Item checked or unchecked             |
| position  | no        | Position of the item in the checklist |

## Delete Checklist Item

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/checklists/1/items/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific item from the checklist.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/checklists/<CHECKLIST_ID>/items/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve checklists from    |
| CHECKLIST_ID  | The ID of the checklist to retrieve items from    |
| ID            | The ID of the checklist item                      |
