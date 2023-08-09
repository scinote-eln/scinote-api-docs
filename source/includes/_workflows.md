# Workflows

## Get Workflows

```shell
curl "http://<server-name>/api/v1/workflows"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "workflows",
      "attributes": {
        "name": "Default workflow",
        "description": "Default SciNote workflow",
        "visibility": "global",
        "team_id": null
      }
    }
  ]
}
```

This endpoint retrieves all wrokflows from instance.

### HTTP Request

`GET https://<server-name>/api/v1/workflows(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

| Parameter | Description                                                                      |
| --------- | -------------------------------------------------------------------------------- |
| FROM      | If present will filter experiments corresponding timestamp above or equals value |
| TO        | If present will filter experiments corresponding timestamp below or equals value |

## Get Workflow

This endpoint retrieves a specific workflow.

```shell
curl "http://<server-name>/api/v1/workflows/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "workflows",
    "attributes": {
      "name": "Default workflow",
      "description": "Default SciNote workflow",
      "visibility": "global",
      "team_id": null
    }
  }
}
```

### HTTP Request

`GET https://<server-name>/api/v1/workflows/<WORKFLOW_ID>`

### URL Parameters

| Parameter   | Description                        |
| ----------- | ---------------------------------- |
| WORKFLOW_ID | The ID of the workflow to retrieve |
