# Tasks

## Get Tasks

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "tasks",
      "attributes": {
        "name": "Experiment design",
        "started_on": null,
        "due_date": "2018-10-25T13:30:54.315Z",
        "description": null,
        "state": "uncompleted",
        "archived": false,
        "status_id": 2,
        "status_name": "In progress",
        "prev_status_id": 1,
        "prev_status_name": "Backlog",
        "next_status_id": 3,
        "next_status_name": "Completed"
      },
      "relationships": {
        "outputs": {
          "data": [
            {
              "id": "2",
              "type": "tasks"
            }
          ]
        }
      }
    },
    {
      "id": "2",
      "type": "tasks",
      "attributes": {
        "name": "Sampling biological material",
        "started_on": null,
        "due_date": "2018-11-08T13:30:54.520Z",
        "description": null,
        "state": "uncompleted",
        "archived": false,
        "status_id": 3,
        "status_name": "Completed",
        "prev_status_id": 2,
        "prev_status_name": "Backlog",
        "next_status_id": 4,
        "next_status_name": "In review"
      },
      "relationships": {
        "outputs": {
          "data": [
            {
              "id": "3",
              "type": "tasks"
            }
          ]
        },
        "inputs": {
          "data": [
            {
              "id": "1",
              "type": "tasks"
            }
          ]
        }
      }
    },
    {
      "id": "3",
      "type": "tasks",
      "attributes": {
        "name": "RNA isolation",
        "started_on": null,
        "due_date": "2018-11-22T13:30:54.594Z",
        "description": null,
        "state": "uncompleted",
        "archived": false,
        "status_id": 2,
        "status_name": "In progress",
        "prev_status_id": 1,
        "prev_status_name": "Backlog",
        "next_status_id": 3,
        "next_status_name": "Completed"
      },
      "relationships": {
        "inputs": {
          "data": [
            {
              "id": "2",
              "type": "tasks"
            }
          ]
        }
      }
    }
  ],
  "links": {
    "self": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all tasks from a specific experiment. Task inputs/outputs can be included as relationships.
Optional URL parameter 'render_rte=true' can be added in order to request rendering of RTE fields(embedded images, smart annotations).
If `?include=comments` PATH parameter is provided, task comments are also included.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks(?include=<INCLUDES>&filter%5Barchived%5D=<ARCHIVED>&filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                              |
| ------------- | ---------------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                              |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                        |
| EXPERIMENT_ID | The ID of the experiment to retrieve tasks from                                          |
| INCLUDES      | if set to `comments`, task comments are also included                                    |
| ARCHIVED      | If set to `true` return only archived tasks. If set to `false` return only active tasks. |
| FROM          | If present will filter experiment tasks corresponding timestamp above or equals value    |
| TO            | If present will filter experiment tasks corresponding timestamp below or equals value    |

## Get Task

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "tasks",
    "attributes": {
      "name": "Experiment design",
      "started_on": null,
      "due_date": "2018-10-25T13:30:54.315Z",
      "description": null,
      "state": "uncompleted",
      "archived": false,
      "status_id": 2,
      "status_name": "In progress",
      "prev_status_id": 1,
      "prev_status_name": "Backlog",
      "next_status_id": 3,
      "next_status_name": "Completed"
    },
    "relationships": {
      "outputs": {
        "data": [
          {
            "id": "2",
            "type": "tasks"
          }
        ]
      }
    }
  }
}
```

This endpoint retrieves a specific task from a specific experiment. Task inputs/outputs can be included as relationships.
Optional URL parameter 'render_rte=true' can be added in order to request rendering of RTE fields(embedded images, smart annotations).
If `?include=comments` PATH parameter is provided, task comments are also included.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>(?include=<INCLUDES>)`

### URL Parameters

| Parameter     | Description                                           |
| ------------- | ----------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from           |
| PROJECT_ID    | The ID of the project to retrieve experiment from     |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from.       |
| TASK_ID       | The ID of the task to retrieve                        |
| INCLUDES      | if set to `comments`, task comments are also included |

## Create Task

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "type": "tasks",
      "attributes": {
        "name": "My task 1",
        "description": "Description of the task",
        "x": 1,
        "y": 8
      }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "tasks",
    "attributes": {
      "name": "My task 1",
      "started_on": null,
      "due_date": null,
      "description": "Description of the task",
      "state": "uncompleted",
      "archived": false
    },
    "relationships": {
      "outputs": {
        "data": []
      },
      "inputs": {
        "data": []
      }
    }
  }
}
```

This endpoint creates new task in the experiment. Please note that we will create the user assignments for this task asynchronous.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks`

### URL Parameters

| Parameter     | Description                                        |
| ------------- | -------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve projects from       |
| PROJECT_ID    | The ID of the project to retrieve experiments from |
| EXPERIMENT_ID | The ID of the experiment                           |

> Request body

```json
{
  "data": {
    "type": "tasks",
    "attributes": {
      "name": "My task 1",
      "description": "Description of the task",
      "x": 1,
      "y": 8
    }
  }
}
```

### Task attributes

| Attribute   | Mandatory | Description             |
| ----------- | --------- | ----------------------- |
| name        | yes       | Name of the task        |
| description | no        | Description of the task |
| x           | yes       | x position on canvas    |
| y           | yes       | y position on canvas    |

## Update Task

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "id": "1",
          "type": "tasks",
          "attributes": {
            "name": "Task 2",
            "description": "Task 2 description",
            "my_module_status_id": "2"
          }
      }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "tasks",
    "attributes": {
      "name": "Task 2",
      "started_on": null,
      "due_date": null,
      "description": "Task 2 description",
      "state": "completed",
      "archived": false,
      "status_id": 2,
      "status_name": "in progress",
      "prev_status_id": 1,
      "prev_status_name": "backlog",
      "next_status_id": 3,
      "next_status_name": "review"
    },
    "relationships": {
      "outputs": {
        "data": []
      },
      "inputs": {
        "data": []
      }
    }
  }
}
```

This endpoint updates existing task in the selected experiment.
If submitted attributes are the same and no changes are made for the task, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| ID            | The ID of the task                                |

### Request body

```json
{
  "data": {
    "id": "1",
    "type": "tasks",
    "attributes": {
      "name": "Task 2",
      "description": "Task 2 description",
      "my_module_status_id": "2",
      "metadata": {
        "status": "processing"
      }
    }
  }
}
```

### Task attributes

| Attribute           | Mandatory | Description                                               |
| ------------------- | --------- | --------------------------------------------------------- |
| name                | yes       | Name of the task                                          |
| description         | no        | Description of the task                                   |
| x                   | no        | x position on canvas                                      |
| y                   | no        | y position on canvas                                      |
| my_module_status_id | no        | New status ID                                             |
| matadata            | no        | A JSON format metadata object, for storing arbitrary data |

## Task Metadata

This API supports advanced filtering using metadata fields embedded in each task record. These metadata fields can be used as dynamic filters via the filter[metadata] parameter in the query string. Additionally, metadata can be explicitly returned in API responses by using the query parameter with-metadata=true.

### Filtering Tasks by Metadata

You can filter tasks using custom metadata key-value pairs by including them in the filter[metadata] query parameter. The value should be a JSON object encoded in the query string.

Note: All metadata keys and values must be strings.

### Example HTTP Request

Example filtering tasks where metadata contains key status with the value processing:

`GET https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks?filter[metadata][status]=processing`

You can also include multiple metadata key-value pairs:

`GET https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks?filter[metadata][status]=processing&filter[metadata][external_id]=T1337`

This will return tasks where metadata includes both "status": "processing" and "external_id": "T1337".
Including Metadata in the Response

To include the metadata field in the JSON response, use the query parameter:
`with-metadata=true`

### Combined Example

`GET https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks?filter[metadata][priority]=high&with-metadata=true`

This will return all tasks that contain metadata with key priority set to high, and also include the metadata field in the task response.

If with-metadata is not set to true, metadata fields will not be shown in the response, even if data exists.
