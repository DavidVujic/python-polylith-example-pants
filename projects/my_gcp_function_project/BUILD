resource(name="gcp-function-pyproject", source="pyproject.toml")

python_distribution(
    name="my-gcp-function-project",
    dependencies=[
        ":gcp-function-pyproject",
        "bases/example/greet_gcp_function:greet_gcp_function",
    ],
    provides=python_artifact(),
    generate_setup = False,
)