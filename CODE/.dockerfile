FROM python:3.11

# Update package list
RUN apt-get update
# Install sqlite3
RUN apt-get -y install sqlite3

# Set up and activate virtual environment
ENV VIRTUAL_ENV "/venv"
RUN python -m venv $VIRTUAL_ENV
ENV PATH "$VIRTUAL_ENV/bin:$PATH"

# Install dependencies
RUN pip install --upgrade pip
COPY python-requirements.txt .
RUN pip install -r python-requirements.txt

# Copy source code
COPY . .
# Setup pre-commit
RUN pre-commit install

# Run the application
# CMD ["python", "app.py"]
