## Simple node express project generator
Creates the folder structure for a very simple express server.

nb: Created more for an example of using a `Makefile` for reasonably simple `cookiecutter` / `yeoman` type templates, than as an Express example.

---

### Create project
Create project, with default project name of `dummy`, and run
```bash
make init
cd dummy
make help
make run
```

To override defaults, with project name and listen port for Express:
```bash
make init PROJECT_NAME=myproject PROJECT_LIST_PORT=3000
```

#### Help
To display the available commands
```
make help
```

