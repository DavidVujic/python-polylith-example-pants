resource(name="message-pyproject", source="pyproject.toml")

python_distribution(
    name="message-fastapi-project",
    dependencies=[
        ":message-pyproject",
        "bases/example/message_api:message_api",
    ],
    provides=python_artifact(),
    generate_setup = False,
)