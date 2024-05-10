resource(name="pyproject", source="pyproject.toml")

python_distribution(
    name="consumer-project",
    dependencies=[
        ":pyproject",
        "bases/example/greet_gcp_function:greet_gcp_function",
    ],
    provides=python_artifact(),
    generate_setup = False,
)