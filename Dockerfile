FROM jnstockley/poetry:1.8.3-python3.12.6

USER root

RUN mkdir /bsn

RUN chown -R python3:python3 /bsn

USER python3

ENV PYTHONPATH=/bsn:$PYTHONPATH

COPY pyproject.toml /bsn

COPY poetry.lock /bsn

WORKDIR /bsn/src

RUN poetry install

COPY src /bsn/src

ENTRYPOINT ["poetry", "run", "python", "main.py"]
