resource(name="aws-lambda-pyproject", source="pyproject.toml")

python_distribution(
    name="my-aws-lambda-project",
    dependencies=[
        ":aws-lambda-pyproject",
        "bases/example/greet_aws_lambda:greet_aws_lambda",
    ],
    provides=python_artifact(),
    generate_setup = False,
)