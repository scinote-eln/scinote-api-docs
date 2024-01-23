# Task Results V2

## Get Results

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "4196",
      "type": "results",
      "attributes": {
        "name": "Result name",
        "archived": false
      },
      "relationships": {
        "assets": {
          "data": []
        },
        "tables": {
          "data": []
        },
        "result_texts": {
          "data": []
        },
        "comments": {
          "data": []
        }
      }
    },
    {
      "id": "4195",
      "type": "results",
      "attributes": {
        "name": "Result name",
        "archived": false
      },
      "relationships": {
        "assets": {
          "data": []
        },
        "tables": {
          "data": []
        },
        "result_texts": {
          "data": []
        },
        "comments": {
          "data": []
        }
      }
    },
    {
      "id": "4194",
      "type": "results",
      "attributes": {
        "name": "Result name",
        "archived": false
      },
      "relationships": {
        "assets": {
          "data": []
        },
        "tables": {
          "data": []
        },
        "result_texts": {
          "data": []
        },
        "comments": {
          "data": []
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results?page%5Bnumber%5D=2&page%5Bsize%5D=10",
    "last": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results?page%5Bnumber%5D=4&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves results from specific task. It also supports inclusion of these elements: tables, result_texts, assets, comments.
If `?include=comments` PATH parameter is provided, result comments are also included.


### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results(?include=<INCLUDES>&filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                       |
| ------------- | --------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team                                                                |
| PROJECT_ID    | The ID of the project                                                             |
| EXPERIMENT_ID | The ID of the experiment                                                          |
| TASK_ID       | The ID of the task                                                                |
| INCLUDES      | if set to `comments`, result comments are also included                           |
| FROM          | If present will filter task results corresponding timestamp above or equals value |
| TO            | If present will filter task results corresponding timestamp below or equals value |

## Get Result

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1"
  -H "Authorization: Bearer qwerty123456..."

```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "results",
    "attributes": {
      "name": "Result name",
      "archived": false
    },
    "relationships": {
      "assets": {
        "data": []
      },
      "tables": {
        "data": []
      },
      "result_texts": {
        "data": []
      },
      "comments": {
        "data": []
      }
    }
  }
}
```

This endpoint retrieves specific result from the task. It also supports inclusion of these elements: tables, result_texts, assets, comments.
If `?include=comments` PATH parameter is provided, result comments are also included.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<ID>(?include=<INCLUDES>)`

### URL Parameters

| Parameter     | Description                                             |
| ------------- | ------------------------------------------------------- |
| TEAM_ID       | The ID of the team                                      |
| PROJECT_ID    | The ID of the project                                   |
| EXPERIMENT_ID | The ID of the experiment                                |
| TASK_ID       | The ID of the task                                      |
| ID            | The ID of the result                                    |
| INCLUDES      | if set to `comments`, result comments are also included |


## Create Result

```shell
curl -X POST \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"data": {
		"type": "results",
		"attributes": {
			"name": "Result name"
		}
	}
}'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "results",
    "attributes": {
      "name": "Result name",
      "archived": false
    },
    "relationships": {
      "assets": {
        "data": []
      },
      "tables": {
        "data": []
      },
      "result_texts": {
        "data": []
      },
      "comments": {
        "data": []
      }
    }
  }
}
```

This endpoint creates new result in the task.

### HTTP Request

`POST https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve result from        |

> Request body

```json
{
  "data": {
    "type": "results",
    "attributes": {
      "name": "Result name"
    }
  }
}
```

### Result attributes

| Attribute   | Mandatory | Description             |
| ----------- | --------- | ----------------------- |
| name        | yes       | Name of the step        |

## Update Result

```shell
curl -X PATCH \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "id": "1",
          "type": "results",
          "attributes": {
            "name": "Result 2"
          }
      }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "results",
    "attributes": {
      "name": "Result 2",
      "archived": false
    },
    "relationships": {
      "assets": {
        "data": []
      },
      "tables": {
        "data": []
      },
      "result_texts": {
        "data": []
      },
      "comments": {
        "data": []
      }
    }
  }
}
```

This endpoint updates existing result in the selected task.
If submitted attributes are the same and no changes are made for the result, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve result from        |
| ID            | The ID of the result                              |

### Request body

```json
{
  "data": {
    "id": "1",
    "type": "results",
    "attributes": {
      "name": "Result 2"
    }
  }
}
```

### Result attributes

| Attribute   | Mandatory | Description             |
| ----------- | --------- | ----------------------- |
| name        | yes       | Name of the step        |

## Delete Result

```shell
curl -X DELETE \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific result from the task. Only archived results can be deleted.

### HTTP Request

`DELETE https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve result from        |
| ID            | The ID of the result                              |
