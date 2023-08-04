# Reports

## Get Reports

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/reports"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "reports",
      "attributes": {
        "name": "Report 1",
        "description": "My report",
        "pdf_file_size": 1234,
        "pdf_file_url": "http://example.com/report.pdf",
        "docx_file_size": 1234,
        "docx_file_url": "http://example.com/report.docx"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "1",
            "type": "users"
          }
        }
      }
    }
  ],
  "links": {
    "self": "http://<server-name>/api/v1/teams/1/projects/1/reports?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/1/reports?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/projects/1/reports?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves reports from specific project. PDF and DOCX attributes will be included only if files are generated.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/reports(?created_at[from]=<FROM>&created_at[to]=<TO>&updated_at[from]=<FROM>&updated_at[to]=<TO>)`

### URL Parameters

| Parameter  | Description                                                                          |
| ---------- | ------------------------------------------------------------------------------------ |
| TEAM_ID    | The ID of the team to retrieve project from                                          |
| PROJECT_ID | The ID of the project to retrieve reports from                                       |
| FROM       | If present will filter project reports corresponding timestamp above or equals value |
| TO         | If present will filter project reports corresponding timestamp below or equals value |

## Get Report

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/reports/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "reports",
    "attributes": {
      "name": "Report 1",
      "description": "My report",
      "pdf_file_size": 1234,
      "pdf_file_url": "http://example.com/report.pdf",
      "docx_file_size": 1234,
      "docx_file_url": "http://example.com/report.docx"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "1",
          "type": "users"
        }
      }
    }
  },
  "included": [
    {
      "id": "1",
      "type": "users",
      "attributes": {
        "full_name": "Admin",
        "initials": "A",
        "email": "admin@scinote.net",
        "avatar_url": "http://example.com/avatar.png",
        "avatar_file_size": 16181,
        "avatar_file_name": "avatar.png"
      }
    }
  ]
}
```

This endpoint retrieves a specific report from specific project. PDF and DOCX attributes will be included only if files are generated.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/reports/<REPORT_ID>`

### URL Parameters

| Parameter  | Description                                   |
| ---------- | --------------------------------------------- |
| TEAM_ID    | The ID of the team to retrieve project from   |
| PROJECT_ID | The ID of the project to retrieve report from |
| REPORT_ID  | The ID of the report to retrieve              |
