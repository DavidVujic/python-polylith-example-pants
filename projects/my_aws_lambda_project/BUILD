resource(name="pyproject", source="pyproject.toml")

python_distribution(
    name="consumer-project",
    dependencies=[
        ":pyproject",
        "bases/example/greet_aws_lambda:greet_aws_lambda",
    ],
    provides=python_artifact(),
    generate_setup = False,
)