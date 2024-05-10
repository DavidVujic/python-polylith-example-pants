# Python Polylith Example

This is a repository with an example `Python` setup of the Polylith Architecture using `pants`.
Here you will find examples of code being shared between different kind of projects,
and the developer tooling setup.

Have a look at this repository for more information and documentation:
[Python tools for the Polylith Architecture](https://github.com/DavidVujic/python-polylith)


## Pants and Polylith
A big part of the Developer Experience with Polylith is having access to all of the code in the
Monorepo, including the third-party dependencies. Having access to Python code
from a REPL and an IDE would require an existing __virtual environment__.

__Pants__ has really good support for creating virtual environments.

In the Python Community, there is a convention to name the environment in a certain way, usually _.venv_,
and create it at the Project root (this will play nice with your IDE). The virtual environment
created by Pants is created in a `dists` folder, and further in a Pants-specific folder structure.

In addition to the `.venv`, package management tools like _Poetry_, _Hatch_ and _PDM_ have support for
configuring custom source paths. This is useful for the IDE to locate Python source code (especially in Monorepos).

This is usually accomplished by creating a `.pth` file, that is stored in the `site_packages` folder of the virtual environment.
Tools like _Poetry_, _Hatch_ and _PDM_ do that when the virtual environment is created.

With a `.pth` file in place, you will be able to navigate the Python source code from the IDE as expected.

### A custom bash script
At the root of this repo, you will find a `generate-venv.sh` script, that will create a `.venv` with a `.pth` file.
You should now be all set!

### The Polylith CLI
By adding the `polylith-cli` library to the top `pyproject.toml`, the `poly` command will be available in the virtual environment.

Activate the virtual environment:

``` shell
source .venv/bin/activate
```

You have now access to all the `poly` commands.

Example:
``` shell
poly info
```

### The REPL
With the virtual environment activated, you can also run code using your favorite REPL:

``` shell
ipython
```

### Packaging projects
Packaging a project can be done using Pants.

Example: creating a `wheel` and an `sdist` for the _my-fastapi-project_
``` shell
pants package projects/my_fastapi_project:my-fastapi-project
```

#### PEP 517
Pants will expect a `BUILD` file in the project folder. The `pants package` goal has support for the
__PEP 517__ specification.

__Polylith__ is using the `pyproject.toml` to define the used _bricks_ in a project.
By adding __Hatchling__ as the build backend, __Pants__ will act as the build frontend for it
and the artifacts will be created according to what's defined in the `pyproject.toml`.

The BUILD file of a project:
add the `pyproject.toml` and the entry point as dependencies.

``` python
resource(name="pyproject", source="pyproject.toml")

python_distribution(
    name="my-fastapi-project",
    dependencies=[
        ":pyproject",
        "bases/example/greet_api:greet_api",
    ],
    provides=python_artifact(),
    generate_setup = False,
)
```

#### A project-specific configuration

Example, the build backend:
``` toml
[build-system]
requires = ["hatchling", "hatch-polylith-bricks"]
build-backend = "hatchling.build"
```

Example, the Polylith bricks:
``` toml
[tool.hatch.build.hooks.polylith-bricks]

[tool.polylith.bricks]
"../../bases/example/greet_api" = "example/greet_api"
"../../components/example/greeting" = "example/greeting"
"../../components/example/log" = "example/log"
```
