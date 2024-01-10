# SciNote API documentation

This documentation is built using the [Slate](https://docs.slatejs.org/) framework.

## How to setup develoment environment

It's easy, please run the following commands:

`docker compose build`

And after you should run 

`docker compose up`

To preview your changes done in the documentation navigate to: http://localhost:4567

> [!NOTE] 
> You might want to use `docker-compose` command instead `docker compose` if you're running older version of docker

## How to push the documentation to the web

Simply run the following command:
`./deploy.sh`

It will deploy the documentation to corresponding github.io url