import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="helmbump",
    version="0.0.1",
    author="Arie Lev",
    author_email="levinson.arie@gmail.com",
    description="Helm charts version bumper",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/ArieLevs/HelmVersionBump",
    packages=setuptools.find_packages(),
    classifiers=(
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache License Version 2.0",
        "Operating System :: OS Independent",
    ),
)