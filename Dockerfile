FROM python:3.10-slim

RUN apt update && apt install git jq -y --no-install-recommends

RUN pip install git+https://github.com/maxime1907/sourceknight@fixrequirements yq

COPY "entrypoint.sh" "/entrypoint.sh"

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["--help"]
