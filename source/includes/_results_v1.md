# Results V1(Deprecated)

## Get Results (Deprecated)

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/results"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
    "data": [
        {
            "id": "1",
            "type": "results",
            "attributes": {
                "name": "Result 1",
                "archived": false
            },
            "relationships": {
                "user": {
                    "data": {
                        "id": "1",
                        "type": "users"
                    }
                },
                "text": {
                    "data": {
                        "id": "1",
                        "type": "result_texts"
                    }
                }
            }
        },
        {
            "id": "2",
            "type": "results",
            "attributes": {
                "name": "Result 2",
                "archived": false
            },
            "relationships": {
                "user": {
                    "data": {
                        "id": "1",
                        "type": "users"
                    }
                },
                "table": {
                    "data": {
                        "id": "1",
                        "type": "result_tables"
                    }
                }
            }
        },
        {
            "id": "3",
            "type": "results",
            "attributes": {
                "name": "Result 3",
                "archived": false,
            },
            "relationships": {
                "user": {
                    "data": {
                        "id": "1",
                        "type": "users"
                    }
                },
                "file": {
                    "data": {
                        "id": "1",
                        "type": "result_files"
                    }
                }
            }
        }
    ],
    "included": [
        {
            "id": "1",
            "type": "result_texts",
            "attributes": {
                "text": "Result 1 Text"
            }
        },
        {
            "id": "1",
            "type": "result_tables",
            "attributes": {
                "table_id": 1,
                "table_contents": <table-contents>,
                "metadata": {
                  "cells": [
                    {"col": 0, "row": 0, "className": ""},
                    {"col": 0, "row": 1, "className": ""}
                  ]
                }
            }
        },
        {
            "id": "1",
            "type": "result_files",
            "attributes": {
                "file_id": 1,
                "file_name": <file-name>,
                "file_size": 69,
                "url": <file-url>
            }
        }
    ],
    "links": {
        "self": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/results?page%5Bnumber%5D=1&page%5Bsize%5D=10",
        "first": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/results?page%5Bnumber%5D=1&page%5Bsize%5D=10",
        "prev": null,
        "next": null,
        "last": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/results?page%5Bnumber%5D=1&page%5Bsize%5D=10"
    }
  }
```

This endpoint retrieves all results from the task. Texts, files and tables are included by default.
If `?include=comments` PATH parameter is provided, result comments are also included.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results(?include=<INCLUDES>&filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

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

## Get Result (Deprecated)

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/results/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "results",
    "attributes": {
      "name": "Result 1",
      "archived": false
    },
    "relationships": {
      "user": {
        "data": {
          "id": "1",
          "type": "users"
        }
      },
      "text": {
        "data": {
          "id": "1",
          "type": "result_texts"
        }
      }
    }
  },
  "included": [
    {
      "id": "1",
      "type": "result_texts",
      "attributes": {
        "text": "Result 1 Text"
      }
    }
  ]
}
```

This endpoint retrieves specific result. Text, file or table is included by default.
If `?include=comments` PATH parameter is provided, result comments are also included.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<ID>(?include=<INCLUDES>)`

### URL Parameters

| Parameter     | Description                                             |
| ------------- | ------------------------------------------------------- |
| TEAM_ID       | The ID of the team                                      |
| PROJECT_ID    | The ID of the project                                   |
| EXPERIMENT_ID | The ID of the experiment                                |
| TASK_ID       | The ID of the task                                      |
| ID            | The ID of the result                                    |
| INCLUDES      | if set to `comments`, result comments are also included |

## Create Result (Deprecated)

### with Text Result and TinyMCE images

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/results \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "type": "results",
      "attributes": {
        "name": "Result 1"
      }
    },
    "included": [
      {
        "type": "result_texts",
        "attributes": {
          "text": "Result text 1 [~tiny_mce_id:a1]"
        }
      },
      {
        "type": "tiny_mce_assets",
        "attributes": {
          "file_data": "data:image/png;base64,qwerty123456...",
          "file_token": "a1",
          "file_name": "test.png"
        }
      }
    ]
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "results",
    "attributes": {
      "name": "Result 1",
      "archived": false
    },
    "relationships": {
      "user": {
        "data": {
          "id": "1",
          "type": "users"
        }
      },
      "text": {
        "data": {
          "id": "1",
          "type": "result_texts"
        }
      }
    }
  },
  "included": [
    {
      "id": "1",
      "type": "result_texts",
      "attributes": {
        "text": "Result [~tiny_mce_id:1]"
      }
    }
  ]
}
```

This endpoint creates new result, also result text can be added inside "included" section in the same request along with TinyMCE images. Please reference to the sample request.

Images should be base64 encoded in such format: `data:image/png;base64,<FILE_CONTENT>`, where FILE_CONTENT is base64 encoded image file. It should be referenced inside result text with unique token using this format: `[~tiny_mce_id:<TOKEN>]`.
Token should be string without special symbols.

### with File Result

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/results \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "attributes": {
        "name": "My Result"
      },
      "type": "results"
    },
    "included": [
      {
        "attributes": {
          "file_name": "my_file.png",
          "file_type": "image/png",
          "file_data": "Base64EncodedData"
        },
        "type": "result_files"
      }
    ]
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "results",
    "attributes": {
      "name": "My Result",
      "archived": false
    },
    "relationships": {
      "user": {
        "data": {
          "id": "1",
          "type": "users"
        }
      },
      "file": {
        "data": {
          "id": "1",
          "type": "result_files"
        }
      }
    }
  },
  "included": [
    {
      "id": "1",
      "type": "result_files",
      "attributes": {
        "file_id": "1",
        "file_name": "my_file.png",
        "file_size": "4213",
        "url": "/rails/active_storage/blobs/<asset_signed_id>/my_file?disposition=attachment"
      }
    }
  ]
}
```

This endpoint creates new result, also result file can be added inside "included" section in the same request. Please reference to the sample request.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results`

### URL Parameters

| Parameter     | Description              |
| ------------- | ------------------------ |
| TEAM_ID       | The ID of the team       |
| PROJECT_ID    | The ID of the project    |
| EXPERIMENT_ID | The ID of the experiment |
| TASK_ID       | The ID of the task       |

> Request body with ResultText

```json
{
  "data": {
    "type": "results",
    "attributes": {
      "name": "Result 1"
    }
  },
  "included": [
    {
      "type": "result_texts",
      "attributes": {
        "text": "Result [~tiny_mce_id:a1]..."
      }
    },
    {
      "type": "tiny_mce_assets",
      "attributes": {
        "file_data": "data:image/png;base64,qwerty123456...",
        "file_token": "a1",
        "file_name": "test.png"
      }
    }
  ]
}
```

> Request body with ResultFile

```json
{
  "data": {
    "attributes": {
      "name": "Result1"
    },
    "type": "results"
  },
  "included": [
    {
      "attributes": {
        "file_name": "my_file.png",
        "file_type": "image/png",
        "file_data": "Base64EncodedData"
      },
      "type": "result_files"
    }
  ]
}
```

### Result attributes

| Attribute | Mandatory | Description        |
| --------- | --------- | ------------------ |
| name      | yes       | Name of the result |

### Result text attributes

| Attribute | Mandatory | Description    |
| --------- | --------- | -------------- |
| text      | yes       | Text of result |

### TinyMCE attributes

| Attribute  | Mandatory | Description                                                                     |
| ---------- | --------- | ------------------------------------------------------------------------------- |
| file_data  | yes       | Image file encoded in the string, "data:image/png;base64,<BASE64_ENCODED_FILE>" |
| file_token | yes       | Unique token used for referencing inside result text                            |
| file_name  | yes       | Name of the file                                                                |

### Result file attributes

| Attribute | Mandatory | Description         |
| --------- | --------- | ------------------- |
| file_name | yes       | File name           |
| file_type | yes       | MIME content type   |
| file_data | yes       | Base64 Encoded data |

## Update Result (Deprecated)

### with File Result

```shell
curl -X PUT \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/results/1 \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
      "data": {
        "attributes": {
          "name": "Result with new name"
        },
        "type": "results"
      },
      "included": [
        {
          "attributes": {
            "file_name": "new_file.png",
            "file_type": "image/png",
            "file_data": "Base64EncodedData"
          },
          "type": "result_files"
        }
      ]
    }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "results",
    "attributes": {
      "name": "Result with new name",
      "archived": false
    },
    "relationships": {
      "user": {
        "data": {
          "id": "1",
          "type": "users"
        }
      },
      "file": {
        "data": {
          "id": "1",
          "type": "result_files"
        }
      }
    }
  },
  "included": [
    {
      "id": "1",
      "type": "result_files",
      "attributes": {
        "file_id": "1",
        "file_name": "new_file.png",
        "file_size": "4213",
        "url": "/rails/active_storage/blobs/<asset_signed_id>/my_file?disposition=attachment"
      }
    }
  ]
}
```

This endpoint updates result, also result file can be added inside "included" section in the same request. Please reference to the sample request.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<ID>`

### URL Parameters

| Parameter     | Description              |
| ------------- | ------------------------ |
| TEAM_ID       | The ID of the team       |
| PROJECT_ID    | The ID of the project    |
| EXPERIMENT_ID | The ID of the experiment |
| TASK_ID       | The ID of the task       |
| ID            | The ID of the result     |

> Request body

```json
{
  "data": {
    "attributes": {
      "name": "Result with ne name"
    },
    "type": "results"
  },
  "included": [
    {
      "attributes": {
        "file_name": "new_file.png",
        "file_type": "image/png",
        "file_data": "Base64EncodedData"
      },
      "type": "result_files"
    }
  ]
}
```

### Result attributes

| Attribute | Mandatory | Description        |
| --------- | --------- | ------------------ |
| name      | yes       | Name of the result |

### Result file attributes

| Attribute | Mandatory | Description         |
| --------- | --------- | ------------------- |
| file_name | yes       | File name           |
| file_type | yes       | MIME content type   |
| file_data | yes       | Base64 Encoded data |
