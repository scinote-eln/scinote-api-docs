# Result Attachments V2

## Get Result Attachments

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/attachments"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "attachments",
      "attributes": {
        "file_name": "my_image1.png",
        "file_size": 132441,
        "file_type": "image/png",
        "file_url": "http://<server-name>/rails/active_storage/blobs/<asset_signed_id>/my_image1?disposition=attachment"
      },
      "relationships": {
        "result": {
          "data": {
            "id": "1",
            "type": "results"
          }
        }
      }
    },
    {
      "id": "2",
      "type": "attachments",
      "attributes": {
        "file_name": "my_image2.png",
        "file_size": 270369,
        "file_type": "image/png",
        "file_url": "http://<server-name>/rails/active_storage/blobs/<asset_signed_id>/my_image2?disposition=attachment"
      },
      "relationships": {
        "result": {
          "data": {
            "id": "1",
            "type": "results"
          }
        }
      }
    },
    {
      "id": "3",
      "type": "attachments",
      "attributes": {
        "file_name": "my_image3.png",
        "file_size": 91435,
        "file_type": "image/png",
        "file_url": "http://<server-name>/rails/active_storage/blobs/<asset_signed_id>/my_image3?disposition=attachment"
      },
      "relationships": {
        "result": {
          "data": {
            "id": "1",
            "type": "results"
          }
        }
      }
    }
  ],
  "links": {
    "self": "http://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/attachments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/attachments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/attachments?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves attachments from specific result.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<RESULT_ID>/attachments`
### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
RESULT_ID       | The ID of the result to retrieve attachments from

## Get Result Attachment

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/attachments/1"
  -H "Authorization: Bearer qwerty123456..."
  
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "attachments",
    "attributes": {
      "file_name": "my_image1",
      "file_size": 35038,
      "file_type": "image/png",
      "file_url": "http://<server-name>/rails/active_storage/blobs/<asset_signed_id>/my_image1?disposition=attachment"
    },
    "relationships": {
      "result": {
        "data": {
          "id": "1",
          "type": "results"
        }
      }
    }
  }
}
```

This endpoint retrieves specific attachment from the result.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<RESULT_ID>/attachments/<ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
RESULT_ID       | The ID of the result to retrieve attachment from
ID              | The ID of the attachment

## Create Result Attachment

```shell
curl -X POST \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/results/1/attachments \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/json' \
  -d'{
    "data": {
      "attributes": {
        "file_name": "my_file.png",
        "file_type": "image/png",
        "file_data": "iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAIAAAD91JpzAAAACXBIWXMAAC4jAAAuIwF4pT92AAAAE0lEQVQIHWP8//8/AwMDExADAQAkBgMBOOSShwAAAABJRU5ErkJggg=='\''"
      },
      "type": "attachments"
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "attachments",
    "attributes": {
      "file_name": "my_image1.png",
      "file_size": 35038,
      "file_type": "image/png",
      "file_url": "http://<server-name>/rails/active_storage/blobs/<asset_signed_id>/my_image1.png?disposition=attachment"
    },
    "relationships": {
      "result": {
        "data": {
          "id": "1",
          "type": "results"
        }
      }
    }
  }
}

```

This endpoint uploads new attachment to the result.

### HTTP Request

`POST https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/results/<RESULT_ID>/attachments`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve experiment from
EXPERIMENT_ID   | The ID of the experiment to retrieve task from
TASK_ID         | The ID of the task to retrieve protocol from
RESULT_ID       | The ID of the result to create attachment for

> Request body

```json
{
  "data": {
    "type": "attachments",
    "attributes": {
      "file_name": "my_file.png",
      "file_type": "image/png",
      "file_data": "Base64EncodedData"
    }
  }
}
```

### Attachment attributes

Attribute   | Mandatory| Description
---------   | -------- | -----------
file_name   | yes      | File name
file_type   | yes      | MIME content type
file_data   | yes      | Base64 Encoded data
