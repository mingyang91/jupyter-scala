# This already contains the python, r, julia, latex, and nodejs runtimes
FROM jupyter/datascience-notebook:lab-3.2.6

USER root

RUN conda install --quiet --yes --freeze-installed -c conda-forge \
    'python-language-server' \
    'r-languageserver' \
    'texlab' \
    'chktex' \
    'jupyter-lsp=1.5.1' \
  && jupyter labextension install --no-build \
    '@krassowski/jupyterlab-lsp@3.10.0' \
  && jupyter lab build --dev-build=False --minimize=True \
  && conda clean --all -f -y \
  && rm -rf \
    $CONDA_DIR/share/jupyter/lab/staging \
    /home/$NB_USER/.cache/yarn \
  && fix-permissions $CONDA_DIR \
  && fix-permissions /home/$NB_USER

RUN apt update && apt install openjdk-11-jdk-headless -y

WORKDIR /opt/coursier
RUN curl -Lo coursier https://git.io/coursier-cli 
RUN chmod +x coursier 
RUN mkdir -p /usr/share/coursier/cache
RUN export COURSIER_CACHE=/usr/share/coursier/cache
RUN ./coursier launch --fork almond:0.11.1 --scala 2.13 -- --install --jupyter-path /opt/conda/share/jupyter/kernels

RUN ./coursier bootstrap org.scalameta:metals_2.12:0.7.0 --force-fetch -o metals -f

WORKDIR /home/jovyan

RUN chown -R 1000 .cache

RUN echo $' \n\
{"LanguageServerManager":{"language_servers":{"metals":{"version":2,"argv":["/opt/coursier/metals"],"languages":["scala"],"mime_types":["text/x-scala"]}}}}' >> /opt/conda/etc/jupyter/jupyter_server_config.d/metals-ls.json

USER 1000

ENV JUPYTER_ENABLE_LAB="true"
