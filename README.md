# jupyter-scala

Jupyter Lab ❤️ Scala, integrating [almond](https://almond.sh/) and [metals-lsp](https://scalameta.org/metals/).

This project is all follow the [introduction](https://jupyterlab-lsp.readthedocs.io/en/latest/Installation.html) of JupyterLab lsp, especially [Scala Language Server (metals) integration](https://jupyterlab-lsp.readthedocs.io/en/latest/Configuring.html#example-scala-language-server-metals-integration) helped me extremely.

## Screenshot
![screenshot 1](/images/screenshot1.png "My Jupyter with scala")

## How to use

### Docker
You can use my built image for experience, just run this,
```
docker run -p 8888:8888 ghcr.io/mingyang91/jupyter-scala:latest
```
Then the jupyter token will print to console
```
Entered start.sh with args: jupyter lab
Executing the command: jupyter lab
[I 2022-01-13 07:13:20.826 ServerApp] jupyter_lsp | extension was successfully linked.
[I 2022-01-13 07:13:20.840 ServerApp] jupyterlab | extension was successfully linked.
[W 2022-01-13 07:13:20.845 NotebookApp] 'ip' has moved from NotebookApp to ServerApp. This config will be passed to ServerApp. Be sure to update your config before our next release.
[W 2022-01-13 07:13:20.845 NotebookApp] 'port' has moved from NotebookApp to ServerApp. This config will be passed to ServerApp. Be sure to update your config before our next release.
[W 2022-01-13 07:13:20.845 NotebookApp] 'port' has moved from NotebookApp to ServerApp. This config will be passed to ServerApp. Be sure to update your config before our next release.
[I 2022-01-13 07:13:20.854 ServerApp] Writing Jupyter server cookie secret to /home/jovyan/.local/share/jupyter/runtime/jupyter_cookie_secret
[I 2022-01-13 07:13:21.077 ServerApp] nbclassic | extension was successfully linked.
[I 2022-01-13 07:13:21.108 ServerApp] nbclassic | extension was successfully loaded.
[I 2022-01-13 07:13:21.699 ServerApp] Skipped non-installed server(s): bash-language-server, dockerfile-language-server-nodejs, javascript-typescript-langserver, jedi-language-server, julia-language-server, pyright, python-lsp-server, sql-language-server, typescript-language-server, unified-language-server, vscode-css-languageserver-bin, vscode-html-languageserver-bin, vscode-json-languageserver-bin, yaml-language-server
[I 2022-01-13 07:13:21.831 ServerApp] jupyter_lsp | extension was successfully loaded.
[I 2022-01-13 07:13:21.833 LabApp] JupyterLab extension loaded from /opt/conda/lib/python3.9/site-packages/jupyterlab
[I 2022-01-13 07:13:21.833 LabApp] JupyterLab application directory is /opt/conda/share/jupyter/lab
[I 2022-01-13 07:13:21.837 ServerApp] jupyterlab | extension was successfully loaded.
[I 2022-01-13 07:13:21.838 ServerApp] Serving notebooks from local directory: /home/jovyan
[I 2022-01-13 07:13:21.838 ServerApp] Jupyter Server 1.13.1 is running at:
[I 2022-01-13 07:13:21.838 ServerApp] http://ccb7df4fc2a8:8888/lab?token=44263c798de2f69610b325f9a83438cc32fb8acc6471fb93
[I 2022-01-13 07:13:21.838 ServerApp]  or http://127.0.0.1:8888/lab?token=44263c798de2f69610b325f9a83438cc32fb8acc6471fb93
[I 2022-01-13 07:13:21.838 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 2022-01-13 07:13:21.842 ServerApp]

    To access the server, open this file in a browser:
        file:///home/jovyan/.local/share/jupyter/runtime/jpserver-7-open.html
    Or copy and paste one of these URLs:
        http://ccb7df4fc2a8:8888/lab?token=44263c798de2f69610b325f9a83438cc32fb8acc6471fb93
     or http://127.0.0.1:8888/lab?token=44263c798de2f69610b325f9a83438cc32fb8acc6471fb93
[I 2022-01-13 07:13:31.647 LabApp] Build is up to date
[I 2022-01-13 07:13:32.724 ServerApp] Creating new notebook in
[I 2022-01-13 07:13:32.740 ServerApp] Writing notebook-signing key to /home/jovyan/.local/share/jupyter/notebook_secret
[I 2022-01-13 07:13:32.986 ServerApp] Kernel started: c61acd2f-c7f3-461f-a6bb-a1563ec88dbf
[I 2022-01-13 07:13:36.691 ServerApp] Adapting from protocol version 5.4 (kernel c61acd2f-c7f3-461f-a6bb-a1563ec88dbf) to 5.3 (client).
[I 2022-01-13 07:13:36.697 ServerApp] Adapting from protocol version 5.4 (kernel c61acd2f-c7f3-461f-a6bb-a1563ec88dbf) to 5.3 (client).
[I 2022-01-13 07:13:36.697 ServerApp] Adapting from protocol version 5.4 (kernel c61acd2f-c7f3-461f-a6bb-a1563ec88dbf) to 5.3 (client).
[I 2022-01-13 07:14:33.177 ServerApp] Starting buffering for c61acd2f-c7f3-461f-a6bb-a1563ec88dbf:f3f99a35-5f39-4ba3-988d-eccc6d89fb73
```
Click it

### Kubernetes
You can follow the [k8s.yaml](k8s.yaml) to build your own deploy, for development purpose
