FROM lappis/botrequirements:boilerplate

ADD ./bot/actions/actions.py /bot/actions/actions.py
ADD ./coach/policy_config.yml /bot/actions/policy_config.yml
ADD ./bot/Makefile /bot/Makefile

WORKDIR bot/

RUN pip install --no-cache django-environ
EXPOSE 5055
HEALTHCHECK --interval=300s --timeout=60s --retries=5 \
  CMD curl -f http://0.0.0.0:5055/health || exit 1

CMD make run-actions
