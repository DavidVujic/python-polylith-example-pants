resource(name="pyproject", source="pyproject.toml")

python_distribution(
    name="mydist",
    dependencies=[
        ":pyproject",
        "bases/example/greet_api:greet_api",
    ],
    provides=python_artifact(
        name="mydist",
        version="2.21.0",
    ),
    sdist = False,
    generate_setup = False,
)
