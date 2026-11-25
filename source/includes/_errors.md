# Errors

The API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid, for example a validation failed (missing value in a mandatory inventory column, duplicate value where unique entries are enforced).
401 | Unauthorized -- Your API key is wrong.
403 | Forbidden -- You don't have permission to access it.
404 | Not Found -- The specified entity could not be found.
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.

Errors are returned in the `errors` array of the response body. A request can return more than one error, for example one per missing mandatory inventory column:

```json
{
  "errors": [
    {
      "id": "1a2b3c4d-...",
      "status": 400,
      "title": "Mandatory inventory column",
      "detail": "Batch number column with id 3 is mandatory"
    }
  ]
}
```
