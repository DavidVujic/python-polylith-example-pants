resource(name="pyproject", source="pyproject.toml")

python_distribution(
    name="my-fastapi-project",
    dependencies=[
        ":pyproject",
        "components/example/greeting:greeting",
    ],
    provides=python_artifact(),
    sdist = False,
    generate_setup = False,
)
