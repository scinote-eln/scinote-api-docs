# Direct File Uploads

In endpoints that include `attachments`, files are commonly uploaded by sending Base64 encoded content via the `file_data` attribute.

For large files, you can use an alternative upload flow (direct upload) and then create the attachment by providing `signed_blob_id` instead of `file_data`.

## How it works

1) Create a direct upload and receive a `signed_blob_id`.

2) Upload the raw file bytes to the provided storage URL.

3) Create the attachment resource using `signed_blob_id`.

## 1) Create a direct upload

Authenticate the request the same way as other SciNote endpoints (for example, with `Authorization: Bearer ...` or `Api-Key: ...`).

### HTTP Request

`POST https://<server-name>/rails/active_storage/direct_uploads`

### Request body

```json
{
  "blob": {
    "filename": "my_file.bin",
    "byte_size": 123,
    "checksum": "Base64EncodedMD5==",
    "content_type": "application/octet-stream"
  }
}
```

### Parameters

Parameter | Description
--------- | -----------
filename | File name (as it should appear in SciNote)
byte_size | File size in bytes
checksum | Base64 encoded MD5 checksum of the raw file bytes
content_type | MIME content type

### Example request

```shell
curl -X POST "https://<server-name>/rails/active_storage/direct_uploads" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer qwerty123456..." \
  -d '{
    "blob": {
      "filename": "my_file.bin",
      "byte_size": 123,
      "checksum": "Base64EncodedMD5==",
      "content_type": "application/octet-stream"
    }
  }'
```

> The response returns upload instructions and the signed blob id:

```json
{
  "signed_id": "...",
  "direct_upload": {
    "url": "https://<storage-provider-upload-url>",
    "headers": {
      "Content-Type": "application/octet-stream"
    }
  }
}
```

The `url` and `headers` values are provided by the storage backend and must be used exactly as returned.

## 2) Upload the file to the storage URL

Upload the file bytes with an HTTP `PUT` to the `direct_upload.url` using `direct_upload.headers`.

### Example request

```shell
curl -X PUT "https://<storage-provider-upload-url>" \
  -H "<header-from-direct_upload.headers>: <value>" \
  --data-binary "@./path/to/my_file.bin"
```

## 3) Create an attachment using `signed_blob_id`

When creating an attachment (any endpoint that accepts Base64 uploads via `file_data`), you can instead send `signed_blob_id`.

Use the `signed_blob_id` returned in step 1.

```json
{
  "data": {
    "type": "attachments",
    "attributes": {
      "signed_blob_id": "eyJfcmFpbHMiOnsiZGF0YSI6MjE5NSwicHVyIjoiYmxvYl9pZCJ9fQ==--212ce61956c4e0c92ea475d602acdb0a501d779d"
    }
  }
}
```

This is an alternative wherever Base64 encoding is used to upload files (i.e., wherever `file_data` is accepted).
