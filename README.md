# GENERAL
I made this simple public repository to share my solution about dockerizing a laravel application.
It works with WSL2 or not. It doesn't matter at all.

## How to use
- Just download the repository and place all the files in your laravel project root folder.
- Inside the docker/entrypoint.sh file, you can add any command you want to run before the container starts. As for migrations, seed, etc.
- Inside the laravel .env file, you need to specify the database host as `database`.
- To run the laravel container just type `docker-compose up -d` in your terminal. It will uses the laravel .env informations to create your database, so don't forget to set it up before running the container.
- To run a specific command inside the docker container, you can just type `docker ps` to see you container name or ID (or just watch it from docker-desktop app) and then type in your terminal: `docker exec <container-name> <command>`. For example: `docker exec laravel-app php artisan migrate:fresh --seed`

### Limitations & general informations
- Laravel will be on port 8000 of your localhost.
- You can't change mysql port, it will always be 3306. I don't know why but artisan won't work with a different port, even if you change it in the .env file and docker-compose.
- If you forget to create the .env file, the entrypoint.sh file will create it for you using the .env.example file.