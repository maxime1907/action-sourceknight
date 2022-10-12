FROM python:3.10-slim

RUN apt update && apt install git jq -y

RUN pip install sourceknight yq
COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
