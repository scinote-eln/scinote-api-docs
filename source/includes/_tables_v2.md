# Step tables V2

## Get Tables

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/tables"
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
          "sheet_name": "sheet name",
          "rows_size": [100, 100],
          "columns_size": [100, 100, 100],
          "cells": [{"col": 0, "row": 0},
                    {"col": 0, "row": 1},
                    {"col": 1, "row": 0},
                    {"col": 1, "row": 1}
                    {"col": 2, "row": 0},
                    {"col": 2, "row": 1}],
          "plateTemplate": true,
          "cells_merge": { "A1": [1, 2]},
          "cells_style": { "A2": "font-size:120px" },
          "cells_properties": [{ "x": 0, "y": 0, "properties": { "type": "text", "readOnly": true } } ],
          "columns_properties": [{ "x": 1, "properties": { "type": "text", "readOnly": true, "title": "title"  }}]
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
          "sheet_name": "sheet name",
          "rows_size": [100, 100],
          "columns_size": [100, 100, 100],
          "cells": [{"col": 0, "row": 0},
                    {"col": 0, "row": 1},
                    {"col": 1, "row": 0},
                    {"col": 1, "row": 1}
                    {"col": 2, "row": 0},
                    {"col": 2, "row": 1}],
          "plateTemplate": true,
          "cells_merge": { "A1": [1, 2]},
          "cells_style": { "A2": "font-size:120px" },
          "cells_properties": [{ "x": 0, "y": 0, "properties": { "type": "text", "readOnly": true } } ],
          "columns_properties": [{ "x": 1, "properties": { "type": "text", "readOnly": true, "title": "title"  }}]
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/tables?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/tables?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/tables?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves tables from specific step.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/tables(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                      |
| ------------- | -------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                      |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                   |
| TASK_ID       | The ID of the task to retrieve protocol from                                     |
| PROTOCOL_ID   | The ID of the protocol to retrieve step from                                     |
| STEP_ID       | The ID of the step to retrieve tables from                                       |
| FROM          | If present will filter step tables corresponding timestamp above or equals value |
| TO            | If present will filter step tables corresponding timestamp below or equals value |

## Get Table

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/tables/1"
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
        "sheet_name": "sheet name",
        "rows_size": [100, 100],
        "columns_size": [100, 100, 100],
        "cells": [{"col": 0, "row": 0},
                  {"col": 0, "row": 1},
                  {"col": 1, "row": 0},
                  {"col": 1, "row": 1}
                  {"col": 2, "row": 0},
                  {"col": 2, "row": 1}],
        "plateTemplate": true,
        "cells_merge": { "A1": [1, 2]},
        "cells_style": { "A2": "font-size:120px" },
        "cells_properties": [{ "x": 0, "y": 0, "properties": { "type": "text", "readOnly": true } } ],
        "columns_properties": [{ "x": 1, "properties": { "type": "text", "readOnly": true, "title": "title"  }}]
      }
    }
  }
}
```

This endpoint retrieves specific table from the step.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/tables/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve table from         |
| ID            | The ID of the table                               |

## Create Table

```shell
curl -X POST \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/tables \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"data": {
		"type": "tables",
		"attributes": {
			"name": "New table",
			"contents":  "{\"data\":[[\"1\",\"2\",\"3\"],[\"4\",\"5\",\"6\"]]}",
      "metadata": {
        "sheet_name": "sheet name",
        "cells": [{"col": 0, "row": 0, "className": ""},
                  {"col": 0, "row": 1, "className": "htRight"},
                  {"col": 1, "row": 0, "className": ""},
                  {"col": 1, "row": 1, "className": "htJustify"},
                  {"col": 2, "row": 0, "className": "htMiddle htRight"},
                  {"col": 2, "row": 1, "className": "htBottom"}],
        "plateTemplate": true,
        "rows_size": [100, 100],
        "columns_size": [100, 100, 100],
        "cells_merge": {"A1": [1, 2]},
        "cells_style": {"A2": "font-size:120px"},
        "cells_properties": [{"x": 0, "y": 0, "properties": { "readOnly": true, "type": "text" }}],
        "columns_properties": [{"x": 1, "properties": { "readOnly": true, "type": "text", "title": "title" }}]
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
        "sheet_name": "sheet name",
        "rows_size": [100, 100],
        "columns_size": [100, 100, 100],
        "cells": [{"col": 0, "row": 0},
                  {"col": 0, "row": 1},
                  {"col": 1, "row": 0},
                  {"col": 1, "row": 1}
                  {"col": 2, "row": 0},
                  {"col": 2, "row": 1}],
        "plateTemplate": true,
        "cells_merge": { "A1": [1, 2]},
        "cells_style": { "A2": "font-size:120px" },
        "cells_properties": [{ "x": 0, "y": 0, "properties": { "type": "text", "readOnly": true } } ],
        "columns_properties": [{ "x": 1, "properties": { "type": "text", "readOnly": true, "title": "title"  }}]
      }
    }
  }
}
```

This endpoint creates new table in the step.

### HTTP Request

`POST https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/tables`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to create table in             |

> Request body

```json
{
  "data": {
    "type": "tables",
    "attributes": {
      "name": "New table",
			"contents":  "{\"data\":[[\"1\",\"2\",\"3\"],[\"4\",\"5\",\"6\"]]}",
      "metadata": {
        "sheet_name": "sheet name",
        "rows_size": [100, 100],
        "columns_size": [100, 100, 100],
        "cells": [{"col": 0, "row": 0},
                  {"col": 0, "row": 1},
                  {"col": 1, "row": 0},
                  {"col": 1, "row": 1}
                  {"col": 2, "row": 0},
                  {"col": 2, "row": 1}],
        "plateTemplate": true,
        "cells_merge": { "A1": [1, 2]},
        "cells_style": { "A2": "font-size:120px" },
        "cells_properties": [{ "x": 0, "y": 0, "properties": { "type": "text", "readOnly": true } } ],
        "columns_properties": [{ "x": 1, "properties": { "type": "text", "readOnly": true, "title": "title"  }}]
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
| metadata  | no        | JSON representation of the table metadata. |


### Metadata attributes

| Attribute | Description |
| --------- | --------- | 
| sheet_name | The name of the table sheet. |
| cells | Applicable only for the open-source version. Represents the alignment of a specific table cell. Available `className` are `htCenter`, `htRight`, `htLeft`, `htJustify` (horizontal alignment) and `htTop`, `htMiddle`, `htBottom` (vertical alignment).|
| plateTemplate  | Indicates if the table is a plate template. |
| rows_size  | The height of each row in the table. |
| columns_size  | The width of each column in the table. |
| cells_merge  | Hash of values merge settings: each value is represented as `cell_coordinate` in the format [`number_of_columns`, `number_of_rows`].|
| cells_style  | A string representing the CSS style properties that define the appearance of a cell. |
| cells_properties  | Defines properties for each specific cell (`x` and `y`). Available properties are: `readOnly` (if `true`, the cell is locked) and `type` (available value: `text`). |
| columns_properties  | Defines properties for each column (`x`). Available properties are: `readOnly` (if `true`, the column is locked), `type` (available value: `text`), and `title` (the name of the column). |

## Update Table

```shell
curl -X PATCH \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/tables/1 \
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
              "sheet_name": "sheet name",
              "cells": [{"col": 0, "row": 0, "className": ""},
                        {"col": 0, "row": 1, "className": "htRight"},
                        {"col": 1, "row": 0, "className": ""},
                        {"col": 1, "row": 1, "className": "htJustify"},
                        {"col": 2, "row": 0, "className": "htMiddle htRight"},
                        {"col": 2, "row": 1, "className": "htBottom"}],
              "plateTemplate": true,
              "rows_size": [100, 100],
              "columns_size": [100, 100, 100],
              "cells_merge": {"A1": [1, 2]},
              "cells_style": {"A2": "font-size:120px"},
              "cells_properties": [{"x": 0, "y": 0, "properties": { "readOnly": true, "type": "text" }}],
              "columns_properties": [{"x": 1, "properties": { "readOnly": true, "type": "text", "title": "title" }}]
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
          "sheet_name": "sheet name",
          "rows_size": [100, 100],
          "columns_size": [100, 100, 100],
          "cells": [{"col": 0, "row": 0},
                    {"col": 0, "row": 1},
                    {"col": 1, "row": 0},
                    {"col": 1, "row": 1}
                    {"col": 2, "row": 0},
                    {"col": 2, "row": 1}],
          "plateTemplate": true,
          "cells_merge": { "A1": [1, 2]},
          "cells_style": { "A2": "font-size:120px" },
          "cells_properties": [{ "x": 0, "y": 0, "properties": { "type": "text", "readOnly": true } } ],
          "columns_properties": [{ "x": 1, "properties": { "type": "text", "readOnly": true, "title": "title"  }}]
        }
      }
    }
}
```

This endpoint updates existing table in the selected step.
If submitted attributes are the same and no changes are made for the table, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/tables/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve table from         |
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
        "sheet_name": "sheet name",
        "rows_size": [100, 100],
        "columns_size": [100, 100, 100],
        "cells": [{"col": 0, "row": 0},
                  {"col": 0, "row": 1},
                  {"col": 1, "row": 0},
                  {"col": 1, "row": 1}
                  {"col": 2, "row": 0},
                  {"col": 2, "row": 1}],
        "plateTemplate": true,
        "cells_merge": { "A1": [1, 2]},
        "cells_style": { "A2": "font-size:120px" },
        "cells_properties": [{ "x": 0, "y": 0, "properties": { "type": "text", "readOnly": true } } ],
        "columns_properties": [{ "x": 1, "properties": { "type": "text", "readOnly": true, "title": "title"  }}]
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
| metadata  | no        | JSON representation of the table metadata. |


### Metadata attributes

| Attribute | Description |
| --------- | --------- | 
| sheet_name | The name of the table sheet. |
| cells | Applicable only for the open-source version. Represents the alignment of a specific table cell. Available `className` are `htCenter`, `htRight`, `htLeft`, `htJustify` (horizontal alignment) and `htTop`, `htMiddle`, `htBottom` (vertical alignment).|
| plateTemplate  | Indicates if the table is a plate template. |
| rows_size  | The height of each row in the table. |
| columns_size  | The width of each column in the table. |
| cells_merge  | Hash of values merge settings: each value is represented as `cell_coordinate` in the format [`number_of_columns`, `number_of_rows`].|
| cells_style  | A string representing the CSS style properties that define the appearance of a cell. |
| cells_properties  | Defines properties for each specific cell (`x` and `y`). Available properties are: `readOnly` (if `true`, the cell is locked) and `type` (available value: `text`). |
| columns_properties  | Defines properties for each column (`x`). Available properties are: `readOnly` (if `true`, the column is locked), `type` (available value: `text`), and `title` (the name of the column). |

## Delete Table

```shell
curl -X DELETE \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/tables/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific table from the step.

### HTTP Request

`DELETE https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/tables/<ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve protocol from      |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from     |
| STEP_ID       | The ID of the step to retrieve tables from        |
| ID            | The ID of the table                               |
