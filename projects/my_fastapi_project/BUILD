resource(name="my-fastapi-pyproject", source="pyproject.toml")

python_distribution(
    name="my-fastapi-project",
    dependencies=[
        ":my-fastapi-pyproject",
        "bases/example/greet_api:greet_api",
    ],
    provides=python_artifact(),
    generate_setup = False,
)
