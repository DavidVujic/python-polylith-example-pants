resource(name="consumer-pyproject", source="pyproject.toml")

python_distribution(
    name="consumer-project",
    dependencies=[
        ":consumer-pyproject",
        "bases/example/consumer:consumer",
    ],
    provides=python_artifact(),
    generate_setup = False,
)