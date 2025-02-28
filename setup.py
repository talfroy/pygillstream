from setuptools import setup, find_packages

setup(
    name='pygillstream',
    version='0.1.2',
    packages=find_packages(),
    install_requires=['requests>=2.24.0'],  # If you have dependencies, list them here
    author='Thomas Holterbach and Thomas Alfroy',
    author_email='contact@bgproutes.io',
    description='A Python library to get BGP data from GILL',
    url='https://forge.icube.unistra.fr/thomas.alfroy/pygillstream',  # Update this to your repo URL
    classifiers=[ ],
    python_requires='>=3.6'
)
