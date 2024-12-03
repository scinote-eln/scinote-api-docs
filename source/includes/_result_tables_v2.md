# Result tables V2

## Get Result Tables

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/tables"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "tables",
      "attributes": {
        "name": "Table 1",
        "position": 0,
        "contents":  "{\"data\":[[\"1\",\"2\",\"3\"],[\"4\",\"5\",\"6\"]]}",
        "metadata": {
          "cells": [{"col": 0, "row": 0, "className": "htCenter"},
                    {"col": 0, "row": 1, "className": "htRight"},
                    {"col": 1, "row": 0, "className": "htLeft"},
                    {"col": 1, "row": 1, "className": "htJustify"}
                    {"col": 2, "row": 0, "className": "htMiddle htRight"},
                    {"col": 2, "row": 1, "className": "htBottom"}],
          "plateTemplate": true
        }
      }
    },
    {
      "id": "2",
      "type": "tables",
      "attributes": {
        "name": "Table 2",
        "position": 1,
        "contents": "{\"data\":[[\"1\",\"2\",\"3\"],[\"4\",\"5\",\"6\"]]}",
        "metadata": {
          "cells": [{"col": 0, "row": 0, "className": "htCenter"},
                    {"col": 0, "row": 1, "className": "htRight"},
                    {"col": 1, "row": 0, "className": "htLeft"},
                    {"col": 1, "row": 1, "className": "htJustify"}
                    {"col": 2, "row": 0, "className": "htMiddle htRight"},
                    {"col": 2, "row": 1, "className": "htBottom"}]
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/tables?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/tables?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/tables?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves tables from specific result.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<RESULT_ID>/tables(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                      |
| ------------- | -------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                      |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                   |
| TASK_ID       | The ID of the task to retrieve protocol from                                     |
| RESULT_ID     | The ID of the result to retrieve tables from                                     |
| FROM          | If present will filter result tables corresponding timestamp above or equals value |
| TO            | If present will filter result tables corresponding timestamp below or equals value |

## Get Result Table

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/tables/1"
  -H "Authorization: Bearer qwerty123456..."

```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "tables",
    "attributes": {
      "name": "Table 1",
      "position": 0,
      "contents":  "{\"data\":[[\"1\",\"2\",\"3\"],[\"4\",\"5\",\"6\"]]}",
      "metadata": {
        "cells": [{"col": 0, "row": 0, "className": "htCenter"},
                  {"col": 0, "row": 1, "className": "htRight"},
                  {"col": 1, "row": 0, "className": "htLeft"},
                  {"col": 1, "row": 1, "className": "htJustify"}
                  {"col": 2, "row": 0, "className": "htMiddle htRight"},
                  {"col": 2, "row": 1, "className": "htBottom"}],
        "plateTemplate": true
      }
    }
  }
}
```

This endpoint retrieves specific table from the result.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<RESULT_ID>/tables/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| RESULT_ID     | The ID of the result to retrieve table from       |
| ID            | The ID of the table                               |

## Create Result Table

```shell
curl -X POST \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/tables \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"data": {
		"type": "tables",
		"attributes": {
			"name": "New table",
			"contents":  "{\"data\":[[\"1\",\"2\",\"3\"],[\"4\",\"5\",\"6\"]]}",
      "metadata": {
        "cells": [{"col": 0, "row": 0, "className": ""},
                  {"col": 0, "row": 1, "className": "htRight"},
                  {"col": 1, "row": 0, "className": ""},
                  {"col": 1, "row": 1, "className": "htJustify"},
                  {"col": 2, "row": 0, "className": "htMiddle htRight"},
                  {"col": 2, "row": 1, "className": "htBottom"}],
        "plateTemplate": true
      }
		}
	}
}'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "3",
    "type": "tables",
    "attributes": {
      "name": "New table",
      "position": 0,
      "contents":  "{\"data\":[[\"1\",\"2\",\"3\"],[\"4\",\"5\",\"6\"]]}",
      "metadata": {
        "cells": [{"col": 0, "row": 0, "className": ""},
                  {"col": 0, "row": 1, "className": "htRight"},
                  {"col": 1, "row": 0, "className": ""},
                  {"col": 1, "row": 1, "className": "htJustify"}
                  {"col": 2, "row": 0, "className": "htMiddle htRight"},
                  {"col": 2, "row": 1, "className": "htBottom"}],
        "plateTemplate": true
      }
    }
  }
}
```

This endpoint creates new table in the result.

### HTTP Request

`POST https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<RESULT_ID>/tables`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| RESULT_ID     | The ID of the result to create table for       |

> Request body

```json
{
  "data": {
    "type": "tables",
    "attributes": {
      "name": "New table",
			"contents":  "{\"data\":[[\"1\",\"2\",\"3\"],[\"4\",\"5\",\"6\"]]}",
      "metadata": {
        "cells": [{"col": 0, "row": 0, "className": ""},
                  {"col": 0, "row": 1, "className": "htRight"},
                  {"col": 1, "row": 0, "className": ""},
                  {"col": 1, "row": 1, "className": "htJustify"}
                  {"col": 2, "row": 0, "className": "htMiddle htRight"},
                  {"col": 2, "row": 1, "className": "htBottom"}],
        "plateTemplate": true
      }
    }
  }
}
```

### Table attributes

| Attribute | Mandatory | Description                                                                                                                                                                                                                                                                                                                 |
| --------- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| name      | yes       | Name of the table                                                                                                                                                                                                                                                                                                           |
| contents  | no        | Serialized JSON representation of the table data                                                                                                                                                                                                                                                                            |
| metadata  | no        | JSON representation of the table metadata. `cells` represent the alignment of the specific table cell. Available `className` are `htCenter`, `htRight`, `htLeft`, `htJustify` for horizontal alignment, and `htTop`, `htMiddle`, `htBottom` for vertical alignment. `plateTemplate` field mark if table is a plate template |

## Update Result Table

```shell
curl -X PATCH \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/tables/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "id": "1",
          "type": "tables",
          "attributes": {
            "name": "Table 2",
            "contents":  "{\"data\":[[\"6\",\"5\",\"4\"],[\"3\",\"2\",\"1\"]]}",
            "metadata": {
              "cells": [{"col": 0, "row": 0, "className": ""},
                        {"col": 0, "row": 1, "className": "htRight"},
                        {"col": 1, "row": 0, "className": ""},
                        {"col": 1, "row": 1, "className": "htJustify"}
                        {"col": 2, "row": 0, "className": "htMiddle htRight"},
                        {"col": 2, "row": 1, "className": "htBottom"}],
              "plateTemplate": true
            }
          }
      }
  }'
```

> The above command returns JSON structured like this:

```json
{
    "data": {
      "id": "1",
      "type": "tables",
      "attributes": {
        "name": "Table 2",
        "position": 0,
        "contents":  "{\"data\":[[\"6\",\"5\",\"4\"],[\"3\",\"2\",\"1\"]]}",
        "metadata": {
          "cells": [{"col": 0, "row": 0, "className": ""},
                    {"col": 0, "row": 1, "className": "htRight"},
                    {"col": 1, "row": 0, "className": ""},
                    {"col": 1, "row": 1, "className": "htJustify"}
                    {"col": 2, "row": 0, "className": "htMiddle htRight"},
                    {"col": 2, "row": 1, "className": "htBottom"}],
          "plateTemplate": true
        }
      }
    }
}
```

This endpoint updates existing table in the selected result.
If submitted attributes are the same and no changes are made for the table, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<RESULT_ID>/tables/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| RESULT_ID     | The ID of the result to retrieve table from       |
| ID            | The ID of the table                               |

### Request body

```json
{
  "data": {
    "id": "1",
    "type": "tables",
    "attributes": {
      "name": "Table 2",
      "contents":  "{\"data\":[[\"6\",\"5\",\"4\"],[\"3\",\"2\",\"1\"]]}",
      "metadata": {
        "cells": [{"col": 0, "row": 0, "className": ""},
                  {"col": 0, "row": 1, "className": "htRight"},
                  {"col": 1, "row": 0, "className": ""},
                  {"col": 1, "row": 1, "className": "htJustify"}
                  {"col": 2, "row": 0, "className": "htMiddle htRight"},
                  {"col": 2, "row": 1, "className": "htBottom"}],
        "plateTemplate": true
      }
    }
  }
}
```

### Table attributes

| Attribute | Mandatory | Description                                                                                                                                                                                                                                                                                                                 |
| --------- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| name      | no        | Name of the table                                                                                                                                                                                                                                                                                                           |
| contents  | no        | Serialized JSON representation of the table data                                                                                                                                                                                                                                                                            |
| metadata  | no        | JSON representation of the table metadata. `cells` represent the alignment of the specific table cell. Available `className` are `htCenter`, `htRight`, `htLeft`, `htJustify` for horizontal alignment, and `htTop`, `htMiddle`, `htBottom` for vertical alignment. `plateTemplate` field mark if table is a plate template |

## Delete Result Table

```shell
curl -X DELETE \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/tables/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific table from the result.

### HTTP Request

`DELETE https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<RESULT_ID>/tables/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| RESULT_ID     | The ID of the result to retrieve table from       |
| ID            | The ID of the table                               |
