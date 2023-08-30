# Workflow statuses

## Get Workflow statuses

```shell
curl "http://<server-name>/api/v1/workflows/1/statuses"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "workflow_statuses",
      "attributes": {
        "name": "Backlog",
        "description": null,
        "color": "#42f557",
        "previous_status_id": null
      }
    },
    {
      "id": "2",
      "type": "workflow_statuses",
      "attributes": {
        "name": "In progress",
        "description": null,
        "color": "#b9f542",
        "previous_status_id": 1
      }
    },
    {
      "id": "3",
      "type": "workflow_statuses",
      "attributes": {
        "name": "Completed",
        "description": null,
        "color": "#f5e342",
        "previous_status_id": 2
      }
    },
    {
      "id": "4",
      "type": "workflow_statuses",
      "attributes": {
        "name": "In review",
        "description": null,
        "color": "#f59c42",
        "previous_status_id": 3
      }
    },
    {
      "id": "5",
      "type": "workflow_statuses",
      "attributes": {
        "name": "Done",
        "description": null,
        "color": "#f59c42",
        "previous_status_id": 4
      }
    }
  ]
}
```

This endpoint retrieves wrokflow statuses from selected workflow.

### HTTP Request

`GET https://<server-name>/api/v1/workflows/WORKFLOW_ID/statuses(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter   | Description                                                                      |
| ----------- | -------------------------------------------------------------------------------- |
| WORKFLOW_ID | The ID of the workflow                                                           |
| FROM        | If present will filter experiments corresponding timestamp above or equals value |
| TO          | If present will filter experiments corresponding timestamp below or equals value |
