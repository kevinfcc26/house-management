# 
FROM python:3.12

# 
WORKDIR /app

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

# Copy poetry.lock* in case it doesn't exist in the repo
COPY ./pyproject.toml ./poetry.lock* /app/

RUN poetry install

# 
COPY ./ /app/

# 
# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
