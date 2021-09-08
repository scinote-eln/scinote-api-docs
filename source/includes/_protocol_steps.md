# Protocol Steps

## Get Steps

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps"
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
        "description": "Description about step",
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
        "description": "Description about step",
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
        "description": "Description about step",
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
        "comments": {
            "data": []
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps?page%5Bnumber%5D=2&page%5Bsize%5D=10",
    "last": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps?page%5Bnumber%5D=4&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves steps from specific protocol. It also supports inclusion of these elements: tables, assets, checklists, checklists.checklist_items, comments.
Optional URL parameter 'render_rte=true' can be added in order to request rendering of RTE fields(embedded images, smart annotations).
If `?include=comments` PATH parameter is provided, step comments are also included.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps(?include=<INCLUDES>)`
### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
PROTOCOL_ID     | The ID of the protocol to retrieve steps from
INCLUDES | if set to `comments`, step comments are also included

## Get Step

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1"
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
      "description": "Description about step",
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
      "comments": {
          "data": []
      }
    }
  }
}
```

This endpoint retrieves specific step from the protocol. It also supports inclusion of these elements: tables, assets, checklists, checklists.checklist_items, comments.
Optional URL parameter 'render_rte=true' can be added in order to request rendering of RTE fields(embedded images, smart annotations).
If `?include=comments` PATH parameter is provided, step comments are also included.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<ID>(?include=<INCLUDES>)`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
PROTOCOL_ID     | The ID of the protocol to retrieve steps from
ID              | The ID of the step
INCLUDES | if set to `comments`, step comments are also included

## Create Step

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"data": {
		"type": "steps",
		"attributes": {
			"name": "Step name",
			"description": "Description about step"
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
      "description": "Description about step",
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
      "comments": {
          "data": []
      }
    }
  }
}
```

This endpoint creates new step in the protocol.

### HTTP Request

`POST https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
PROTOCOL_ID     | The ID of the protocol to retrieve steps from

> Request body

```json
{
  "data": {
    "type": "steps",
    "attributes": {
      "name": "Step name",
      "description": "Description about step"
    }
  }
}
```

### Step attributes

Attribute   | Mandatory| Description
---------   | -------- | -----------
name        | yes      | Name of the step
description | no       | Description of the step
completed   | no       | Step completion flag

## Update Step

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "id": "1",
          "type": "steps",
          "attributes": {
            "name": "Step 2",
            "description": "Step 2 description",
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
          "description": "Step 2 description",
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

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
PROTOCOL_ID     | The ID of the protocol to retrieve steps from
ID              | The ID of the step

### Request body

```json
{
  "data": {
    "id": "1",
    "type": "steps",
    "attributes": {
      "name": "Step 2",
      "description": "Step 2 description",
      "completed": true
    }
  }
}
```

### Step attributes

Attribute   | Mandatory| Description
----------- | -------- | -----------
name        | yes      | Name of the step
description | no       | Description of the step
completed   | no       | Step completion flag

## Delete Step

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific step from the protocol.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
PROTOCOL_ID     | The ID of the protocol to retrieve steps from
ID              | The ID of the step
