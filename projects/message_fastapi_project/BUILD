resource(name="pyproject", source="pyproject.toml")

python_distribution(
    name="consumer-project",
    dependencies=[
        ":pyproject",
        "bases/example/message_api:message_api",
    ],
    provides=python_artifact(),
    generate_setup = False,
)