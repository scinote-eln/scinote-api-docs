# Protocol Steps V2

## Get Steps

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "4196",
      "type": "steps",
      "attributes": {
        "name": "Step name",
        "position": 32,
        "completed": true,
        "completed_on": "2019-09-16T13:47:22.069Z"
      },
      "relationships": {
        "protocol": {
          "data": {
            "id": "1",
            "type": "protocols"
          }
        },
        "assets": {
          "data": []
        },
        "checklists": {
          "data": []
        },
        "tables": {
          "data": []
        },
        "step_texts": {
          "data": []
        },
        "comments": {
          "data": []
        }
      }
    },
    {
      "id": "4195",
      "type": "steps",
      "attributes": {
        "name": "Step name",
        "position": 31,
        "completed": false
      },
      "relationships": {
        "protocol": {
          "data": {
            "id": "1",
            "type": "protocols"
          }
        },
        "assets": {
          "data": []
        },
        "checklists": {
          "data": []
        },
        "tables": {
          "data": []
        },
        "step_texts": {
          "data": []
        },
        "comments": {
          "data": []
        }
      }
    },
    {
      "id": "4194",
      "type": "steps",
      "attributes": {
        "name": "Step name",
        "position": 30,
        "completed": false
      },
      "relationships": {
        "protocol": {
          "data": {
            "id": "1",
            "type": "protocols"
          }
        },
        "assets": {
          "data": []
        },
        "checklists": {
          "data": []
        },
        "tables": {
          "data": []
        },
        "step_texts": {
          "data": []
        },
        "comments": {
          "data": []
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps?page%5Bnumber%5D=2&page%5Bsize%5D=10",
    "last": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps?page%5Bnumber%5D=4&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves steps from specific protocol. It also supports inclusion of these elements: tables, step_texts, assets, checklists, checklists.checklist_items, comments.
Optional URL parameter 'render_rte=true' can be added in order to request rendering of RTE fields(embedded images, smart annotations).
If `?include=comments` PATH parameter is provided, step comments are also included.


### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps(?include=<INCLUDES>&filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                         |
| ------------- | ----------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                         |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                   |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                      |
| TASK_ID       | The ID of the task to retrieve protocol from                                        |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from                                       |
| INCLUDES      | if set to `comments`, step comments are also included                               |
| FROM          | If present will filter protocol steps corresponding timestamp above or equals value |
| TO            | If present will filter protocol steps corresponding timestamp below or equals value |

## Get Step

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1"
  -H "Authorization: Bearer qwerty123456..."

```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "steps",
    "attributes": {
      "name": "Step name",
      "position": 1,
      "completed": true,
      "completed_on": "2019-09-16T13:47:22.069Z"
    },
    "relationships": {
      "protocol": {
        "data": {
          "id": "1",
          "type": "protocols"
        }
      },
      "assets": {
        "data": []
      },
      "checklists": {
        "data": []
      },
      "tables": {
        "data": []
      },
      "step_texts": {
        "data": []
      },
      "comments": {
        "data": []
      }
    }
  }
}
```

This endpoint retrieves specific step from the protocol. It also supports inclusion of these elements: tables, step_texts, assets, checklists, checklists.checklist_items, comments.
Optional URL parameter 'render_rte=true' can be added in order to request rendering of RTE fields(embedded images, smart annotations).
If `?include=comments` PATH parameter is provided, step comments are also included.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<ID>(?include=<INCLUDES>)`

### URL Parameters

| Parameter     | Description                                           |
| ------------- | ----------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from           |
| PROJECT_ID    | The ID of the project to retrieve experiment from     |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from        |
| TASK_ID       | The ID of the task to retrieve protocol from          |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from         |
| ID            | The ID of the step                                    |
| INCLUDES      | if set to `comments`, step comments are also included |

## Create Step

```shell
curl -X POST \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"data": {
		"type": "steps",
		"attributes": {
			"name": "Step name"
		}
	}
}'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "steps",
    "attributes": {
      "name": "Step name",
      "position": 1,
      "completed": false
    },
    "relationships": {
      "protocol": {
        "data": {
          "id": "1",
          "type": "protocols"
        }
      },
      "assets": {
        "data": []
      },
      "checklists": {
        "data": []
      },
      "tables": {
        "data": []
      },
      "step_texts": {
        "data": []
      },
      "comments": {
        "data": []
      }
    }
  }
}
```

This endpoint creates new step in the protocol.

### HTTP Request

`POST https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |

> Request body

```json
{
  "data": {
    "type": "steps",
    "attributes": {
      "name": "Step name"
    }
  }
}
```

### Step attributes

| Attribute   | Mandatory | Description             |
| ----------- | --------- | ----------------------- |
| name        | yes       | Name of the step        |
| completed   | no        | Step completion flag    |

## Update Step

```shell
curl -X PATCH \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "id": "1",
          "type": "steps",
          "attributes": {
            "name": "Step 2",
            "completed": true
          }
      }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "steps",
    "attributes": {
      "name": "Step 2",
      "position": 1,
      "completed": true,
      "completed_on": "2020-07-06T10:00:18.866Z"
    },
    "relationships": {
      "protocol": {
        "data": {
          "id": "1",
          "type": "protocols"
        }
      },
      "assets": {
        "data": []
      },
      "checklists": {
        "data": []
      },
      "tables": {
        "data": []
      },
      "step_texts": {
        "data": []
      },
      "comments": {
        "data": []
      }
    }
  }
}
```

This endpoint updates existing step in the selected protocol.
If submitted attributes are the same and no changes are made for the step, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| ID            | The ID of the step                                |

### Request body

```json
{
  "data": {
    "id": "1",
    "type": "steps",
    "attributes": {
      "name": "Step 2",
      "completed": true
    }
  }
}
```

### Step attributes

| Attribute   | Mandatory | Description             |
| ----------- | --------- | ----------------------- |
| name        | yes       | Name of the step        |
| completed   | no        | Step completion flag    |

## Delete Step

```shell
curl -X DELETE \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific step from the protocol.

### HTTP Request

`DELETE https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| ID            | The ID of the step                                |

## Reorder step elements

```shell
curl -X POST \
  https://<server-name>/api/service/teams/1/steps/1/reorder_elements \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"step_element_order": [
		{ "id": 29570, "position": 0 },
		{ "id": 29290, "position": 1 }
	]
}'
```

### HTTP Request

`POST https://<server-name>/api/service/teams/1/steps/1/reorder_elements`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |

> Request body

```json
{
  "step_element_order": [
    { "id": 29570, "position": 0 },
    { "id": 29290, "position": 1 }
  ]
}
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "29290",
      "type": "step_orderable_elements",
      "attributes": {
        "position": 1,
        "element": {
          "id": 6854,
          "name": "Checklist 1",
          "created_at": "2022-05-12T11:58:58.163Z",
          "updated_at": "2022-05-12T11:58:58.163Z",
          "checklist_items": [
            {
              "id": 26930,
              "text": "one",
              "checked": true,
              "position": 1,
              "created_at": "2022-05-12T11:59:02.285Z",
              "updated_at": "2022-05-12T11:59:20.223Z"
            },
            {
              "id": 26931,
              "text": "two",
              "checked": true,
              "position": 2,
              "created_at": "2022-05-12T11:59:03.042Z",
              "updated_at": "2022-05-12T11:59:21.131Z"
            },
            {
              "id": 26929,
              "text": "three",
              "checked": false,
              "position": 3,
              "created_at": "2022-05-12T11:59:01.380Z",
              "updated_at": "2022-05-12T11:59:01.380Z"
            }
          ]
        }
      }
    },
    {
      "id": "29570",
      "type": "step_orderable_elements",
      "attributes": {
        "position": 0,
        "element": {
          "id": 19968,
          "text": "<div>Some text.</div>",
          "created_at": "2022-06-27T09:12:36.703Z",
          "updated_at": "2022-06-27T09:12:45.714Z"
        }
      }
    }
  ]
}
```

This endpoint is used for changing the order of step elements.

## Reorder steps

```shell
curl -X POST \
  https://<server-name>/api/service/teams/1/protocols/1/reorder_steps \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"step_order": [
		{ "id": 21803, "position": 1 },
		{ "id": 21802, "position": 0 },
		{ "id": 21801, "position": 2 }
	]
}'
```

### HTTP Request

`POST https://<server-name>/api/service/teams/1/protocols/1/reorder_steps`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |

> Request body

```json
{
  "step_order": [
    { "id": 21803, "position": 1 },
    { "id": 21802, "position": 0 },
    { "id": 21801, "position": 2 }
  ]
}
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "21802",
      "type": "steps",
      "attributes": {
        "name": "Step 2",
        "position": 0,
        "completed": false,
        "created_at": "2022-05-11T14:21:13.984Z",
        "updated_at": "2022-05-11T14:21:16.501Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "9",
            "type": "users"
          }
        },
        "protocol": {
          "data": {
            "id": "11200",
            "type": "protocols"
          }
        },
        "assets": {
          "data": []
        },
        "checklists": {
          "data": []
        },
        "tables": {
          "data": []
        },
        "step_texts": {
          "data": []
        },
        "comments": {
          "data": []
        },
        "step_elements": {
          "data": [
            {
              "id": "29289",
              "type": "step_orderable_elements"
            }
          ]
        }
      }
    },
    {
      "id": "21803",
      "type": "steps",
      "attributes": {
        "name": "Step 1",
        "position": 0,
        "completed": false,
        "created_at": "2022-05-11T14:21:13.984Z",
        "updated_at": "2022-05-11T14:21:16.501Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "9",
            "type": "users"
          }
        },
        "protocol": {
          "data": {
            "id": "11200",
            "type": "protocols"
          }
        },
        "assets": {
          "data": []
        },
        "checklists": {
          "data": []
        },
        "tables": {
          "data": []
        },
        "step_texts": {
          "data": []
        },
        "comments": {
          "data": []
        },
        "step_elements": {
          "data": [
            {
              "id": "29289",
              "type": "step_orderable_elements"
            }
          ]
        }
      }
    },
    {
      "id": "21801",
      "type": "steps",
      "attributes": {
        "name": "Step 3",
        "position": 0,
        "completed": false,
        "created_at": "2022-05-11T14:21:13.984Z",
        "updated_at": "2022-05-11T14:21:16.501Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "9",
            "type": "users"
          }
        },
        "protocol": {
          "data": {
            "id": "11200",
            "type": "protocols"
          }
        },
        "assets": {
          "data": []
        },
        "checklists": {
          "data": []
        },
        "tables": {
          "data": []
        },
        "step_texts": {
          "data": []
        },
        "comments": {
          "data": []
        },
        "step_elements": {
          "data": []
        }
      }
    }
  ]
}
```

This endpoint is used for changing the order of steps.
